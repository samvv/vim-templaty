
let parts = split(&ft, '\.')
if len(parts) > 1
  let s:nested_filetype = join(parts[0:len(parts)-2], '.')
  exec 'syntax' 'include' '@NESTED' ('syntax/' . s:nested_filetype . '.vim')
endif

syntax match templatyOperators contained containedin=templatyDirective '\v\*'
syntax match templatyOperators contained containedin=templatyDirective '\v\+'
syntax match templatyOperators contained containedin=templatyDirective '\v\-'
syntax match templatyOperators contained containedin=templatyDirective '\v\%'

syntax region templatyComment start='{#' end='#}'

syntax keyword templatyTodos contained containedin=templatyComment TODO XXX FIXME NOTE

syntax keyword templatyKeywords contained containedin=templatyDirective
  \ in
  \ if
  \ endif
  \ else
  \ elif
  \ for
  \ endfor
  \ join
  \ endjoin
syntax match templatyNumber '\v<\d+>' contained containedin=templatyDirective
syntax match templatyOpenStatement '{%'
syntax match templatyCloseStatement '%}'
syntax match templatyIdentifier contained containedin=templatyDirective '\v[a-zA-Z][a-zA-Z0-9]*'
syntax match templatyPunctuation contained containedin=templatyDirective '\v[()]'
syntax keyword templatyBuiltins contained containedin=templatyDirective
  \ range
  \ now
syntax region templatyString start=/\v'/ skip=/\v\\./ end=/\v'/

" syntax match templatyStatementPart

syntax region templatyDirective matchgroup=Special start='{%' end='%}'

hi default link templatyComment Comment
hi default link templatyString String
hi default link templatyOpenStatement PreProc
hi default link templatyCloseStatement PreProc
hi default link templatyOperators Operator
hi default link templatyBuiltins Identifier
hi default link templatyTodos Todo
hi default link templatyKeywords Statement
hi default link templatyNumber Number
