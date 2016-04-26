# timeu/pygwas_celery

[`timeu/pygwas_celery`](https://index.docker.io/u/timeu/pygwas_celery) is a [docker](https://docker.io) image that is based on [`timeu/pygwas`](https://registry.hub.docker.com/u/timeu/gwas_base/) docker image and has [celery](http://www.celeryproject.org/) setup in order to run [PyGWAS](https://github.com/timeu/PyGWAS) as a distributed task.


## Usage


- RUN with default configuration. Listens to all Queues

        docker run -e "BROKER_URL=amqp://username:pw@BROKER_HOST:5672/VHOST" -e "REST_HOST=http://REST_HOST" -e "REST_USERNAME=USERNAME" -e "REST_PASSWORD=PW" timeu/pygwas_celery

- Pass specific options to celery executable (i.e Queue, concurrency, etc)

        docker run -e "BROKER_URL=amqp://username:pw@BROKER_HOST:5672/VHOST" -e "REST_HOST=http://REST_HOST" -e "REST_USERNAME=USERNAME" -e "REST_PASSWORD=PW" timeu/pygwas_celery -Q gwas.portal.fast


## Notes

Following volumes are defined: 

 - /conf .. contains the celeryconfig.py file 
 - /GWASDATA  .. folder where celery will the input & output files
 - /GENOTYPE .. folder that contains the genotype data



