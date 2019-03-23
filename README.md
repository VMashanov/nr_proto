# nr_proto
Prototype of separating requests between nginx and rack app

## Steps

1. Create config (`nr_proto.ru`, for example) for our site/app in `/etc/nginx/sites-available/`
2. Copy example of config that you see below:

```
server {
        listen 192.168.33.35:80;

        root /home/vagrant/nr_proto/public;
        index index.html;

        server_name nr_proto.ru;

        location ~ ^(.+)$ {
                root /home/vagrant/nr_proto/public/;
                index index.html;
        }

        location /auth {
                index auth.html;
        }

        location /api/ {
                proxy_pass http://192.168.33.35:8080;
        }
}
```
3. Restar `nginx` with command `sudo systemctl restart nginx`
4. Open some browser and forward by application url, in our case it is `192.168.33.35`
