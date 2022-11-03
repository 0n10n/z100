#!/usr/bin/bash
# The following code is from:
# https://unix.stackexchange.com/questions/38175/difference-between-login-shell-and-non-login-shell/522708#522708
# To check current shell , whether it's "interactive/non-interactive" and "login/non-login" status. 

THIS_SHELL_INTERACTIVE_TYPE='non-interactive'; 
THIS_SHELL_LOGIN_TYPE='non-login'; 
if tty -s; then THIS_SHELL_INTERACTIVE_TYPE='interactive'; fi; 
if echo $0 | grep -e ^\- 2>&1>/dev/null; then THIS_SHELL_LOGIN_TYPE='login'; fi;
echo "$THIS_SHELL_INTERACTIVE_TYPE/$THIS_SHELL_LOGIN_TYPE"