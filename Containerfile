FROM redhat/ubi9-minimal:latest as openfire

USER 0

RUN curl -sLOJ https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire-5.0.1-1.noarch.rpm && \
    microdnf install -y java-17 chkconfig && \
    rpm -ivh ./openfire-5.0.1-1.noarch.rpm && \
    microdnf clean all && \
    rm openfire-5.0.1-1.noarch.rpm

RUN useradd -u 1000 openfire && \
    usermod -a -G root openfire && \
    chown -R 1000:0 /opt/openfire

EXPOSE 9090
EXPOSE 9091
EXPOSE 5222
EXPOSE 5223
EXPOSE 7443
EXPOSE 7070
EXPOSE 5269
EXPOSE 5270

USER 1000

ENTRYPOINT ["/usr/bin/bash", "-c"]
CMD ["/opt/openfire/bin/openfire.sh"]
