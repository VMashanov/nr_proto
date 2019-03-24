# nr_proto

Prototype of separating requests between nginx and rack app.
Example of case when frontend returns by nginx server but rack app is handling another requests.

## Steps

1. Create config (`nr_proto.ru`, for example) for our site/app in `/etc/nginx/sites-available/`
2. Copy example of config that you see below:

```
server {
  listen 192.168.33.35:80;

  root /home/vagrant/nr_proto/public;

  server_name nr_proto.ru;

  location =/auth {
    try_files $uri /auth.html;
  }

  location /api/ {
    proxy_pass http://192.168.33.35:8080;
  }

  location ~ ^((?!\/api).+)$ {
    try_files $uri /index.html;
  }
}
```
3. Execute `sudo ln -s /etc/nginx/sites-available/nr_proto.ru /etc/nginx/sites-enabled/`
4. Restart `nginx` with command `sudo systemctl restart nginx`
5. Execute `make run`
6. Open some browser and forward by application url, in our case it is `192.168.33.35`
