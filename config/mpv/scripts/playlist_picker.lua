-- playlist_picker.lua
-- Browse folders under ~/vids and load them as playlists, plus a persistent
-- cross-folder "watchlist" you build up with a keypress.
--
--   Ctrl+v  toggle the picker (the pinned "⭐ Watchlist" entry loads the list)
--   A       add the currently-playing file to the watchlist
--   X       remove the currently-playing file from the watchlist
--   In the picker: UP/DOWN or j/k navigate, ENTER load, ESC/q close.

local utils = require 'mp.utils'
local msg = require 'mp.msg'

-- Configuration options (override in script-opts/playlist_picker.conf)
local settings = {
    root_directory = "~/vids",
    watchlist_file = "~/.config/mpv/watchlist.m3u",
    media_extensions = "mp4,webm,mkv,avi,mov,flv,wmv,mp3,wav,flac,m4a,m4v",
    max_visible = 15,
    key_toggle = "ctrl+v",
    key_add = "A",
    key_remove = "X",
}

require 'mp.options'
read_options(settings, "playlist_picker")

-- Helper to expand ~ in paths
local function expand_path(path)
    if path:sub(1, 1) == "~" then
        local home = os.getenv("HOME") or os.getenv("USERPROFILE")
        if home then
            path = home .. path:sub(2)
        end
    end
    return path
end

local root_dir = expand_path(settings.root_directory)
local watchlist_path = expand_path(settings.watchlist_file)

local media_extensions = {}
for ext in string.gmatch(settings.media_extensions, "[^,]+") do
    -- extra parens truncate gsub's 2nd return (the substitution count) so
    -- table.insert receives one value, not (string, count).
    table.insert(media_extensions, (ext:lower():gsub("%s+", "")))
end

local active = false
local items = {}          -- menu entries: {kind="watchlist"} | {kind="folder", path=, label=}
local selected_idx = 1
local max_visible = settings.max_visible

local function is_media_file(entry)
    local ext = entry:match("^.+%.(.+)$")
    if not ext then return false end
    ext = ext:lower()
    for _, media_ext in ipairs(media_extensions) do
        if ext == media_ext then return true end
    end
    return false
end

-- Recursively find folders that directly contain media files.
local function scan_dir(dir, dirs_list)
    local entries = utils.readdir(dir)
    if not entries then return end

    local has_media = false
    local subdirs = {}

    for _, entry in ipairs(entries) do
        if not entry:match("^%.") then          -- skip hidden
            local full_path = utils.join_path(dir, entry)
            local info = utils.file_info(full_path)
            if info then
                if info.is_dir then
                    table.insert(subdirs, full_path)
                elseif info.is_file and is_media_file(entry) then
                    has_media = true
                end
            end
        end
    end

    if has_media then
        table.insert(dirs_list, dir)
    end
    for _, subdir in ipairs(subdirs) do
        scan_dir(subdir, dirs_list)
    end
end

-- Media files directly inside a directory (non-recursive, alphabetical).
local function get_media_files_in_dir(dir)
    local files = {}
    local entries = utils.readdir(dir)
    if not entries then return files end

    for _, entry in ipairs(entries) do
        if not entry:match("^%.") and is_media_file(entry) then
            local full_path = utils.join_path(dir, entry)
            local info = utils.file_info(full_path)
            if info and info.is_file then
                table.insert(files, full_path)
            end
        end
    end
    table.sort(files)
    return files
end

-- ---------------------------------------------------------------- watchlist

local function read_watchlist()
    local lines = {}
    local f = io.open(watchlist_path, "r")
    if f then
        for line in f:lines() do
            if line ~= "" and not line:match("^%s*#") then
                table.insert(lines, line)
            end
        end
        f:close()
    end
    return lines
end

local function write_watchlist(lines)
    local f = io.open(watchlist_path, "w")
    if not f then
        mp.osd_message("Could not write " .. watchlist_path, 3)
        return false
    end
    for _, l in ipairs(lines) do f:write(l, "\n") end
    f:close()
    return true
end

-- Absolute path of the current file (leaves URLs untouched).
local function current_abs_path()
    local p = mp.get_property("path")
    if not p or p == "" then return nil end
    if not p:match("^%a[%w+.-]*://") and p:sub(1, 1) ~= "/" then
        local wd = mp.get_property("working-directory")
        if wd then p = utils.join_path(wd, p) end
    end
    return p
end

