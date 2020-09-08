lsusb | grep 1050:0406 && (
export "GPG_TTY=$(tty)"
export SSH_AUTH_SOCK=/run/user/$(id -u)/gnupg/S.gpg-agent.ssh
echo "/echo" | gpg-connect-agent || (
	gpg-connect-agent killagent /bye
	gpg-connect-agent /bye
)
) || true
