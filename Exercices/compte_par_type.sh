#!/usr/bin/bash

cd ann

annee=$1
type=$2

cat $annee/*/* | grep $type | wc -l
