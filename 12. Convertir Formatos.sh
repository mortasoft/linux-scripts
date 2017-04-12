#!/Bin/bash

# Convertir de .flv a .avi (XViD)
ffmpeg -i video.flv -c:v mpeg4 -vtag xvid video.avi


