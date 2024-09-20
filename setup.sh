CURRENT_DIR=$(pwd)
CONFIG_DIR="$HOME/.config"

mkdir -p $CONFIG_DIR

# remove existing config files
rm -rf $CONFIG_DIR/tmux
rm -f $HOME/.tmux.conf
rm -rf $CONFIG_DIR/nvim
rm -rf $HOME/.local/share/nvim

# symbolically link tmux and nvim config files
ln -s $CURRENT_DIR/tmux $CONFIG_DIR/tmux
# link the tmux.conf file for tmux start up
ln -s $CURRENT_DIR/tmux/.tmux.conf $HOME
ln -s $CURRENT_DIR/nvim $CONFIG_DIR/nvim

# source the config files
SESSION=session
tmux new-session -d -s $SESSION
tmux source $CONFIG_DIR/tmux/.tmux.conf
tmux kill-session -t $SESSION
nvim -c "source $CONFIG_DIR/nvim/init.lua" -c "qa"
