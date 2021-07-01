clear
echo '**Starting Application**'

# If it has been built before, don't bundle.
if test -f ".build" 
then 
    echo "Last Build: "
    cat .build
else
    bundle
    date +%D > ".build"
fi

ruby src/index.rb