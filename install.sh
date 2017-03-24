echo "WARNING: Made for OSX - some installs might not work as expected."


echo ""
echo ""


echo "Setting up shell."
echo "--- Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "--- Adding .zshrc"
cp .zshrc ~/.zshrc


echo ""
echo ""


echo "Setting up vim."
echo "--- Installing vim"
brew install vim
echo "--- Installing neovim"
brew install neovim
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
