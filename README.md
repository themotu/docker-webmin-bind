# Webmin and Bind in Docker

I mainly use this for hosting my own personal DNS and having a nice way to manage my DNS servers

Default username and password are root/Docker!

# Instructions

```bash
docker build -t webmin .
docker run -d -p 10000:10000 -p 53:53 -p 53:53/udp --name=bind webmin
```

Default username is root password is Docker! by default and easily changeable from inside the admin interface. Your server will be available on port 10000 using https.github

