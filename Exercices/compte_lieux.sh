#!/usr/bin/bash
#Veuillez tapez "*" pour l'année et le mois (avec les guillemets)

annee=$1
mois=$2
nombre_de_lieux=$3


#echo "Classement des lieux les plus cités"
#cat ann/$annee/$mois/* | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $nombre_de_lieux
if [ ! -d "ann/$annee" ]
then
  echo "il n'existe pas ce dossier $annee, veuillez utiliser ls pour voir les dossiers existants"
  exit
fi

if [ ! -d "ann/$annee/$mois" ]
then
  echo "il n'existe pas ce dossier $mois, veuillez utiliser ls pour voir les dossiers existants"
  exit
fi

if [[ $annee == "*" && $mois == "*" ]]
then
    echo "Classement des lieux les plus cités dans les trois années"
    cat ann/*/*/* | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $nombre_de_lieux
elif [[ $annee == "*" ]]
then
    echo "Classement des lieux les plus cités en $mois à n'importe quelle année"
    cat ann/*/$mois/* | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $nombre_de_lieux
elif [[ $mois == "*" ]]
then
    echo "Classement des lieux les plus cités dans $annee"
    cat ann/$annee/*/* | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $nombre_de_lieux
else
    echo "Classement des lieux les plus cités en $annee-$mois"
   cat ann/$annee/$mois/* | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $nombre_de_lieux
fi
