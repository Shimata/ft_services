# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wquinoa <wquinoa@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/12 16:48:54 by kwillum           #+#    #+#              #
#    Updated: 2020/09/19 18:10:34 by wquinoa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update
RUN	apk add influxdb

EXPOSE 8086
ENTRYPOINT ["influxd"]