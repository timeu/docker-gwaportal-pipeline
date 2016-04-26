# Dockerfile for pygwas-celery worker
# Version 0.1

FROM timeu/gwas_base
MAINTAINER Uemit Seren <uemit.seren@gmail.com>

WORKDIR /conf

# necessary otherwise chown won't work
RUN mkdir /log && mkdir /DATA mkdir /GENOTYPE

# add celery user and group 
RUN groupadd -r celery && useradd -r -g celery celery 
RUN chown celery:celery -R /log /DATA

RUN /env/bin/pip install 'gwaportalpipeline>=0.2.7'

ADD celeryconfig.py /conf/celeryconfig.py

# add colume after chown otherwise it doesnt work
VOLUME  ["/log","/conf","/DATA","/GENOTYPE"]

USER celery

CMD ["-l","INFO","--logfile","/log/celery.log"]

ENTRYPOINT ["/env/bin/celery","-A", "gwaportalpipeline","worker"]
