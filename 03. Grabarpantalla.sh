# Comando para grabar la pantalla desde la terminal
# sudo apt-get install libav-tools
avconv -f x11grab -s 1024x768 -r 25 -i :0.0 -qscale 0 screen.mp4
