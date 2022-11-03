1. Display a list of all the users on your system who log in with the Bash shell as a default.
$ grep -w bash /etc/passwd|awk -F: {' print $1 '}

2. From the /etc/group directory, display all lines starting with the string "daemon".
$ grep ^daemon /etc/group

3. Print all the lines from the same file that don't contain the string.
$ grep -v daemon /etc/group

4. Display localhost information from the /etc/hosts file, display the line number(s) matching the search string and count the number of occurrences of the string.
$ grep -n -w localhost /etc/hosts

5. Display a list of /usr/share/doc subdirectories containing information about shells.
$ grep -irl shell *

6. How many README files do these subdirectories contain? Don't count anything in the form of
"README.a_string".
$ find . |grep -w README$ |wc

7. Make a list of files in your home directory that were changed less that 10 hours ago, using grep, but leave out directories.
$ ls -dlhk --time-style=long-iso **/* |grep -v ^d |grep "Time"
Should be much easier with "find" command.

8. Put these commands in a shell script that will generate comprehensible output.

9. Can you find an alternative for wc -l, using grep?
$ grep -n

10. Using the file system table (/etc/fstab for instance), list local disk devices.
$ grep -v ^# /etc/fstab |grep -v :

11. Make a script that checks whether a user exists in /etc/passwd. For now, you can specify the username in the script, you don't have to work with arguments and conditionals at this stage.
$ if [[ `grep -w username /etc/passwd` ]];then echo 'User found!';else echo 'User not found'; fi

12. Display configuration files in /etc that contain numbers in their names.
$ ls -d1 **/*[[:digit:]]* /etc
