#FROM nginx:1.7.9 
FROM ubuntu:14.04

#Install dependecies
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
software-properties-common 

# Install Nginx.
RUN add-apt-repository -y ppa:nginx/stable && \
apt-get update -q && \
apt-get install --no-install-recommends -qy nginx && \
chown -R www-data:www-data /var/lib/nginx && \
rm -f /etc/nginx/sites-available/default \
&& rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

CMD ["nginx", "-g", "daemon off;"]

