export "GPG_TTY=$(tty)"
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
echo "/echo" | gpg-connect-agent || (
	gpg-connect-agent killagent /bye
	gpg-connect-agent /bye
)
