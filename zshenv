# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export PATH="$HOME/.bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

PATH="/Users/jeff/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/jeff/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/jeff/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/jeff/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jeff/perl5"; export PERL_MM_OPT;
