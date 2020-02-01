
" If there was a secondary file type specified either by ftdetect or 
" by the user, then load its highlighter.
" Example: cpp.templaty
" let parts = split(&ft, '\.')
" if len(parts) > 1
"   let s:nested_filetype = join(parts[0:len(parts)-2], '.')
"   exec 'syntax' 'include' '@NESTED' ('syntax/' . s:nested_filetype . '.vim')
" endif

" Import Python syntax highlighter so that {! !}-blocks can be properly
" highlighted.
" We have to unset b:current_syntax because otherwise the highlighter will
" fail to load.
if exists("b:current_syntax")
  unlet b:current_syntax
endif
syntax include @PY syntax/python.vim

syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\*'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\<'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\='
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\>'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\!'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\|'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\&'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\+'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\-'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\*'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\/'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\@'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\%'
syntax match templatyOperators contained containedin=templatyExpression,templatyStatement '\v\~'

syntax region templatyComment start='{#' end='#}'

syntax keyword templatyTodos contained containedin=templatyComment TODO XXX FIXME NOTE

syntax keyword templatyKeywords contained containedin=templatyStatement
  \ in
  \ if
  \ endif
  \ else
  \ elif
  \ for
  \ endfor
  \ join
  \ with
  \ endjoin
  \ setindent
  \ endsetindent
  \ noindent
  \ endnoindent

syntax match templatyNumber contained containedin=templatyStatement,templatyExpression '\v<\d+>'
syntax match templatyIdentifier contained containedin=templatyStatement,templatyExpression '\v[a-zA-Z][a-zA-Z0-9]*'
syntax match templatyPunctuation contained containedin=templatyStatement,templatyExpression '\v[()]'
syntax keyword templatyBuiltins contained containedin=templatyStatement,templatyExpression
  \ reversed
  \ range
  \ now
syntax region templatyString contained containedin=templatyStatement,templatyExpression start=/\v'/ skip=/\v\\./ end=/\v'/

syntax region templatyExpression matchgroup=Special start='{{' end='}}'
syntax region templatyCode matchgroup=Special start='{!' end='!}'
syntax region templatyStatement matchgroup=Special start='{%' end='%}'

" The following commands contain various fixes for other syntax highlighters
" 
" The majority of these fixes have to do with the fact that ALLBUT and
" CONTAINED are used to often, incorrectly adding some of the syn match
" patterns in places where it shouldn't be.

syntax cluster cPreProcGroup add=templatyNumber,templatyIdentifier,templatyBuiltins,templatyPunctuation 

" Link the default syntax highlighting to the correct match rules
" We chose not to include a templatyIdentifier as an Identifier because they
" would be used too frequently.

hi default link templatyStatement Normal
hi default link templatyExpression Normal
hi default link templatyComment Comment
hi default link templatyString String
hi default link templatyOperators Operator
hi default link templatyBuiltins Identifier
hi default link templatyTodos Todo
hi default link templatyKeywords Statement
hi default link templatyNumber Number

let b:current_syntax = "templaty"
