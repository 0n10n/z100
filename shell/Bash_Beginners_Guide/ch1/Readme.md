Are the following shells interactive shells? Are they login shells?

- A shell opened by clicking on the background of your graphical desktop, selecting "Terminal"
or such from a menu.
interactive/non-login

- A shell that you get after issuing the command ssh localhost.
interactive/login

- A shell that you get when logging in to the console in text mode.
interactive/login

- A shell obtained by the command xterm &.

- A shell opened by the mysystem.sh script.
non-interactive/login

- A shell that you get on a remote host, for which you didn't have to give the login and/or
password because you use SSH and maybe SSH keys.
non-interactive/non-login
