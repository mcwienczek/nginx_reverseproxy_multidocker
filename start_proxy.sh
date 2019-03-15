#!/bin/bash

docker network create --driver bridge nginx_multidocker

docker run --network=nginx_multidocker -itd --name=reverseproxy --volume ${PWD}/reverse_proxy.conf:/etc/nginx/nginx.conf  -p 8080:8080 nginx

docker run --network=nginx_multidocker \
 -itd \
 --name=service1 \
 --volume ${PWD}/service1.conf:/etc/nginx/nginx.conf \
 --volume ${PWD}/index1.html:/usr/share/nginx/html/index.html nginx

 docker run --network=nginx_multidocker \
 -itd \
 --name=service2 \
 --volume ${PWD}/service2.conf:/etc/nginx/nginx.conf \
 --volume ${PWD}/index2.html:/usr/share/nginx/html/index.html nginx