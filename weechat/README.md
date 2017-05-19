```
/script install buffers.pl buffer_autoclose.py iset.pl go.py colorize_nicks.py vimode.py iset.pl histsearch.py nickregain.pl shortenurl.py colorize_lines.pl highmon.pl autosort.py

/color alias 196 lightred
/color alias 130 brown
/color alias 208 orange
/color alias 003 yellow
/color alias 113 green
/color alias 046 lightgreen
/color alias 045 aqua
/color alias 081 lightblue
/color alias 135 purple
/color alias 170 magenta
/color alias 201 lightmagenta
/color alias 039 cyan
/color alias 051 lightcyan

/set weechat.color.chat_nick_colors 1,2,3,4,5,6

/set weechat.look.buffer_notify_default all
/set irc.look.smart_filter on
/filter add irc_smart * irc_smart_filter *
/filter add irc_join_names * irc_366,irc_332,irc_333,irc_329,irc_324 *

/set weechat.look.prefix_same_nick "⤷"
/set weechat.look.buffer_notify_default all

/set buffers.color.number white
/set buffers.look.hotlist_counter on
/set buffers.name_size_max 20
/set buffers.color.current_bg linehighlightdark
/set buffers.color.current_fg red
/set buffers.color.hotlist_message_bg default
/set buffers.color.hotlist_message_fg yellow
```

# security
```
/set irc.server_default.msg_part ""
/set irc.server_default.msg_quit ""
/set irc.ctcp.clientinfo ""
/set irc.ctcp.finger ""
/set irc.ctcp.source ""
/set irc.ctcp.time ""
/set irc.ctcp.userinfo ""
/set irc.ctcp.version ""
/set irc.ctcp.ping ""

/plugin unload xfer
/set weechat.plugin.autoload "*,!xfer"

/set irc.server.freenode.command_delay 5
```

# set secure pass
```
/secure passphrase xxxxxxxxxx
/secure set freenode_username username
/secure set freenode_password xxxxxxxx
/set irc.server.freenode.sasl_username "${sec.data.freenode_username}"
/set irc.server.freenode.sasl_password "${sec.data.freenode_password}"

```

https://hackernoon.com/my-weechat-plugins-9278fe4783c
http://zanshin.net/2015/01/10/a-guide-for-setting-up-weechat-and-bitlbee/
https://github.com/sindresorhus/weechat-notification-center
