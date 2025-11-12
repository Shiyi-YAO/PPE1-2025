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

echo -e "<table>\n\t<tr><th>nb</th><th>line</th><th>code_http</th><th>encodage</th><th>nb_mot</th>\n" > tableaux/tableau-fr.html

nb=0

while read -r line;
do
    nb=$(expr $nb + 1)
    data=$(curl -I -w "%{http_code}\n%{content_type}" -o /dev/null -s $line)
    code_http=$(echo "$data" | head -1)
    encodage=$(echo "$data" | tail -1 | cut -d '=' -f2 | tr -d '\r')
    nb_mot=$(lynx -dump -nolist $line | wc -w)

	echo -e "\t<tr><td>${nb}</td><td>${line}</td><td>${code_http}</td><td>${encodage}</td><td>${nb_mot}</td></tr>\n" >> tableaux/tableau-fr.html

echo -e "</table>"

done < "$ficher_URLS";
