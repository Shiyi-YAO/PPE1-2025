ficher_URLS=$1

if [ $# -ne 1 ]
then
    echo "ce programme demande un argument"
    exit
fi

if [ ! -f "$ficher_URLS" ]
then
    echo "vous devez indiquer un ficher"
    exit
fi

echo -e "nb\tline\tcode_http\tencodage\tnb_mot" > tableaux/tableau_fr.tsv

nb=0

while read -r line;
do
    nb=$(expr $nb + 1)
    data=$(curl -I -w "%{http_code}\n%{content_type}" -o /dev/null -s $line)
    code_http=$(echo "$data" | head -1)
    encodage=$(echo "$data" | grep charset | cut -d '=' -f2 | tr -d '\r')
    nb_mot=$(lynx -dump -nolist $line | wc -w)

    if [ ! "$encodage" ]
    then
        encodage="No_encodage"
    fi

	echo -e "${nb}\t${line}\t${code_http}\t${encodage}\t${nb_mot}" >> tableaux/tableau_fr.tsv

done < "$ficher_URLS";
