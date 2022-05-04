systemctl start docker

sudo docker pull mcr.microsoft.com/mssql/server

sudo docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=passssssss' --name 'sql1' -p 1401:1433 -v sql1data:/var/opt/mssql -d mcr.microsoft.com/mssql/server

sudo docker exec -it sql1 mkdir /var/opt/mssql/backup

docker cp CAF_CGR_SEP19 sql1:/var/opt/mssql/backup

docker exec -it sql1 /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P '123456..' -Q 'RESTORE DATABASE CAF FROM DISK="/var/opt/mssql/backup/CAF_CGR_SEP19" WITH MOVE "CAF" TO "/var/opt/mssql/data/CAF.MDF", MOVE "CAF_log" TO "/var/opt/mssql/data/CAF_log.ldf"'  
