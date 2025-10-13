#!/usr/bin/bash

annee=$1
type=$2

if [ ! -d "ann/$annee" ]
then
  echo "il n'existe pas ce dossier $annee, veuillez utiliser ls pour voir les dossiers existants"
  exit
fi

cat ann/$annee/*/* | grep $type | wc -l
