# Uptime Kuma
## It is a self-hosted monitoring tool like "Uptime Robot".
docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1
http://localhost:3001/dashboard/


# Heimdall
docker run -d \                                                                                                                                              ✔ 
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Costa_Rica \      
  -p 8087:80 \
  -p 443:443 \
  -v /opt/heimdall/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/heimdall:latest
  
  # Speedtest
  sudo docker create \                                                                                                                                       1 ✘ 
      --name=speedtest \
      -p 8765:80 \
      -v /opt/ookla/config:/config \
      -e OOKLA_EULA_GDPR=true \
      --restart unless-stopped \
      henrywhitaker3/speedtest-tracker
      
      
      
      
      
      
      Links to these containers:
- Uptime Kuma - https://github.com/louislam/uptime-kuma
- Heimdall - https://hub.docker.com/r/linuxserver/...
- Speedtest Tracker - https://hub.docker.com/r/henrywhitake...
- Guacamole - https://hub.docker.com/r/oznu/guacamole/
- Watchtower - https://containrrr.dev/watchtower/
