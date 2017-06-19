#!/Bin/bash

# Convertir de .flv a .avi (XViD)
sudo apt install ffmpeg
ffmpeg -i video.flv -c:v mpeg4 -vtag xvid video.avi

# Convertir de TIFF a PDF
sudo apt-get install ghostscript libtiff-tools
tiff2pdf -o salida.pdf archivo.TIF

# Convertir video a GIF
ffmpeg -t 5 -ss 00:00:10 -i VIDEO SALIDA.gif

# Convertir de MKV a MP4
ffmpeg -i input.mkv -codec copy output.mp4

# Convertir imagen a texto
# Fuente: http://geekland.eu/extraer-texto-imagen-con-ocrfeeder/
sudo apt-get install ocrfeeder tesseract-ocr tesseract-ocr-spa tesseract-ocr-eng gocr cuneiform ocropusocrad
ocrfeeder
