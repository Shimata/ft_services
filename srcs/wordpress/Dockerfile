# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wquinoa <wquinoa@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/02 06:02:58 by wquinoa           #+#    #+#              #
#    Updated: 2020/09/22 23:49:28 by wquinoa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add wget
RUN apk add openssl
RUN apk add php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add openssh

RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN mv wordpress /www/
RUN rm latest.zip

COPY wp-config.php /www/
COPY install.sh start.sh
RUN chmod u+x start.sh

EXPOSE 5050
ENTRYPOINT [ "sh", "start.sh" ]