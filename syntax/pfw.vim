" Vim syntax file
" Language:     Extended Domain Description
" Maintainer:   Mattijs Korpershoek <mattijsx.korpershoek@intel.com>
" Credits:      Mattijs Korpershoek <mattijsx.korpershoek@intel.com>
"               Kevin Rocard        <kevinx.rocard@intel.com>
"               Zvezdan Petkovic    <zpetkovic@acm.org>
"
" This is based on the Python Syntax file written by Zvezdan Petkovic.

" For version 5.x: Clear all syntax items.
" For version 6.x: Quit when a syntax file was already loaded.
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

syn keyword pfwKeyword            supDomain domainGroup domain rule supConf
syn keyword pfwKeyword            confGroup confType conf rule component
syn keyword pfwKeyword            sequenceAware
syn keyword pfwRuleOperator       ALL ANY
syn keyword pfwCriterionOperator  Includes Excludes Is IsNot
syn keyword pfwCriterionValue     True False None
syn match   pfwComponentPath      "[A-Za-z0-9\.\-_\:]*/[A-Za-z0-9\.\-_\:]*"
syn match   pfwComment            "#.*$" contains=pfwTodo

" It is very important to understand all details before changing the
" regular expressions below or their order.
" The word boundaries are *not* the floating-point number boundaries
" because of a possible leading or trailing decimal point.
" The expressions below ensure that all valid number literals are
" highlighted, and invalid number literals are not.  For example,
"
" - a decimal point in '4.' at the end of a line is highlighted,
" - a second dot in 1.0.0 is not highlighted,
" - 08 is not highlighted,
" - 08e0 or 08j are highlighted,
"
" and so on, as specified in the 'Python Language Reference'.
" http://docs.python.org/reference/lexical_analysis.html#numeric-literals
" FIXME: clarify if .pfw also supports hex
" numbers (including longs and complex)
syn match   pfwNumber   "\<0[oO]\=\o\+[Ll]\=\>"
syn match   pfwNumber   "\<0[xX]\x\+[Ll]\=\>"
syn match   pfwNumber   "\<0[bB][01]\+[Ll]\=\>"
syn match   pfwNumber   "\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn match   pfwNumber   "\<\d\+[jJ]\>"
syn match   pfwNumber   "\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
syn match   pfwNumber
      \ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
syn match   pfwNumber
      \ "\%(^\|\W\)\@<=\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"

" see :h pattern.txt for more info
" Trailing whitespaces
syn match   pfwSpaceError   display excludenl "\s\+$"
" Spaces are forbidden in .pfw files
syn match   pfwSpaceError   display "^ \+"
" Spaces mixed with tabs are forbidden in .pfw files
syn match   pfwSpaceError   display "\t\+ \+"
syn match   pfwSpaceError   display " \+\t\+"

if version >= 508 || !exists("did_pfw_syn_inits")
  if version <= 508
    let did_pfw_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " Default highlight links.
  HiLink pfwKeyword           Identifier
  HiLink pfwRuleOperator      Conditional
  HiLink pfwCriterionOperator Operator
  HiLink pfwCriterionValue    Type
  HiLink pfwComponentPath     String
  HiLink pfwComment           Comment
  HiLink pfwTodo              Todo
  HiLink pfwNumber            Number
  HiLink pfwSpaceError        ErrorMsg

  delcommand HiLink
endif

let b:current_syntax = "pfw"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=8 noet:
