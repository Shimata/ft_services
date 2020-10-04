# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wquinoa <wquinoa@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/06 15:25:06 by wquinoa           #+#    #+#              #
#    Updated: 2020/09/25 14:18:07 by wquinoa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add openssl
RUN apk add openssh
RUN apk add supervisor
RUN apk add openrc

COPY ./src/nginx.conf /etc/nginx/conf.d/deafult.conf
COPY ./src/supervisor.conf /etc/supervisord.conf
RUN chmod +rw /etc/supervisord.conf
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=AB/ST=CD/L=EF/O=21/CN=wquinoa' \
	-keyout /etc/ssl/certs/nginx.key -out /etc/ssl/certs/nginx.crt
RUN printf "wquinoa\nwquinoa\n" | adduser wquinoa

RUN mkdir -p /run/nginx 
COPY ./src/nginx-start.sh /tmp/nginx-start.sh
RUN chmod u+x /tmp/nginx-start.sh

EXPOSE 80 443 22
ENTRYPOINT [ "sh", "/tmp/nginx-start.sh" ]
