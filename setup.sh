CURRENT_DIR=$(pwd)
CONFIG_DIR="$HOME/.config"

mkdir -p $CONFIG_DIR

# remove nvim config files
rm -rf $CONFIG_DIR/nvim
rm -rf $HOME/.local/share/nvim

# remove tmux config files
rm -rf $CONFIG_DIR/tmux
rm -f $HOME/.tmux.conf

# remove aerospace config file
rm -f $CONFIG_DIR/aerospace

# remove ghostty config
rm -rf $CONFIG_DIR/ghostty

# link nvim config files
ln -s $CURRENT_DIR/nvim $CONFIG_DIR/nvim

# link tmux config files
ln -s $CURRENT_DIR/tmux $CONFIG_DIR/tmux
# link the tmux.conf file for tmux start up
ln -s $CURRENT_DIR/tmux/.tmux.conf $HOME

# link aerospace config file
ln -s $CURRENT_DIR/aerospace $CONFIG_DIR/aerospace

# link ghostty config
ln -s $CURRENT_DIR/ghostty $CONFIG_DIR/ghostty

# source the config files
SESSION=session
tmux new-session -d -s $SESSION
tmux source $CONFIG_DIR/tmux/.tmux.conf
tmux kill-session -t $SESSION
nvim -c "source $CONFIG_DIR/nvim/init.lua" -c "qa"
