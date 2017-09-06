FROM debian:jessie

RUN apt-get update && \
  apt-get install -y apt-transport-https && \
  apt-get install -y curl && \
  curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add - && \
  echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list && \
  apt-get update && \
  apt-get install -y varnish && \
  apt-get install -y telnet


COPY start-varnish.sh /etc/start-varnish.sh
RUN chmod +x /etc/start-varnish.sh
RUN ls -lasht /etc/start-varnish.sh
COPY aquila.com.au.vcl /etc/varnish/default.templ
ENV CACHE_SIZE=128m
ENV VCL_CONFIG      /etc/varnish/default.vcl
ENV CACHE_SIZE      256M
ENV VARNISHD_PARAMS  -p cli_buffer=16384 -p feature=+esi_ignore_other_elements -p vcc_allow_inline_c=on -a 0.0.0.0:6080 -T 0.0.0.0:6082 -S /etc/varnish/secret
# ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600 -T 0.0.0.0:6082

EXPOSE 80 6082


# RUN chmod 777 /start-varnish.sh

CMD /etc/start-varnish.sh
