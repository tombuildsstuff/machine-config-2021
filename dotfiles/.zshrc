# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTNET_CLI_TELEMETRY_OPTOUT=true
export GOPATH=$HOME/code
export PATH=$PATH:$HOME/homebrew/bin
export PATH=$PATH:$HOME/code/bin
export PATH=$PATH:$HOME/bin
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/Applications:$PATH
export TF_SCHEMA_PANIC_ON_ERROR=1
export ZPLUG_HOME=$HOME/.zplug
export AZURE_CLI_DISABLE_CONNECTION_VERIFICATION=1
export JAVA_HOME=$HOME/Library/Java/JavaVirtualMachines/corretto-15.0.2/Contents/Home
export DOTNET_ROOT="/usr/local/opt/dotnet/libexec"

# Lazy
alias freewifi="sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`"
alias mifi="huawei-e5573-mifi-cli"
alias tf="terraform"
alias tfyolo="terraform apply --auto-approve"

# Laptop Usability
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Files
ulimit -n 10240

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
   cd $GOPATH/src/github.com/hashicorp/terraform-provider-$1
}
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
