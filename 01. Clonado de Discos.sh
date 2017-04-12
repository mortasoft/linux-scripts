# Con este script se pueden clonar una imagen a varias llaves USB al mismo tiempo
dd if=/home/mortasoft/imagen.dd of=/dev/sde conv=notrunc & 
dd if=/home/mortasoft/imagen.dd of=/dev/sdf conv=notrunc & 
dd if=/home/mortasoft/imagen.dd of=/dev/sdg conv=notrunc & 
dd if=/home/mortasoft/imagen.dd of=/dev/sdh conv=notrunc
