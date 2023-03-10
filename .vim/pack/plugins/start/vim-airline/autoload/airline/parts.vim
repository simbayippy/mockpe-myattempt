" MIT License. Copyright (c) 2013-2021 Bailey Ling et al.
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

let s:parts = {}

" PUBLIC API {{{

function! airline#parts#define(key, config)
  let s:parts[a:key] = get(s:parts, a:key, {})
  if exists('g:airline#init#bootstrapping')
    call extend(s:parts[a:key], a:config, 'keep')
  else
    call extend(s:parts[a:key], a:config, 'force')
  endif
endfunction

function! airline#parts#define_function(key, name)
  call airline#parts#define(a:key, { 'function': a:name })
endfunction

function! airline#parts#define_text(key, text)
  call airline#parts#define(a:key, { 'text': a:text })
endfunction

function! airline#parts#define_raw(key, raw)
  call airline#parts#define(a:key, { 'raw': a:raw })
endfunction

function! airline#parts#define_minwidth(key, width)
  call airline#parts#define(a:key, { 'minwidth': a:width })
endfunction

function! airline#parts#define_condition(key, predicate)
  call airline#parts#define(a:key, { 'condition': a:predicate })
endfunction

function! airline#parts#define_accent(key, accent)
  call airline#parts#define(a:key, { 'accent': a:accent })
endfunction

function! airline#parts#define_empty(keys)
  for key in a:keys
    call airline#parts#define_raw(key, '')
  endfor
endfunction

function! airline#parts#get(key)
  return get(s:parts, a:key, {})
endfunction

" }}}

function! airline#parts#mode()
  let part = airline#parts#get('mode')
  let minwidth = get(part, 'minwidth', 79)
  return airline#util#shorten(get(w:, 'airline_current_mode', ''), minwidth, 1)
endfunction

function! airline#parts#crypt()
  return g:airline_detect_crypt && exists("+key") && !empty(&key) ? g:airline_symbols.crypt : ''
endfunction

function! airline#parts#paste()
  return g:airline_detect_paste && &paste ? g:airline_symbols.paste : ''
endfunction

" Sources:
" https://ftp.nluug.nl/pub/vim/runtime/spell/
" https://en.wikipedia.org/wiki/Regional_indicator_symbol
let s:flags = {
                  \ 'af_za': 'πΏπ¦[af]',
                  \ 'am_et': 'π­πΊ[am]',
                  \ 'bg_bg': 'π§π¬',
                  \ 'br_fr': 'π«π·[br]',
                  \ 'ca_es': 'πͺπΈ[ca]',
                  \ 'cs_cz': 'π¨πΏ',
                  \ 'cy_gb': 'π¬π§[cy]',
                  \ 'da_dk': 'π©π°',
                  \ 'de'   : 'π©πͺ',
                  \ 'de_19': 'π©πͺ[19]',
                  \ 'de_20': 'π©πͺ[20]',
                  \ 'de_at': 'π©πͺ[at]',
                  \ 'de_ch': 'π©πͺ[ch]',
                  \ 'de_de': 'π©πͺ',
                  \ 'el_gr': 'π¬π·',
                  \ 'en':    'π¬π§',
                  \ 'en_au': 'π¦πΊ',
                  \ 'en_ca': 'π¨π¦',
                  \ 'en_gb': 'π¬π§',
                  \ 'en_nz': 'π³πΏ',
                  \ 'en_us': 'πΊπΈ',
                  \ 'es':    'πͺπΈ',
                  \ 'es_es': 'πͺπΈ',
                  \ 'es_mx': 'π²π½',
                  \ 'fo_fo': 'π«π΄',
                  \ 'fr_fr': 'π«π·',
                  \ 'ga_ie': 'π?πͺ',
                  \ 'gd_gb': 'π¬π§[gd]',
                  \ 'gl_es': 'πͺπΈ[gl]',
                  \ 'he_il': 'π?π±',
                  \ 'hr_hr': 'π­π·',
                  \ 'hu_hu': 'π­πΊ',
                  \ 'id_id': 'π?π©',
                  \ 'it_it': 'π?πΉ',
                  \ 'ku_tr': 'πΉπ·[ku]',
                  \ 'la'   : 'π?πΉ[la]',
                  \ 'lt_lt': 'π±πΉ',
                  \ 'lv_lv': 'π±π»',
                  \ 'mg_mg': 'π²π¬',
                  \ 'mi_nz': 'π³πΏ[mi]',
                  \ 'ms_my': 'π²πΎ',
                  \ 'nb_no': 'π³π΄',
                  \ 'nl_nl': 'π³π±',
                  \ 'nn_no': 'π³π΄[ny]',
                  \ 'ny_mw': 'π²πΌ',
                  \ 'pl_pl': 'π΅π±',
                  \ 'pt':    'π΅πΉ',
                  \ 'pt_br': 'π§π·',
                  \ 'pt_pt': 'π΅πΉ',
                  \ 'ro_ro': 'π·π΄',
                  \ 'ru'   : 'π·πΊ',
                  \ 'ru_ru': 'π·πΊ',
                  \ 'ru_yo': 'π·πΊ[yo]',
                  \ 'rw_rw': 'π·πΌ',
                  \ 'sk_sk': 'πΈπ°',
                  \ 'sl_si': 'πΈπ?',
                  \ 'sr_rs': 'π·πΈ',
                  \ 'sv_se': 'πΈπͺ',
                  \ 'sw_ke': 'π°πͺ',
                  \ 'tet_id': 'π?π©[tet]',
                  \ 'th'   : 'πΉπ­',
                  \ 'tl_ph': 'π΅π­',
                  \ 'tn_za': 'πΏπ¦[tn]',
                  \ 'uk_ua': 'πΊπ¦',
                  \ 'yi'   : 'π»π?',
                  \ 'yi_tr': 'πΉπ·',
                  \ 'zu_za': 'πΏπ¦[zu]',
      \ }
