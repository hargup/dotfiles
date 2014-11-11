# Automagically quote/escape URLs pasted in zle.

autoload -U url-quote-magic && {
  zle -N self-insert url-quote-magic
}
