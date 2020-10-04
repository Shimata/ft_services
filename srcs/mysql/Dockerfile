# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wquinoa <wquinoa@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/25 22:40:42 by wquinoa           #+#    #+#              #
#    Updated: 2020/09/23 18:02:58 by wquinoa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client
RUN apk add openrc
VOLUME [ "/var/lib/mysql" ]

COPY ./src/mysql_conf.sql /etc/
COPY ./src/my.cnf /etc/
COPY ./src/wordpress.sql /etc/
COPY ./src/install.sh .

RUN chmod u+x install.sh

EXPOSE 3306
ENTRYPOINT [ "sh", "install.sh" ]