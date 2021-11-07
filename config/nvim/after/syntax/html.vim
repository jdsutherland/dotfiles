" {{{ must manually copy to head of /usr/local/Cellar/neovim/HEAD-f8173df_2/share/nvim/runtime/syntax/html.vim
syn keyword htmlArg class conceal cchar=ℂ
syn keyword htmlArg id conceal cchar=#
syn match htmlArg '\s\zsdata-' conceal cchar=⊇
syn keyword htmlTagName div conceal
syn keyword htmlTagName p conceal cchar=¶
syn keyword htmlTagName span conceal cchar=⇒
syn keyword htmlTagName section conceal cchar=§
syn keyword htmlTagName article conceal cchar=⫫
syn keyword htmlTagName ol conceal cchar=ℓ
syn keyword htmlTagName ul conceal cchar=ℓ
syn keyword htmlTagName li conceal cchar=•
syn keyword htmlTagName button conceal cchar=🔘
syn keyword htmlTagName option conceal cchar=⌥
syn keyword htmlTagName tr conceal cchar=⇆
syn keyword htmlTagName td conceal cchar=☐
syn keyword htmlTagName blockquote conceal cchar="
" }}}

if has('conceal') | set conceallevel=2 | else | finish | endif

if !exists("html_no_rendering") || g:html_no_rendering != 0
	syn case ignore
	syn match htmlTag "<i>" conceal
		\ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
	syn match htmlEndTag "</i>" conceal contains=htmlTagN,htmlTagError

	syn match htmlTag "<u>" conceal
		\ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
	syn match htmlEndTag "</u>" conceal contains=htmlTagN,htmlTagError

	syn match htmlTag "<em>" conceal
		\ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
	syn match htmlEndTag "</em>" conceal contains=htmlTagN,htmlTagError

	syn match htmlTag "<b>" conceal
		\ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
	syn match htmlEndTag "</b>" conceal contains=htmlTagN,htmlTagError

	syn match htmlTag "<strong>"
		\ conceal contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
	syn match htmlEndTag "</strong>" conceal contains=htmlTagN,htmlTagError

	syn clear htmlBold htmlBoldUnderline htmlBoldItalic htmlBoldUnderlineItalic htmlBoldItalicUnderline
	syn region htmlBold start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlBoldUnderline,htmlBoldItalic
	syn region htmlBold start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlBoldUnderline,htmlBoldItalic
	syn region htmlBoldUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlBoldUnderlineItalic
	syn region htmlBoldItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlBoldItalicUnderline
	syn region htmlBoldItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop,htmlBoldItalicUnderline
	syn region htmlBoldUnderlineItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop
	syn region htmlBoldUnderlineItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop
	syn region htmlBoldItalicUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlBoldUnderlineItalic

	syn clear htmlUnderline htmlUnderlineBold htmlUnderlineItalic htmlUnderlineItalicBold htmlUnderlineBoldItalic
	syn region htmlUnderline start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlUnderlineBold,htmlUnderlineItalic
	syn region htmlUnderlineBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlUnderlineBoldItalic
	syn region htmlUnderlineBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlUnderlineBoldItalic
	syn region htmlUnderlineItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlUnderlineItalicBold
	syn region htmlUnderlineItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop,htmlUnderlineItalicBold
	syn region htmlUnderlineItalicBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop
	syn region htmlUnderlineItalicBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop
	syn region htmlUnderlineBoldItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop
	syn region htmlUnderlineBoldItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop

	syn clear htmlItalic htmlItalicBold htmlItalicBoldUnderline htmlItalicUnderline htmlItalicUnderlineBold
	syn region htmlItalic start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlItalicBold,htmlItalicUnderline
	syn region htmlItalic start="<em\>" end="</em>"me=e-5 contains=@htmlTop
	syn region htmlItalicBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlItalicBoldUnderline
	syn region htmlItalicBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlItalicBoldUnderline
	syn region htmlItalicBoldUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop
	syn region htmlItalicUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlItalicUnderlineBold
	syn region htmlItalicUnderlineBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop
	syn region htmlItalicUnderlineBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop
