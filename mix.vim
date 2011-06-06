" Vim syntax file
" Language:	MIX
" Maintainer:	Justin Williamson <jwilliamson@alum.bu.edu>
" Last Change:	2011 Jun 5

" Quit when a (custom) syntax file was already loaded
"if exists("b:current_syntax")
"  finish
"endif

syn case match

syn match		mixalLabel		/[a-zA-Z0-9]\+/ nextgroup=mixInstruction skipwhite

syn match		mixComment		/^\*.*$/

" this doesn't work too well yet
"syn match		mixComment		/\<.*$/

syn match 		mixInstruction	/LD[AX1-6]N\?/ nextgroup=mixAddress skipwhite
syn match 		mixInstruction	/ST[AXJZ1-6]\>/ nextgroup=mixAddress skipwhite
syn keyword 	mixInstruction	ADD MUL SUB DIV nextgroup=mixAddress skipwhite
syn match 		mixInstruction	/EN[TN][AX1-6]/ nextgroup=mixAddress skipwhite
syn match 		mixInstruction	/INC[AX1-6]/ nextgroup=mixAddress skipwhite
syn match 		mixInstruction	/DEC[AX1-6]/ nextgroup=mixAddress skipwhite
syn match 		mixInstruction	/CMP[AX1-6]/ nextgroup=mixAddress skipwhite
syn keyword		mixInstruction	JMP JSJ JOV JNOV nextgroup=mixAddress skipwhite
syn keyword		mixInstruction	JL JE JG JGE JNE JLE nextgroup=mixAddress skipwhite
syn match 		mixInstruction	/J[AX1-6]N\?[NZP]/ nextgroup=mixAddress skipwhite
syn keyword		mixInstruction	IN OUT IOC JRED JBUS nextgroup=mixAddress skipwhite
syn keyword		mixInstruction	NUM CHAR nextgroup=mixAddress skipwhite
syn match 		mixInstruction	/S[LR]\(AX\?\|C\)/ nextgroup=mixAddress skipwhite
syn keyword		mixInstruction	MOVE NOP HLT nextgroup=mixAddress skipwhite

syn keyword		mixalDirective	ORIG EQU CON ALF END nextgroup=mixAddress skipwhite

syn match		mixField		/([0-9]\+:[0-9]\+)/ nextgroup=mixComment skipwhite

syn match		mixAddress		/[0-3][0-9]\{1,3\}/ nextgroup=mixField,mixComment skipwhite

syn match		mixString		/"[^"]*"/hs=s+1,he=e-1

hi def link mixalDirective		mixInstruction
hi def link mixInstruction		Statement
hi def link mixalLabel			Label
hi def link mixComment			Comment
hi def link mixString			mixAddress
hi def link mixAddress			Number
hi def link mixField			Special 

let b:current_syntax = "mix"

syntax sync
