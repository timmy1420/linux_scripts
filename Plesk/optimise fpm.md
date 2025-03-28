Handleiding: Optimaliseren van jouw Webserver
### 1. PHP-FPM Optimalisatie
#### Samenvatting:
PHP-FPM is overbelast door een groot aantal verzoeken. We hebben de
configuratie aangepast om meer processen aan te kunnen en inefficiënte
processen sneller te beëindigen.
#### Stappenplan:
1. **Open de PHP-FPM configuratie:**
Het configuratiebestand bevindt zich waarschijnlijk op:
sudo nano /opt/plesk/php/7.4/etc/php-fpm.d/[pool-name].conf
2. **Pas de configuratie aan:**
Voeg of wijzig de volgende instellingen:
pm = dynamic
pm.max_children = 1000
pm.start_servers = 150
pm.min_spare_servers = 100
pm.max_spare_servers = 300
pm.process_idle_timeout = 5s
pm.max_requests = 300
3. **Herstart PHP-FPM:**
sudo systemctl restart php7.4-fpm
4. **Controleer de logs:**
sudo tail -f /var/log/php7.4-fpm.log
### 2. Apache MPM Configuratie
#### Samenvatting:
Apache is verantwoordelijk voor het verwerken van HTTP-verzoeken en
communiceert met PHP-FPM. Het moet correct worden afgestemd op de
PHP-FPM instellingen.
#### Stappenplan:
1. **Open de Apache MPM configuratie:**
sudo nano /etc/apache2/mods-enabled/mpm_event.conf
2. **Pas de configuratie aan:**
Voeg of wijzig de volgende instellingen:
<IfModule mpm_event_module>
StartServers 4
MinSpareThreads 200
MaxSpareThreads 600
ThreadsPerChild 75
MaxRequestWorkers 1000
ServerLimit 15
MaxConnectionsPerChild 2000
ThreadLimit 100
</IfModule>
3. **Herstart Apache:**
sudo systemctl restart apache2
4. **Controleer de logs:**
sudo tail -f /var/log/apache2/error.log
### 3. Nginx Configuratie
#### Samenvatting:
Nginx gebruikt de efficiënte epoll-mechanisme om grote aantallen verbindingen
te verwerken.
#### Stappenplan:
1. **Open de Nginx configuratie:**
sudo nano /etc/nginx/nginx.conf
2. **Pas de configuratie aan:**
worker_processes auto;
events {
use epoll;
worker_connections 10240;
}
3. **Optimaliseer Keep-Alive instellingen:**
keepalive_timeout 65;
keepalive_requests 100;
4. **Herstart Nginx:**
sudo systemctl restart nginx
### 4. Monitoring Tools
Gebruik de volgende tools:
- **CPU/RAM Monitoring:** htop
- **Bekijk actieve PHP-processen:** ps aux | grep php-fpm
- **Controleer verkeersverwerking door Nginx:** curl -s
http://localhost/nginx_status
- **Bekijk PHP slowlog:** sudo tail -f /var/log/php7.4-fpm-slow.log
### 5. Caching Implementeren
#### OPcache (PHP):
1. **Controleer of OPcache is ingeschakeld:**
Controleer via Plesk of voeg handmatig toe:
opcache.enable=1
opcache.memory_consumption=512
opcache.max_accelerated_files=20000
opcache.validate_timestamps=0
#### Redis/Memcached:
Installeer Redis:
sudo apt install redis
### 6. Test Je Server
Gebruik een load testing tool zoals ApacheBench:
ab -n 10000 -c 100 http://yourwebsite.com/