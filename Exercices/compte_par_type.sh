#!/usr/bin/bash

annee=$1
type=$2

cat ann/$annee/*.ann | grep $type | wc -l