local function load_watchlist()
    local lines = read_watchlist()
    if #lines == 0 then
        mp.osd_message("Watchlist is empty — press " .. settings.key_add ..
            " while watching to add files", 4)
        return
    end
    -- loadfile append just queues entries; media isn't opened until played,
    -- so this stays fast even for very large lists.
    mp.commandv("loadfile", lines[1], "replace")
    for i = 2, #lines do
        mp.commandv("loadfile", lines[i], "append")
    end
    mp.osd_message("▶ Loaded watchlist (" .. #lines .. " items)", 3)
    mp.add_timeout(0.1, function()
        mp.commandv("script-message", "playlistmanager", "show", "playlist")
    end)
end

local function watchlist_add()
    local p = current_abs_path()
    if not p then mp.osd_message("Nothing playing to add", 2); return end
    local lines = read_watchlist()
    for _, l in ipairs(lines) do
        if l == p then mp.osd_message("Already in watchlist", 2); return end
    end
    table.insert(lines, p)
    if write_watchlist(lines) then
        mp.osd_message("★ Added to watchlist (" .. #lines .. ")", 2)
    end
end

local function watchlist_remove()
    local p = current_abs_path()
    if not p then mp.osd_message("Nothing playing to remove", 2); return end
    local lines = read_watchlist()
    local kept, removed = {}, false
    for _, l in ipairs(lines) do
        if l == p then removed = true else table.insert(kept, l) end
    end
    if removed then
        write_watchlist(kept)
        mp.osd_message("✗ Removed from watchlist (" .. #kept .. ")", 2)
    else
        mp.osd_message("Current file isn't in the watchlist", 2)
    end
end

-- --------------------------------------------------------------------- menu

local function render_menu()
    if not active then
        mp.osd_message("")
        return
    end

    local cc0 = mp.get_property_osd("osd-ass-cc/0")
    local cc1 = mp.get_property_osd("osd-ass-cc/1")

    local text = cc0 .. "{\\an7\\fs18\\b1\\c&HE5C500&}📁 Select Video Playlist Folder\\N\\N"

    local start_idx = 1
    local end_idx = #items
    if #items > max_visible then
        start_idx = math.max(1, selected_idx - math.floor(max_visible / 2))
        end_idx = start_idx + max_visible - 1
        if end_idx > #items then
            end_idx = #items
            start_idx = end_idx - max_visible + 1
        end
    end

    for i = start_idx, end_idx do
        local label = items[i].label
        if i == selected_idx then
            text = text .. "{\\fs15\\b1\\c&H33FF33&}  ▶  " .. label .. "{\\r}\\N"
        else
            text = text .. "{\\fs15\\c&HCCCCCC&}     " .. label .. "{\\r}\\N"
        end
    end

    if end_idx < #items then
        text = text .. "{\\fs12\\c&H888888&}     ... and " .. (#items - end_idx) .. " more{\\r}\\N"
    end

    text = text .. "\\N{\\fs11\\c&H999999&}⌨  [j/k] Navigate  |  [Enter] Load  |  [Esc/q] Close" ..
        "\\N★  " .. settings.key_add .. " add · " .. settings.key_remove ..
        " remove current file (while watching){\\r}" .. cc1

    mp.osd_message(text, 86400) -- long duration; cleared manually
end

local function close_menu()
    active = false
    for _, name in ipairs({
        'vids_up', 'vids_up_k', 'vids_down', 'vids_down_j',
        'vids_select', 'vids_close', 'vids_close_q',
    }) do
        mp.remove_key_binding(name)
    end
    mp.osd_message("")
end

local function navigate_up()
    if #items == 0 then return end
    selected_idx = selected_idx - 1
    if selected_idx < 1 then selected_idx = #items end
    render_menu()
end

local function navigate_down()
    if #items == 0 then return end
    selected_idx = selected_idx + 1
    if selected_idx > #items then selected_idx = 1 end
    render_menu()
end

local function select_item()
    if #items == 0 then return end
    local item = items[selected_idx]
    close_menu()

    if item.kind == "watchlist" then
        load_watchlist()
        return
    end

    local files = get_media_files_in_dir(item.path)
    if #files == 0 then
        mp.osd_message("No media files found in " .. item.label, 3)
        return
    end
    mp.commandv("loadfile", files[1], "replace")
    for i = 2, #files do
        mp.commandv("loadfile", files[i], "append")
    end
    mp.osd_message("Loaded " .. #files .. " files from " .. item.label, 3)
    mp.add_timeout(0.1, function()
        mp.commandv("script-message", "playlistmanager", "show", "playlist")
    end)
end

local function add_binds()
    mp.add_forced_key_binding('UP', 'vids_up', navigate_up, "repeatable")
    mp.add_forced_key_binding('k', 'vids_up_k', navigate_up, "repeatable")
    mp.add_forced_key_binding('DOWN', 'vids_down', navigate_down, "repeatable")
    mp.add_forced_key_binding('j', 'vids_down_j', navigate_down, "repeatable")
    mp.add_forced_key_binding('ENTER', 'vids_select', select_item)
    mp.add_forced_key_binding('ESC', 'vids_close', close_menu)
    mp.add_forced_key_binding('q', 'vids_close_q', close_menu)
end

local function toggle_menu()
    if active then
        close_menu()
        return
    end

    local dirs = {}
    scan_dir(root_dir, dirs)
    table.sort(dirs)

    items = {}
    table.insert(items, {
        kind = "watchlist",
        label = "⭐ Watchlist (" .. #read_watchlist() .. ")",
    })
    for _, dir in ipairs(dirs) do
        table.insert(items, {
            kind = "folder",
            path = dir,
            label = dir:sub(#root_dir + 2),
        })
    end

    selected_idx = 1
    active = true
    add_binds()
    render_menu()
end

mp.add_key_binding(settings.key_toggle, 'vids_picker_toggle', toggle_menu)
mp.add_key_binding(settings.key_add, 'watchlist_add', watchlist_add)
-- forced: X is bound to `add audio-delay 0.100` in input.conf; this overrides it.
mp.add_forced_key_binding(settings.key_remove, 'watchlist_remove', watchlist_remove)

-- Auto-open the picker when mpv starts without any files
if mp.get_property_number('playlist-count', 0) == 0 then
    toggle_menu()
end
