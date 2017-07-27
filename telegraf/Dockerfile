FROM telegraf:latest
MAINTAINER Mateusz Trojak <guydou@gmail.com>
LABEL version="1.0"
LABEL description="Telegraf Image with added system variables"

ADD telegraf.template.conf /telegraf.template.conf

ADD run.sh /run.sh
RUN chmod +x /*.sh

CMD ["/run.sh"]

