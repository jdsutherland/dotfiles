-- playlist_picker.lua
-- An mpv script to browse folders under ~/vids and load them as playlists.
-- Press Ctrl+v to toggle the playlist picker.
-- Use UP/DOWN or j/k to navigate, ENTER to select, ESC or q to close.

local utils = require 'mp.utils'
local msg = require 'mp.msg'

-- Configuration options
local settings = {
    root_directory = "~/vids",
    media_extensions = "mp4,webm,mkv,avi,mov,flv,wmv,mp3,wav,flac,m4a,m4v",
    max_visible = 15,
    key_toggle = "ctrl+v",
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
local media_extensions = {}
for ext in string.gmatch(settings.media_extensions, "[^,]+") do
    table.insert(media_extensions, ext:lower():gsub("%s+", ""))
end

local active = false
local directories = {}
local selected_idx = 1
local max_visible = settings.max_visible

-- Recursively scan directory to find folders containing media files
local function scan_dir(dir, dirs_list)
    local entries = utils.readdir(dir)
    if not entries then return end

    local has_media = false
    local subdirs = {}

    for _, entry in ipairs(entries) do
        -- Skip hidden files/directories
        if not entry:match("^%.") then
            local full_path = utils.join_path(dir, entry)
            local info = utils.file_info(full_path)
            if info then
                if info.is_dir then
                    table.insert(subdirs, full_path)
                elseif info.is_file then
                    local ext = entry:match("^.+%.(.+)$")
                    if ext then
                        ext = ext:lower()
                        for _, media_ext in ipairs(media_extensions) do
                            if ext == media_ext then
                                has_media = true
                                break
                            end
                        end
                    end
                end
            end
        end
    end

    -- If this directory has media files, add it to our list
    if has_media then
        table.insert(dirs_list, dir)
    end

    -- Recurse into subdirectories
    for _, subdir in ipairs(subdirs) do
        scan_dir(subdir, dirs_list)
    end
end

-- Get all media files inside a directory (non-recursive, alphabetical)
local function get_media_files_in_dir(dir)
    local files = {}
    local entries = utils.readdir(dir)
    if not entries then return files end

    for _, entry in ipairs(entries) do
        if not entry:match("^%.") then
            local full_path = utils.join_path(dir, entry)
            local info = utils.file_info(full_path)
            if info and info.is_file then
                local ext = entry:match("^.+%.(.+)$")
                if ext then
                    ext = ext:lower()
                    for _, media_ext in ipairs(media_extensions) do
                        if ext == media_ext then
                            table.insert(files, full_path)
                            break
                        end
                    end
                end
            end
        end
    end
    table.sort(files)
    return files
end

local function render_menu()
    if not active then
        mp.osd_message("")
        return
    end

    local cc0 = mp.get_property_osd("osd-ass-cc/0")
    local cc1 = mp.get_property_osd("osd-ass-cc/1")

    -- Start with top-left alignment and a clean color header
    local text = cc0 .. "{\\an7\\fs26\\b1\\c&HE5C500&}📁 Select Video Playlist Folder\\N\\N"

    local start_idx = 1
    local end_idx = #directories

    if #directories > max_visible then
        start_idx = math.max(1, selected_idx - math.floor(max_visible / 2))
        end_idx = start_idx + max_visible - 1
        if end_idx > #directories then
            end_idx = #directories
            start_idx = end_idx - max_visible + 1
        end
    end

    for i = start_idx, end_idx do
        local dir = directories[i]
        local rel = dir:sub(#root_dir + 2)
        if i == selected_idx then
            text = text .. "{\\fs22\\b1\\c&H33FF33&}  ▶  " .. rel .. "{\\r}\\N"
        else
            text = text .. "{\\fs22\\c&HCCCCCC&}     " .. rel .. "{\\r}\\N"
        end
    end

    if end_idx < #directories then
        text = text .. "{\\fs18\\c&H888888&}     ... and " .. (#directories - end_idx) .. " more folders{\\r}\\N"
    end

    text = text .. "\\N{\\fs16\\c&H999999&}⌨  [Up/Down or j/k] Navigate  |  [Enter] Select  |  [Esc/q] Close{\\r}" .. cc1

    mp.osd_message(text, 86400) -- Long duration, we clear manually
end

local function close_menu()
    active = false
    -- Remove temporary navigation keybinds
    mp.remove_key_binding('vids_up')
    mp.remove_key_binding('vids_up_k')
    mp.remove_key_binding('vids_down')
    mp.remove_key_binding('vids_down_j')
    mp.remove_key_binding('vids_select')
    mp.remove_key_binding('vids_close')
    mp.remove_key_binding('vids_close_q')
    mp.osd_message("")
end

local function navigate_up()
    if #directories == 0 then return end
    selected_idx = selected_idx - 1
    if selected_idx < 1 then
        selected_idx = #directories
    end
    render_menu()
end

local function navigate_down()
    if #directories == 0 then return end
    selected_idx = selected_idx + 1
    if selected_idx > #directories then
        selected_idx = 1
    end
    render_menu()
end

local function select_folder()
    if #directories == 0 then return end
    local selected_dir = directories[selected_idx]

    local files = get_media_files_in_dir(selected_dir)
    if #files == 0 then
        mp.osd_message("No media files found in " .. selected_dir, 3)
        return
    end

    close_menu()

    -- Load the first file and clear the playlist
    mp.commandv("loadfile", files[1], "replace")

    -- Append the remaining files
    for i = 2, #files do
        mp.commandv("loadfile", files[i], "append")
    end

    local rel = selected_dir:sub(#root_dir + 2)
    mp.osd_message("Loaded " .. #files .. " files from " .. rel, 3)

    -- Tell playlistmanager to display the playlist
    mp.add_timeout(0.1, function()
        mp.commandv("script-message", "playlistmanager", "show", "playlist")
    end)
end

local function add_binds()
    mp.add_forced_key_binding('UP', 'vids_up', navigate_up, "repeatable")
    mp.add_forced_key_binding('k', 'vids_up_k', navigate_up, "repeatable")
    mp.add_forced_key_binding('DOWN', 'vids_down', navigate_down, "repeatable")
    mp.add_forced_key_binding('j', 'vids_down_j', navigate_down, "repeatable")
    mp.add_forced_key_binding('ENTER', 'vids_select', select_folder)
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

    if #dirs == 0 then
        mp.osd_message("No directories containing media found under " .. settings.root_directory, 3)
        return
    end

    directories = dirs
    selected_idx = 1
    active = true
    add_binds()
    render_menu()
end

mp.add_key_binding(settings.key_toggle, 'vids_picker_toggle', toggle_menu)
