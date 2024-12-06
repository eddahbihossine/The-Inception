# Use Debian as the base image
FROM debian:buster

# Update and install Nginx, Vim, and OpenSSL
RUN apt-get update && \
    apt-get install -y nginx vim openssl && \
    mkdir -p /etc/nginx/ssl && \
    mkdir -p /var/run/nginx

# Create SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=heddahbi.42.fr"

# Copy the Nginx configuration file to the default site location
COPY ./nginx.conf /etc/nginx/sites-available/default

# Set permissions for the web root directory
RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

# Expose ports for HTTP and HTTPS
EXPOSE 80 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
