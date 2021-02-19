#POSIX generic solution for prompting users to provide input to run scripts

echo -n " Y/N?"
echo # to start a newline
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
        echo "Yes"
else
        echo "No"
fi

# passing values from command line
# $ yes '' | ./test.sh 
# Y/N?No
# $ yes 'Y' | ./test.sh 
# Y/N?Yes

# ./prompt.sh && echo $! > pid.txt - executes the command and stores the process id of shell script in a text file
