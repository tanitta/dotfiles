export EDITOR=nvim
export TERM=rxvt-unicode-256color


# PATH の設定（お好みで）
export PATH="/usr/local/bin:$PATH"
export PATH="/home/tanitta/local/bin:$PATH"
export PATH=$PATH:~/.local/bin

# export GOPATH="/home/tanitta/dev/go:$GOPATH"
export GOROOT=$HOME/dev/go
export GOPATH=$GOROOT/packages
export PATH=$PATH:$GOROOT/bin

# export LUA_PATH=~/dev/lua_lib
export LUA_PATH=~/dev/cc_lib
# export PATH=$PATH:~/dev/activator-1.2.10-minimal
export PATH=$PATH:~/dev/play-2.2.5

# Haskellとか
export PATH=$PATH:~/.cabal/bin

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# export PATH="$HOME/.gem/ruby/2.2.0/bin:$PATH"
# export PATH="$HOME/.gem/ruby/2.2.2/bin:$PATH"

export PATH="$PATH:/usr/local/jruby/bin"

#toolとか
export PATH=$PATH:~/.tools

export PATH=$PATH:~/.phantomjs/1.9.8/x86_64-linux/bin

# PATH の内容と同期している配列変数 path も使える
path=(
    ~/bin
    $path
)

# もし .zshenv を複数のマシンで共有していて、
# あるマシンには存在するが別のマシンには存在しないパスを PATH に追加したいなら、
# パスの後ろに (N-/) をつけるとよい
# こうすると、パスの場所にディレクトリが存在しない場合、パスが空文字列に置換される
# 詳細は `man zshexpn` の Glob Qualifiers を参照
path=(
    /machine1/only/bin(N-/)
    $path
)