endif

scriptencoding UTF-8

let s:added_html_charconceal_number = {}
function! HTMLAddEntityConceal(char, ...)
" Arguments:
" 2 args: 1 = concealed character to display, 2 = match pattern to conceal in
"                                                 the form of: &...;
" 1 arg:  1 = decimal number to match in &#...; format, character to display
"             is computed from this
	if ! has('conceal') | return | endif

	if a:0 == 1 && strlen(substitute(a:char, '.', 'x', 'g')) == 1
				\ && a:1 =~ '^&#\?\w\+;$'

		syn case match
		exe "syn match htmlSpecialChar '"
			\ . a:1 . "' conceal cchar=" . a:char

		let nr = char2nr(a:char)
		if ! exists('s:added_html_charconceal_number[' . nr . ']')
			let s:added_html_charconceal_number[l:nr] = nr2char(nr)
			syn case match
			exe "syn match htmlSpecialChar '&#"
				\ . nr . ";' conceal cchar=" . a:char
			syn case ignore
			exe "syn match htmlSpecialChar '&#x"
				\ . printf('%2X', nr) . ";' conceal cchar=" . a:char
		endif


	elseif a:0 == 0 && a:char =~ '^[0-9]\+$'
		if ! exists('s:added_html_charconceal_number[' . a:char . ']')
			let s:added_html_charconceal_number[a:char] = nr2char(a:char)
			syn case match
			exe "syn match htmlSpecialChar '&#"
				\ . a:char . ";' conceal cchar=" . nr2char(a:char)
			syn case ignore
			exe "syn match htmlSpecialChar '&#x"
				\ . printf('%2X', a:char) . ";' conceal cchar="
				\ . nr2char(a:char)
		endif
	else
		echoerr expand('<sfile>') . ": Invalid usage."
	endif
endfunction

