# Para monitorear el ancho de banda
# g para ver una grafica
# d para estadisticas detalladas
sudo apt-get install bmon

# Para ver el consumo por aplicacion
sudo apt-get install nethogs

#Limitar el ancho de banda
sudo wondershaper eth0 1024 512 
# El ejemplo anterior limita la conexión a 1024kbps de bajada y 512kbps de subida

