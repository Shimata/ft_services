# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wquinoa <wquinoa@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/25 22:40:42 by wquinoa           #+#    #+#              #
#    Updated: 2020/08/25 23:33:27 by wquinoa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add mariadb mariadb-client
RUN apk add openrc
VOLUME [ "/sys/fs/cgroup" ]

COPY ./src/wordpress_conf.sql .
COPY ./src/install.sh .

RUN chmod u+x install.sh
RUN echo "[mysqld]\nuser = root\ndatadir = /var/lib/mysql\nport = 3306\nbind-address = 0.0.0.0\nskip-networking = false" > /etc/mysql/my.cnf

ENTRYPOINT ["install.sh"]