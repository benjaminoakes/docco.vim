" Syntax-highlight Ruby comments as Markdown a la Docco

" TODO: Make multi-line comments work right
"       Make nested comments work right
"       Exclude "# => " ("result of expression") comments

let s:saved_syntax = b:current_syntax
unlet b:current_syntax

syntax include  @Markdown syntax/markdown.vim

syntax cluster  rbComments contains=rubyComment,rubyMultilineComment
syntax cluster  mostOfRuby contains=ruby.* remove=@rbComments

syntax match    markdownInComment /#.*/ms=s+1 contained containedin=@rbComments contains=@Markdown transparent
syntax match    rubyInMarkdown /     .*/ contained containedin=markdownInComment,markdownCodeBlock contains=@mostOfRuby transparent

let b:current_syntax = s:saved_syntax