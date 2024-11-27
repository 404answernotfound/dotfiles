# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search z fzf direnv)

source $ZSH/oh-my-zsh.sh

alias ll="ls -la"
alias wiw="watch -d=cumulative -n 5 "
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias vimdiff="nvim -d"
alias nano="nvim" #learn vim you little shit\

alias chromeuser="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --profile-directory=\"Default\""

gotowebsite() {
  if [ -z "$1" ]; then
    echo "Usage: gotowebsite <argument>"
    echo "If <argument> is 'sh', the function opens https://github.com/Schroedinger-Hat in your default browser."
  elif [ "$1" = "sh" ]; then
    open "https://github.com/Schroedinger-Hat"
  elif [ "$1" = "osday" ]; then
    open "https://osday.dev"
  else
    echo "No action performed."
  fi
}


alias r="reset"
alias create_files_with_random_words="bash /Users/<user>/Desktop/<user>/Dev/scripts/create_files_with_random_words.sh"

alias gitconfig='git config -l'

alias wholisten='function _xxx(){ lsof -i:$1 };_xxx'
alias killwholisten='function _xxx(){ kill -9 $(lsof -i:$1 -t) };_xxx'
alias killnode='sudo killall -9 node'


# kubectl
alias k="kubectl"
alias kctx="kubectl config get-contexts"

# git utility
alias gitdiff="git diff --color-words"
alias gitdifff="git diff $1 $2 --name-only"
alias gcamm="gitmoji -c"


alias convertmp4="_convertmp4"
function _convertmp4() {
    if [ -z $1 ]; then
        echo "Usage: convertmp4 [path/to/video without extension]"
        return
    fi

    ffmpeg -i $1.mov -vcodec h264 -acodec mp2 $1.mp4
};

export EDITOR='nvim'

alias convert2mp3="_convert2mp3"
function _convert2mp3() {
    if [ -z $1 ]; then
        echo "Usage: convert2mp3 [path/to/video without extension]"
        return
    fi

    ffmpeg -i $1.wav -acodec mp3 -ab 192k $1.mp3
};

ksecrets() {
  local pod_name=$1
  local namespace=$2
  if [[ -z $pod_name || -z $namespace ]]; then
    echo "Usage: ksecrets <pod-name> <namespace>"
  else
    kubectl exec -it "$pod_name" -n "$namespace" -- /bin/sh -c 'env'
  fi
}

# logs
klogs() {
  local pod_name=$1
  local namespace=$2
  if [[ -z $pod_name || -z $namespace ]]; then
    echo "Usage: klogs <pod-name> <namespace>"
  else
    stern -n "$namespace" "$pod_name" --timestamps
  fi
}

# utility
khelp() {
    # echo all aliases we have for kubectl
    echo "kubectl aliases:"
    echo "kctx - List all contexts"
    echo "klogs - Get logs for a pod in a namespace"
    echo "ksecrets - Get secrets for a pod in a namespace"
    echo "stern - Tail logs for a pod in a namespace (stern <pod-name> -n <namespace> --timestamps)"
}

alias isodate='date -u +"%Y-%m-%dT%H:%M:%SZ"'

alias uuidgen="node -e \"console.log(require('child_process').execSync('uuidgen', { encoding: 'utf8' }).trim().toLowerCase())\""

copy () {
	eval "$@" | pbcopy
}


alias getpass="pass show -c $1"
alias savepass="pass insert $1"

alias ws="open -na 'WebStorm.app' --args "$@""
alias goland="open -na 'Goland.app' --args "$@""

alias ask="ollama run codellama:13b-instruct $1"

alias zshedit="code ~/.zshrc"
alias zshreload="source ~/.zshrc"

alias decode64="base64 --decode <<< $1"
alias encode64="base64 <<< $1"


404() {
  echo "My system aliases:"
  echo -e "\033[1;32mgotowebsite @1\033[0m - Go to a website"
  echo -e "\033[1;32mkhelp \033[0m - Get help with kubectl aliases"
  echo -e "\033[1;32mgetpass @1\033[0m - Get password from pass"
  echo -e "\033[1;32msavepass @1\033[0m - Save password to pass"
  echo -e "\033[1;32mws\033[0m - Open WebStorm"
  echo -e "\033[1;32mgoland\033[0m - Open Goland"
  echo -e "\033[1;32mask\033[0m - Ask a question to the codellama"
  echo -e "\033[1;32mzshedit\033[0m - Edit zshrc"
  echo -e "\033[1;32mzshreload\033[0m - Reload zshrc"
  echo -e "\033[1;32mcode @1\033[0m - Open file in VSCode"
  echo -e "\033[1;32mdecode64 @1 @1\033[0m - Decode Base64"
  echo -e "\033[1;32mencode64 @1 @1\033[0m - Encode Base64"
  echo -e "\033[1;32mcopy\033[0m - Copy"
}