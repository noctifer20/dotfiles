clone_repo() {
  echo "===> Cloning dotfiles..."
  git clone https://github.com/noctifer20/dotfiles.git
  cd dotfiles
}

install_brew() {
  echo "===> Installing Homebrew..."
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo "Homebrew is already installed."
  fi

  brew bundle install --file=./Brewfile
}

install_omz() {
  echo "===> Installing Oh My Zsh..."
  curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
  
  echo "===> Installing Oh My Zsh themes and plugins..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

install_nvm() {
  echo "===> Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
}

setup_ssh() {
  echo "===> Setting up SSH..."
  mkdir ~/.ssh
  op inject -f -i ./.ssh/id_rsa.pub.tpl -o ~/.ssh/id_rsa
  op inject -f -i ./.ssh/id_rsa.pub.tpl -o ~/.ssh/id_rsa.pub
  chmod 600 ~/.ssh/id_rsa
  chmod 644 ~/.ssh/id_rsa.pub
}


setup_git() {
  echo "===> Setting up Git..."
  cp ./git/.gitconfig.tpl ~/.gitconfig
  op inject -i ./git/gh-token.tpl | gh auth login --with-token
}

install_lvim() {
  echo "===> Installing LunarVim..."
  export LV_BRANCH="release-1.4/neovim-0.9"
  curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh | bash
}

setum_rc() {
  echo "===> Setting up rc..."
  rcup -d ./rc -C -v
}

main() {
  clone_repo
  install_brew
  install_omz
  install_nvm
  setup_ssh
  setup_git
  install_lvim
  setum_rc
}

main