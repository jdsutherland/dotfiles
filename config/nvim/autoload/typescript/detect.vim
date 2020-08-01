function! typescript#detect#Filetype() abort
  if getline(1) =~# '^#!.*/bin/env\s\+node\>'
    set filetype=typescript
  else
    let package_json = findfile('package.json', '.;')
    if len(package_json)
      let deps = readfile(package_json)
      let deps = join(deps)
      let deps = json_decode(deps)
      let deps = get(deps, 'dependencies', {})
      if has_key(deps, 'react')
        set filetype=typescriptreact
      endif
    endif
  endif
endfunction
