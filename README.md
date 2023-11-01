# Sample Express app to learn docker

**To build docker image run this command**
```
docker build -t openapp .
```

**To apply tag to the image**
```
docker tag openapp {{username}}/opensourcejet:tagname
```

**To push to the repository**
```
docker push {{username}}/opensourcejet:tagname
```
**Create a new Nginx server block configuration for your domain. You can create a new configuration file in the /etc/nginx/sites-available/ directory, such as /etc/nginx/sites-available/myapp.**

```
sudo nano /etc/nginx/sites-available/myapp
```


**To push on nginx server with reverse proxy**
```
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;

    location / {
        proxy_pass http://127.0.0.1:YOUR_NODE_APP_PORT;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

server {
    listen 443 ssl;
    server_name yourdomain.com www.yourdomain.com;

    ssl_certificate /etc/nginx/ssl/yourdomain.crt;  # Path to your SSL certificate
    ssl_certificate_key /etc/nginx/ssl/yourdomain.key;  # Path to your SSL certificate key

    location / {
        proxy_pass http://127.0.0.1:YOUR_NODE_APP_PORT;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

```

***Create symbolic links from the configuration file in sites-available to sites-enabled to enable the site:**
```
sudo ln -s /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled/
```

***est the Nginx configuration to make sure there are no syntax errors:**
```
sudo nginx -t
```


**If the configuration test is successful, restart Nginx to apply the changes**]
```
sudo systemctl restart nginx
```