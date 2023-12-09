export PLUG_DIR=$HOME/.zim
if [[ ! -d $PLUG_DIR ]]; then
	curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
	rm ~/.zimrc
	ln -s ~/.config/zsh/zimrc ~/.zimrc
fi

export P10K_FILE=$HOME/.p10k.zsh
if [[ ! -f "$P10K_FILE" ]]; then
	ln -s ~/.config/zsh/p10k.zsh ~/.p10k.zsh
fi