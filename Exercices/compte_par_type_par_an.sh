#!usr/bin/bash

type=$1

echo "Nombre de $type dans 2016"
bash compte_par_type.sh 2016 $type

echo "Nombre de $type dans 2017"
bash compte_par_type.sh 2017 $type

echo "Nombre de $type dans 2018"
bash compte_par_type.sh 2018 $type
