export DOTNET_CLI_TELEMETRY_OPTOUT=true
export GOPATH=$HOME/code
export PATH=$PATH:$HOME/code/bin
export PATH=$PATH:$HOME/bin
export TF_SCHEMA_PANIC_ON_ERROR=1
export ZPLUG_HOME=$HOME/.zplug

# Lazy
alias freewifi="sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`"
alias mifi="huawei-e5573-mifi-cli"
alias tfyolo="terraform apply --auto-approve"

# Laptop Usability
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Plugins
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-apple-touchbar"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/git", from:oh-my-zsh
zplug "themes/terminalparty", as:theme, from:oh-my-zsh
zplug load

ZSH_THEME="terminalparty"

NEWLINE=$'\n'
PROMPT='%{$fg[yellow]%}%t%  %(?,%{$fg[green]%},%{$fg[white]%})%{$fg[gray]%}%2~${NEWLINE} %{$fg[white]%}\$ '
RPS1='%{$fg[yellow]%}$(git_prompt_info)'

# Helper functions
function provider() {
   cd $GOPATH/src/github.com/terraform-providers/terraform-provider-$1
}
