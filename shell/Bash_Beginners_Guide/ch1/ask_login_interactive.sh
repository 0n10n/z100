#!/usr/bin/bash
# Originally from: https://unix.stackexchange.com/questions/38175/difference-between-login-shell-and-non-login-shell/522708#522708

THIS_SHELL_INTERACTIVE_TYPE='non-interactive';
THIS_SHELL_LOGIN_TYPE='non-login';
if tty -s; then THIS_SHELL_INTERACTIVE_TYPE='interactive'; fi;
if echo $0 | grep -e ^\- 2>&1>/dev/null; then THIS_SHELL_LOGIN_TYPE='login'; fi;
echo "$THIS_SHELL_INTERACTIVE_TYPE/$THIS_SHELL_LOGIN_TYPE"
