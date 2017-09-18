# Created by newuser for 5.3
autoload -U compinit
compinit

setopt auto_menu
setopt correct
setopt auto_name_dirs
setopt auto_remove_slash
setopt extended_history
setopt pushd_ignore_dups
setopt rm_star_silent
setopt sun_keyboard_hack
setopt extended_glob
setopt no_beep
setopt sh_word_split
setopt auto_param_keys
setopt auto_pushd
setopt list_packed
setopt list_types
setopt no_case_glob
setopt complete_in_word
setopt prompt_subst

# 補完と履歴の設定
# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=1000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt magic_equal_subst
setopt auto_param_slash
setopt hist_ignore_all_dups
setopt hist_ignore_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 補完時に大文字小文字を区別しない
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

function history-all { history -E 1 }
bindkey '^h' zaw-history

# show japanese character
setopt print_eight_bit

# 範囲指定できるようにする
# 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる
setopt brace_ccl

# C-s, C-qを無効にする。
setopt no_flow_control

# treat comment after sharp.
setopt interactive_comments

# ディレクトリ名だけで移動できる。
setopt auto_cd
#cdpath=(.. ~ ~/src)
# }}}
# {{{ basic zsh behavior
autoload -U compinit
compinit -u
bindkey -e

bindkey \^U backward-kill-line

# Path settings
# python
export PYENV_ROOT="/Users/shintaro/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# export PATH="/Users/shintaro/.pyenv/versions/anaconda-4.0.0/bin/:$PATH"

# GOLANG
export GOPATH="$HOME/work/go"
export GOPATH="$HOME/work/go"
export PATH="$PATH:$GOPATH/bin"
#export PATH="$PATH:/usr/local/go/bin"

# alias setting
alias pyml="source /Users/shintaro/.pyenv/versions/anaconda-4.0.0/envs/pyml/bin/activate pyml"
alias pyml3="source /Users/shintaro/.pyenv/versions/anaconda-4.0.0/bin/activate pyml3"
alias py3="source /Users/shintaro/.pyenv/versions/anaconda-4.0.0/bin/activate py3"
alias jn="jupyter notebook"
alias ls="ls -G"
alias l="ls -la"
alias zplugm="source .zplug_manager"
alias subp="subl ./"
alias f="open ."
alias tsubame="docker exec -it tsubame /bin/bash"

cdf () {
        target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
        if [ "$target" != "" ]
        then
                cd "$target"
                pwd
        else
                echo 'No Finder window found' >&2
        fi
}
jj () {
    if [ $1 ]; then
        JUMPDIR=$(find . -type d -maxdepth 1 | grep $1 | tail -1)
        if [[ -d $JUMPDIR && -n $JUMPDIR ]]; then
            cd $JUMPDIR
        else
            echo "directory not found"
        fi
    fi
}


# prompt setting
PROMPT='%m:%F{green}[%c]%f '
#RPROMPT='${time} %{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_prompt_ahead)%{$reset_color%}'
export BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

#export PATH="/usr/local/opt/qt5/bin:$PATH"
#export PATH="/usr/local/opt/qt5/bin:$PATH"

