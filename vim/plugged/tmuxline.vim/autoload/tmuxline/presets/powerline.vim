fun! tmuxline#presets#powerline#get()
  let bar = tmuxline#new()

  call bar.left.add('a', '#S')
  call bar.left.add_left_sep()

  call bar.right.add('x', '#(gmusicplaying.sh)')
  call bar.right.add('x', '#(battery -t -g black)')

  call bar.right.add_right_sep()
  call bar.right.add('y', '%a, %b %d - %I:%M')
  " call bar.right.add_right_alt_sep()
  " call bar.right.add('y', '%H:%M')
  call bar.right.add_right_sep()

  call bar.right.add('z', '#h')

  call bar.win.add('win.dim', '#I')
  call bar.win.add_left_alt_sep()
  call bar.win.add('win', '#W')

  call bar.cwin.add_left_sep()
  call bar.cwin.add('cwin.dim', '#I')
  call bar.cwin.add_left_alt_sep()
  call bar.cwin.add('cwin', '#W')
  call bar.cwin.add_left_sep()

  let bar.options['status-justify'] = 'left'
  let bar.win_options['window-status-activity-attr'] = 'none'

  return bar
endfun

