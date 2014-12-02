#!/bin/bash
function cambiarAtributos(){

drive s: file= $1
mtools_skip_check=1
mdir s: 
mattrib -h +a -s S:/*

}

cambiarAtributos()
rm -f *.{lnk,Lnk,lNK,LNK,LNk,lNk,lnK,LnK,lNK}
rm autorun.inf

