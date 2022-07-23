# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  nvim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    Codi $syntax" "$@"
    # set bt=nofile ls=0 |\
	# set bt=nofile ls=0 noru nonu nornu |\
    # hi NonText ctermfg=0 |\
}
