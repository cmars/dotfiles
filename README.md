[![Build Status](https://travis-ci.org/cmars/dotfiles.svg)](https://travis-ci.org/cmars/dotfiles)

# dotfiles

These are my dotfiles. There are many like them, but these dotfiles are mine.

My dotfiles are my best friend. They are my life. I must master them as I must
master my life.

My dotfiles, without me, are useless. Without my dotfiles, on a remote instance
or new laptop, I am useless.

# Install

## Check out & run setup with git

1. Clone this repo as $HOME/dotfiles
2. `$HOME/dotfiles/setup.bash`

## Bootstrap it with curl

Download the bootstrap script:
```
$ curl -L https://git.io/h42W > setup.bash
```

Verify integrity if you trust Github and your connection to it:
```
$ curl -L https://git.io/h4V3 > setup.bash.sig

$ gpg --keyserver pool.sks-keyservers.net --recv-key 0xF79362DA44A2D1DB
$ gpg --verify setup.bash.sig
gpg: assuming signed data in 'setup.bash'
gpg: Signature made Wed 18 Mar 2015 04:45:32 PM CDT using RSA key ID 8DDA301A
gpg: Good signature from "Casey Marshall ...
Primary key fingerprint: 8127 9EEE 7EC8 9FB7 8170  2ADA F793 62DA 44A2 D1DB
     Subkey fingerprint: 3B60 A37D F94C E73D 4780  7181 879C F8AA 8DDA 301A
```

Run the bootstrap script:
```
$ bash setup.bash
```

---

Copyright 2014 Casey Marshall.