let s:specials=[
\  ['&',    '&amp;'], ['<' ,    '&lt;'], ['>',      '&gt;'], [' ',   '&nbsp;'],
\  ['«',  '&laquo;'], ['»',  '&raquo;'], ['"',    '&quot;'], ['’',  '&#8217;'], ["'",  '&apos;'],
\  ['¢',   '&cent;'], ['£',  '&pound;'], ['¥',     '&yen;'], ['€',   '&euro;'],
\  ['©',   '&copy;'], ['®',    '&reg;'], ['™',   '&trade;'],
\  ['×',  '&times;'], ['÷', '&divide;'], ['±',  '&plusmn;'],
\  ['¹',   '&sup1;'], ['²',   '&sup2;'], ['³',    '&sup3;'],
\  ['¡',  '&iexcl;'], ['¿', '&iquest;'],
\  ['°',    '&deg;'],
\  ['µ',  '&micro;'],
\  ['¶',   '&para;'], ['§',   '&sect;'],
\  ['·', '&middot;'],
\  ['¼', '&frac14;'], ['½', '&frac12;'], ['¾', '&frac34;'], ["⅓", "&frac13;"],
\  ["⅔", "&frac23;"], ["⅕", "&frac15;"], ["⅖", "&frac25;"], ["⅗", "&frac35;"],
\  ["⅘", "&frac45;"], ["⅙", "&frac16;"], ["⅚", "&frac56;"], ["⅛", "&frac18;"],
\  ["⅜", "&frac38;"], ["⅝", "&frac58;"], ["⅞", "&frac78;"],
\  ['–',  '&ndash;'], ['—',  '&mdash;'], ['…',  '&hellip;'],
\  ['À', '&Agrave;'], ['à', '&agrave;'], ['Á',  '&Aacute;'], ['á', '&aacute;'],
\  ['È', '&Egrave;'], ['è', '&egrave;'], ['É',  '&Eacute;'], ['é', '&eacute;'],
\  ['Ì', '&Igrave;'], ['ì', '&igrave;'], ['Í',  '&Iacute;'], ['í', '&iacute;'],
\  ['Ò', '&Ograve;'], ['ò', '&ograve;'], ['Ó',  '&Oacute;'], ['ó', '&oacute;'],
\  ['Ù', '&Ugrave;'], ['ù', '&ugrave;'], ['Ú',  '&Uacute;'], ['ú', '&uacute;'],
\  ['Ý', '&Yacute;'], ['ý', '&yacute;'],
\  ['Ã', '&Atilde;'], ['ã', '&atilde;'],
\  ['Ñ', '&Ntilde;'], ['ñ', '&ntilde;'],
\  ['Õ', '&Otilde;'], ['õ', '&otilde;'],
\  ['Â',  '&Acirc;'], ['â',  '&acirc;'],
\  ['Ê',  '&Ecirc;'], ['ê',  '&ecirc;'],
\  ['Î',  '&Icirc;'], ['î',  '&icirc;'],
\  ['Ô',  '&Ocirc;'], ['ô',  '&ocirc;'],
\  ['Û',  '&Ucirc;'], ['û',  '&ucirc;'],
\  ['Ä',   '&Auml;'], ['ä',   '&auml;'],
\  ['Ë',   '&Euml;'], ['ë',   '&euml;'],
\  ['Ï',   '&Iuml;'], ['ï',   '&iuml;'],
\  ['Ö',   '&Ouml;'], ['ö',   '&ouml;'],
\  ['Ü',   '&Uuml;'], ['ü',   '&uuml;'],
\  ['ÿ',   '&yuml;'], ['¨',    '&uml;'],
\  ['Å',  '&Aring;'], ['å',  '&aring;'],
\  ['Æ',  '&AElig;'], ['æ',  '&aelig;'],
\  ['Ç', '&Ccedil;'], ['ç', '&ccedil;'],
\  ['Ø', '&Oslash;'], ['ø', '&oslash;'],
\  ['↔',   '&harr;'], ['↓',   '&darr;'], ['↑',    '&uarr;'],
\  ['→',   '&rarr;'], ['←',   '&larr;'],
\  ['ϖ',    '&piv;'], ['ϒ',  '&upsih;'], ['ϑ','&thetasym;'], ['ω',  '&omega;'],
\  ['ψ',    '&psi;'], ['χ',    '&chi;'], ['φ',     '&phi;'], ['υ','&upsilon;'],
\  ['τ',    '&tau;'], ['ς', '&sigmaf;'], ['σ',   '&sigma;'], ['ρ',    '&rho;'],
\  ['π',     '&pi;'], ['ο','&omicron;'], ['ξ',      '&xi;'], ['ν',     '&nu;'],
\  ['μ',     '&mu;'], ['λ', '&lambda;'], ['κ',   '&kappa;'], ['ι',   '&iota;'],
\  ['θ',  '&theta;'], ['η',    '&eta;'], ['ζ',    '&zeta;'], ['ε','&epsilon;'],
\  ['δ',  '&delta;'], ['γ',  '&gamma;'], ['β',    '&beta;'], ['α',  '&alpha;'],
\  ['Ψ',    '&Psi;'], ['Χ',    '&Chi;'], ['Φ',     '&Phi;'], ['Υ','&Upsilon;'],
\  ['Τ',    '&Tau;'], ['Σ',  '&Sigma;'], ['Ρ',     '&Rho;'], ['Π',     '&Pi;'],
\  ['Ο','&Omicron;'], ['Ξ',     '&Xi;'], ['Ν',      '&Nu;'], ['Μ',     '&Mu;'],
\  ['Λ', '&Lambda;'], ['Κ',  '&Kappa;'], ['Ι',    '&Iota;'], ['Θ',  '&Theta;'],
\  ['Η',    '&Eta;'], ['Ζ',   '&Zeta;'], ['Ε', '&Epsilon;'], ['Δ',  '&Delta;'],
\  ['Γ',  '&Gamma;'], ['Β',   '&Beta;'], ['Α',   '&Alpha;'],
\]

for char in s:specials
	call HTMLAddEntityConceal(char[0], char[1])
endfor

" Define the standard printable ASCII character set as &#..; entities:
let s:i=32
while s:i <= 126
	call HTMLAddEntityConceal(s:i)
	let s:i+=1
endwhile

unlet s:specials s:i

scriptencoding
