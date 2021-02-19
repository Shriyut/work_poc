echo -n " Y/N?"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
        echo "Yes"
else
        echo "No"
fi
