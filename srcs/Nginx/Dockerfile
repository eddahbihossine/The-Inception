FROM    debian


RUN     apt-get update && apt-get upgrade -y && apt-get install -y \
        nginx openssl && \
        apt-get clean && rm -rf /var/lib/apt/lists/*

RUN     mkdir -p /etc/nginx/ssl

RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
                -out /etc/nginx/ssl/nginx.crt \
                -keyout /etc/nginx/ssl/nginx.key \
                -subj "/C=IT/ST=Paris/L=Paris/O=42 School/OU=heddahbi/CN=heddahbi/"


RUN     mkdir -p /run/nginx

COPY    nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
