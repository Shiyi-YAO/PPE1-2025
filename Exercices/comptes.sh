#!/usr/bin/bash
cd ann
echo "Nombre de lieux dans 2016"
cat 2016/*/* | grep Location | wc -l
echo "Nombre de lieux dans 2017"
cat 2017/*/* | grep Location | wc -l
echo "Nombre de lieux dans 2018"
cat 2018/*/* | grep Location | wc -l





