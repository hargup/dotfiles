# Setup ruby env using chruby.
chruby_files=(/usr/local/share/chruby/chruby.sh \
              /usr/local/share/chruby/auto.sh)
for chruby_file in $chruby_files; do
  [[ -f $chruby_file ]] && source $chruby_file
done
unset chruby_file chruby_files
