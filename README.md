# Webmin and Bind in Docker

I mainly use this for hosting my own personal DNS and having a nice way to manage my DNS servers

Default username and password are root/Docker!

# Instructions

docker run -d -p 10000:10000 -p 53:53 --name=bind hrwebasst/webmin