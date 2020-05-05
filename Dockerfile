ARG version=latest
FROM ubuntu:$version
#MAINTAINER JCD "jcd717@outlook.com"

# metadonnées dans l'image acessible via inspect
LABEL maintainer="JCD <jcd717@outlook.com>" \
      description="test" \
      auteur="bruno dubois"

RUN useradd user1
USER user1

COPY --chown=user1:user1 heartbeat.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh ; 
    #echo coucou >test.txt

ARG hbs=3
ENV HEARTBEATSTEP $hbs


# information de port réseau utile
EXPOSE 1234/udp 4321/tcp

#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["/entrypoint.sh", "coucou"]

# autre version sans entrypoint
CMD ["/entrypoint.sh", "coucou"]

