echo "WARNING: Made for OSX - some installs might not work as expected."


echo ""
echo ""


echo "Setting up brew."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


echo ""
echo ""


echo "Setting up git."
brew install git
git config --global user.name saintandy
git config --global user.email vladtarniceru@gmail.com
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global core.editor vim
git config --global color.status auto
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global pull.rebase true
git config --global core.ignorecase true
git config --global alias.lg "log --all --color --graph --abbrev-commit --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset'"
git config --global alias.lgn "log --all --color --name-status --graph --abbrev-commit --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset'"


echo "Setting up shell."
echo "--- Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "--- Adding .zshrc"
cp .zshrc ~/.zshrc
cp allsaints.zsh-theme ~/.oh-my-zsh/themes/


echo ""
echo ""


echo "Setting up vim."
echo "--- Installing vim"
brew install vim
echo "--- Installing neovim"
brew install neovim
brew install python
brew install python3
sudo easy_install pip
pip2 install --user neovim
pip3 install --user neovim
echo "--- Adding .vimrc"
cp .vimrc ~/.vimrc
echo "--- Creating .vim directory"
mkdir ~/.vim
echo "--- Cloning Vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "--- Adding custom hybrid colorscheme"
mkdir ~/.vim/colors
cp hybrid.vim ~/.vim/colors/
echo "--- Installing vim plugins"
vim -c PluginInstall -c qa
echo "--- Installing YCM"
cd ~/.vim/bundle/YouCompleteMe
./install.py


echo ""
echo ""

echo "Setting up fonts."
echo "--- Moving fonts to /Library/Fonts/"
cp fonts/* /Library/Fonts/


echo ""
echo ""


echo "Setting up commands."
echo "--- Installing wget"
brew install wget
brew install node
npm install -g vtop


echo ""
echo ""


echo "Setting up iterm."
echo "--- Installing iterm"
brew install iterm
echo "--- Please load the hybrid theme (this must be made manually)"
