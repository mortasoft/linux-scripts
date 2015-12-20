#!/bin/bash
function suma(){
c=$(expr $1 + $2)
return $c
}

suma $1 $2
echo -e "suma=$?\n"


