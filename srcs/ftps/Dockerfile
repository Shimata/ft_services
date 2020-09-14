# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wquinoa <wquinoa@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/10 15:49:50 by kwillum           #+#    #+#              #
#    Updated: 2020/09/14 13:19:59 by wquinoa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

ARG 	IP
RUN		apk update
RUN		apk add openrc openssl vsftpd
RUN 	apk add --no-cache --upgrade bash && rm -rf /var/cache/apk/*
RUN 	mkdir -p /var/ftp

COPY	./my_vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY	start.sh /tmp/
COPY	./create_user.sh /tmp/
RUN		chmod +x /tmp/start.sh
RUN		chmod +x /tmp/create_user.sh
RUN		mkdir -p  /ftp_anon ;
RUN		mkdir -p  /ftp_peer ;
RUN		echo "super file!" > /ftp_peer/text.txt
RUN		echo -e "SUPER_POWERfull_PASS228\nSUPER_POWERfull_PASS228" | adduser ftp_peer -s /bin/false -h /ftp_peer ;
RUN		echo "/bin/false" >> /etc/shells
RUN		chown ftp_peer:ftp_peer /ftp_peer ;
RUN		echo "Done!"
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=AB/ST=CD/L=EF/O=21/CN=wquinoa' \
	-keyout /etc/ssl/certs/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

EXPOSE	20 21 22 21000-22000

ENTRYPOINT ["/tmp/start.sh"]