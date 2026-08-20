-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- App-scoped keyd overlay bindings (see config/keyd/app.conf, KEYBINDINGS.md).
-- Deliberately o.exec_on_start (not o.launch_on_start): -d double-forks to
-- daemonize, and o.launch_on_start wraps commands in uwsm-app (a systemd
-- scope) which would reap the detached child when the wrapping unit exits.
-- Requires the user to be in the `keyd` group (sudo usermod -aG keyd $USER,
-- then a fresh login).
o.exec_on_start("keyd-application-mapper -d")

-- Sunset+2h night light (wlsunset), replacing hyprsunset.
o.launch_on_start("hypr-nightlight")