" Also support spelllang without region codes
let s:flags_noregion = {}
for s:key in keys(s:flags)
  let s:flags_noregion[split(s:key, '_')[0]] = s:flags[s:key]
endfor

function! airline#parts#spell()
  let spelllang = g:airline_detect_spelllang ? printf(" [%s]", toupper(substitute(&spelllang, ',', '/', 'g'))) : ''
  if g:airline_detect_spell && (&spell || (exists('g:airline_spell_check_command') && eval(g:airline_spell_check_command)))

    if g:airline_detect_spelllang !=? '0' && g:airline_detect_spelllang ==? 'flag'
      let spelllang = tolower(&spelllang)
      if has_key(s:flags, spelllang)
        return s:flags[spelllang]
      elseif has_key(s:flags_noregion, spelllang)
        return s:flags_noregion[spelllang]
      endif
    endif

    let winwidth = airline#util#winwidth()
    if winwidth >= 90
      return g:airline_symbols.spell . spelllang
    elseif winwidth >= 70
      return g:airline_symbols.spell
    elseif !empty(g:airline_symbols.spell)
      return split(g:airline_symbols.spell, '\zs')[0]
    endif
  endif
  return ''
endfunction

function! airline#parts#iminsert()
  if g:airline_detect_iminsert && &iminsert && exists('b:keymap_name')
    return toupper(b:keymap_name)
  endif
  return ''
endfunction

function! airline#parts#readonly()
  " only consider regular buffers (e.g. ones that represent actual files,
  " but not special ones like e.g. NERDTree)
  if !empty(&buftype) || airline#util#ignore_buf(bufname('%'))
    return ''
  endif
  if &readonly && !filereadable(bufname('%'))
    return '[noperm]'
  else
    return &readonly ? g:airline_symbols.readonly : ''
  endif
endfunction

function! airline#parts#filetype()
  return (airline#util#winwidth() < 90 && strlen(&filetype) > 3)
        \ ? matchstr(&filetype, '...'). (&encoding is? 'utf-8' ? 'β¦' : '>')
        \ : &filetype
endfunction

function! airline#parts#ffenc()
  let expected = get(g:, 'airline#parts#ffenc#skip_expected_string', '')
  let bomb     = &bomb ? '[BOM]' : ''
  let noeolf   = &eol ? '' : '[!EOL]'
  let ff       = strlen(&ff) ? '['.&ff.']' : ''
  if expected is# &fenc.bomb.noeolf.ff
    return ''
  else
    return &fenc.bomb.noeolf.ff
  endif
endfunction
