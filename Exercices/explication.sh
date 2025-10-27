if [ $# -ne 1 ]
then
    echo "un argument demandé"
    exit
fi

if [ ! -f $1 ]
then
    echo "vous devez indiquer un fichier"
    exit
fi

