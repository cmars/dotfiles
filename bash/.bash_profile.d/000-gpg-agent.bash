export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
eval $( gpg-agent --daemon --enable-ssh-support 2>/dev/null )
