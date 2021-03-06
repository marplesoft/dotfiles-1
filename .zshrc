export ZSH=/Users/Matthew/.oh-my-zsh

ZSH_THEME="sorin"

plugins=(bower brew bundler chucknorris cloudapp colorize common-aliases copydir copyfile docker encode64 extract frontend-search gem git git-extras git_remote_branch github heroku httpie jsontools npm nyan osx pip pj pod python rails rake-fast rvm singlechar sprunge sublime sudo urltools wd web-search xcode)

export PATH="$PATH:/opt/local/bin:/opt/local/sbin:/Library/Frameworks/Python.framework/Versions/3.5/bin:/usr/local/bin:/Users/Matthew/.rvm/gems/ruby-2.1.3/bin:/Users/Matthew/.rvm/gems/ruby-2.1.3@global/bin:/Users/Matthew/.rvm/rubies/ruby-2.1.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:/Users/Matthew/.rvm/bin:/Applications/Postgres.app/Contents/Versions/latest/bin"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
fi

export SSH_KEY_PATH="~/.ssh/id_rsa"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222"
alias nwjs="/Applications/nwjs.app/Contents/MacOS/nwjs"
alias finder="open -R"
alias s="subl"
alias sn="subl -n"
alias dus="duf | sort -n"
alias sz="source ~/.zshrc"
alias d="dirs -v"
alias -g S="| subl -"
transfer() {
    if [ $# -eq 0 ];
    then
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi
    tmpfile=$( mktemp -t transferXXX )
    file=$1
    if tty -s;
    then
        basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
        if [ ! -e $file ];
        then
            echo "File $file doesn't exists."
            return 1
        fi
        if [ -d $file ];
        then
            zipfile=$( mktemp -t transferXXX.zip )
            cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
            rm -f $zipfile
        else
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
        fi
    else
        curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    fi
    cat $tmpfile
    rm -f $tmpfile
}
trash() {
	mv $1 ~/.Trash/
}
v() {
	vmd $1 &
}

m() {
	/Applications/Moeditor.app/Contents/MacOS/Moeditor $1 &
}

eval "$(hub alias -s)"
eval "$(thefuck --alias)"

BASE16_SHELL="$HOME/.config/base16-shell/base16-material.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export PATH="/Users/Matthew/Dropbox/Development/osx/transmission-remote-cli:$PATH"
export PATH="/Users/Matthew/Dropbox/Development/osx/kwm/bin:$PATH"
export PATH="/Users/Matthew/.kwm/scripts:$PATH"
export PATH="/Users/Matthew/Documents/adt-bundle-mac-x86_64-20140702/sdk/platform-tools:$PATH"
export PATH="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/Users/Matthew/.node/bin:$PATH"
export PATH="/Users/Matthew/.miniconda2/bin:$PATH"

export GITHUB_USER="matthewdias"
PROJECT_PATHS=(~/Dropbox/Development/osx ~/Dropbox/Development/ios ~/Dropbox/Development/web ~/Dropbox/Development/android ~/Dropbox/Development/chrome ~/Dropbox/Development/electron ~/Dropbox/Development/web/latertube)
