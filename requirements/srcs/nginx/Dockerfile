FROM    debian


RUN     apt-get update && apt-get upgrade -y && apt-get install -y \
        nginx openssl && \
        apt-get clean && rm -rf /var/lib/apt/lists/*

RUN     mkdir -p /etc/nginx/ssl

RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
                -out /etc/nginx/ssl/nginx.crt \
                -keyout /etc/nginx/ssl/nginx.key \
                -subj "/C=IT/ST=khouribga/L=khouribga/O=1337/OU=heddahbi/CN=Morocco/"


RUN     mkdir -p /run/nginx

COPY    ./conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
