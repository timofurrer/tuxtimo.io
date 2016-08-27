FROM nginx:alpine
MAINTAINER Timo Furrer <tuxtimo@gmail.com>

# Copy nginx configuration
COPY nginx/ /etc/nginx/conf.d/
COPY web/ /usr/share/nginx/html
