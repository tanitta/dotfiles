./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --with-compiledby='Arch Linux' \
    --enable-gpm \
    --enable-acl \
    --with-x=yes \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --enable-netbeans \
    --enable-perlinterp \
    --enable-pythoninterp \
    --disable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp \
    --with-lua-prefix=/usr \
    --with-luajit
make -j6

