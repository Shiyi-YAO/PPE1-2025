# Question
# 1. Pourquoi ne pas utiliser cat ?
# command en utilisant cat : cat urls/fr.txt
# résultat : ces deux façon vont afficher la même chose (le contenu du fichier ligne par ligne), mais cat va juste lire ce ficher, et avec boucle while on peut non juste lire ce ficher et le traiter

# 2. Comment transformer "urls/fr.txt" en paramètre du script ?
ficher_URLS=$1
#    2.1 Valider l’argument : ajouter le code nécessaire pour s’assurer qu’on donne bien un argument au script, sinon on s’arrête

# vérifier si on a bien argument
if [ $# -ne 1 ]
then
    echo "ce programme demande un argument"
    exit
fi

# vérifier l'argument est bien un ficher
if [ ! -f "$ficher_URLS" ]
then
    echo "vous devez indiquer un ficher"
    exit
fi

echo -e "nb\tline\tcode_http\tencodage\tnb_mot" > tableaux/tableau_fr.tsv

nb=0
meta=""
code_http=""
encodage=""
nb_mot=""
while read -r line;
do
    nb=$(expr $nb + 1)
    data=$(curl -I -s -L $line)
    code_http=$(echo $data | grep HTTP | cut -d ' ' -f2)
    encodage=$(echo $data | grep charset | cut -d '=' -f2 | tr -d '\r')
    nb_mot=$(lynx -dump -nolist $line | wc -w)

    if [ ! "$encodage" ]
    then
        encodage="No_encodage"
    fi


	echo -e "${nb}\t${line}\t${code_http}\t${encodage}\t${nb_mot}" >> tableaux/tableau_fr.tsv

done < "$ficher_URLS";
