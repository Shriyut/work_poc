#/bin/sh

# this script doesnt wait for user to press enter after receiving input
# will only accept Y or N
echo -n " Y/N? "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done ) # careful playing with stty 
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
        echo Yes
else
        echo No
fi
