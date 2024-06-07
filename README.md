# Dotfiles Repository

This repository contains my personal configurations for `nvim` (Neovim) and `tmux`. These configurations are designed to enhance productivity and user experience, focusing on a streamlined workflow for development and terminal management.

## Contents

- **nvim/**: Directory containing all Neovim configuration files, including `init.vim`, plugins, and any additional setup scripts.
- **tmux/**: Contains `tmux.conf` and any other tmux-related configuration scripts to customize the tmux environment.

## Getting Started

### Prerequisites

- **Neovim**: Ensure you have the latest version of Neovim installed on your system. Visit the [Neovim GitHub](https://github.com/neovim/neovim) page for installation instructions.
- **tmux**: tmux should also be installed on your system. Installation instructions can be found on the [tmux GitHub](https://github.com/tmux/tmux) page.

### Installation

1. **Clone the Repository**: Start by cloning this repository to your local machine. Consider cloning it to a `dotfiles` directory in your home folder:

    ```bash
    git clone https://github.com/oriollinan/.dotfiles.git ~/dotfiles
    ```

2. **Run the Setup script**:
    ```bash
    bash setup.sh
    ```

### Post-installation

After creating the symbolic links, you might need to restart your terminal or source the configuration files for the changes to take effect.

For `nvim`, you can source the configuration file by running `:source %` within Neovim.

For `tmux`, you can source the configuration file by running `tmux source-file ~/tmux/.tmux.conf`.

## Customization

Feel free to customize the configuration files to suit your preferences. For `nvim`, you can add or remove plugins and settings in the `init.vim` file. For `tmux`, you can adjust key bindings and other settings in `tmux.conf`.

## Contributions

Contributions to this repository are welcome. If you have suggestions or improvements, please open an issue or submit a pull request.

## License

This dotfiles repository is open-sourced under the MIT License. See the LICENSE file for more details.
