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


#same script as above but accepts other values from y or n
#above scipt would only accept y or n or else it would wait

# echo -n " Y/N?"
# old_stty_cfg=$(stty -g)
# stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg
# if echo "$answer" | grep -iq "^y" ;then
#       echo Yes
# else
#       echo No
# fi

# ./prompt2.sh && echo $! > pid.txt - executes the command and stores the process id of shell script in a text file
