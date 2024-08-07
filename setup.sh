# # brew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# eval "$(/opt/homebrew/bin/brew shellenv)"

# brew bundle install --file=./Brewfile
# brew bundle install --file=./Brewfile.cask

# # oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# .ssh
# mkdir ~/.ssh
# op inject -i ./.ssh/id_rsa.pub.tpl -o ~/.ssh/id_rsa
# op inject -i ./.ssh/id_rsa.pub.tpl -o ~/.ssh/id_rsa.pub
# chmod 600 ~/.ssh/id_rsa
# chmod 644 ~/.ssh/id_rsa.pub

# # git
cp ./git/.gitconfig.tpl ~/.gitconfig
op inject -i ./git/gh-token.tpl | gh auth login --with-token

# # lvim
# export LV_BRANCH="release-1.4/neovim-0.9"
# bash < $(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)

# # rc
# rcup -d ./rc -C -v
