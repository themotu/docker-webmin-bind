# Webmin and Bind in Docker

I mainly use this for hosting my own personal DNS and having a nice way to manage my DNS servers

Default username and password are root/Docker!

# Instructions

```bash
docker run -d -p 10000:10000 -p 53:53 -p 53:53/udp --name=bind hrwebasst/webmin
```

Default username is root password is Docker! by default and easily changeable from inside the admin interface. Once letsencrypt.org is in beta I'll add instructions for ssl from them.

