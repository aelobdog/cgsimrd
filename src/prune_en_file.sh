#!/bin/sh
list=`ls sim/ | grep ".energy"`
for i in $list
do
   sed "#.*//g" -i "./sim/$i"
done
