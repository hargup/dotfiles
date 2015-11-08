symlink_to_home =							\
	if test -e ~/$(file); then					\
		echo "Warning: ~/$(file) already exists";		\
	else								\
		ln -s ~/dotfiles/$(file) ~/$(file);			\
	fi;

remove_if_symlink =							\
	if test -e ~/$(file); then					\
		if test -h ~/$(file); then				\
			rm ~/$(file);					\
		else							\
			echo "Warning: ~/$(file) is not a symlink";	\
		fi;							\
	fi;

candidates =	\
.zshrc .zsh	\
.vim .vimrc	\
.gitconfig .gittemplate	\
.irbrc .gemrc

all::
	@$(foreach file,$(candidates),$(symlink_to_home))
	git submodule update --init --recursive
	bundle

update:
	git submodule foreach 'git checkout master; git pull'
	bundle update

clean:
	@$(foreach file,$(candidates),$(remove_if_symlink))
