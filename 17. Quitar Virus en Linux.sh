#!/bin/bash

# Este script fue desarrollado para eliminar el virus de accesos directos en windows
# Dependencias:
# sudo apt-get install mtools
# Fuente: https://phenobarbital.wordpress.com/2010/10/18/linux-sirve-hasta-para-arreglar-ms-windows/

function cambiarAtributos(){

drive s: file= $1
mtools_skip_check=1
mdir s: 
mattrib -h +a -s S:/*

}

cambiarAtributos()
rm -f *.{lnk,Lnk,lNK,LNK,LNk,lNk,lnK,LnK,lNK}
rm autorun.inf

