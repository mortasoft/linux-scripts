#!/bin/bash
qpdf --decrypt protected.pdf unprotected.pdf

# Si el archivo PDF está protegido con un password
qpdf --decrypt --password prueba1234 protected.pdf unprotected.pdf
