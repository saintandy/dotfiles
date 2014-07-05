# install homebrew

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# install cask

brew install caskroom/cask/brew-cask

# install other software

brew install git
brew install vim
brew install coreutils
brew install zinc

# install vim and terminal themes - but first sudo :)

sudo cp -r .vim ~/
sudo cp .zshrc ~/
sudo cp .bashrc ~/
sudo cp -r .oh-my-zsh ~/
sudo cp terminal/plathrop-zenburn.terminal ~/Desktop
sudo cp shell-scripts/* /usr/bin

echo "Please change the terminal theme (file is on Desktop)"

for i in {30..0}; do
	echo $i'..'
	sleep 1
done

rm -rf ~/Desktop/plathrop-zenburn.terminal

# configuring git

git config --global user.email "vladtarniceru@gmail.com"

# install gui programs

brew cask install seil
brew cask install coconutbattery
brew cask install google-chrome
