#!/usr/bin/bash

if [ ! -d "ann" ]
then
    echo "il n'existe pas ce dossier ann, veuillez vérifier votre chemin"
    exit
fi

echo "Nombre de lieux dans 2016"
cat ann/2016/*/* | grep Location | wc -l
echo "Nombre de lieux dans 2017"
cat ann/2017/*/* | grep Location | wc -l
echo "Nombre de lieux dans 2018"
cat ann/2018/*/* | grep Location | wc -l





