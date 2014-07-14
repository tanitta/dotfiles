apt-get install fonts-inconsolata
apt-get install fontforge
git clone https://github.com/Lokaltog/vim-powerline.git
cd /usr/share/fonts/truetype/inconsolata/ 
fontforge -lang=py -script ~/dotfiles/vim-powerline/fontpatcher/fontpatcher Inconsolata.otf
rm -rf ~/dotfiles/vim-powerline

