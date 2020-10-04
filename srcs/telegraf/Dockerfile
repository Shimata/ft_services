# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wquinoa <wquinoa@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/12 22:49:52 by kwillum           #+#    #+#              #
#    Updated: 2020/09/19 18:06:52 by wquinoa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

ENTRYPOINT ["telegraf"]
