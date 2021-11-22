FROM ubuntu

ARG VERSION
RUN apt update && apt upgrade -y
RUN apt install software-properties-common -y
RUN apt-add-repository -y ppa:rael-gc/rvm
RUN apt update
RUN apt install rvm -y
RUN groupadd rvm
RUN usermod -a -G rvm root
COPY ./docker_entrypoint.sh /docker_entrypoint.sh

CMD [ "/docker_entrypoint.sh" ]
