FROM frolvlad/alpine-glibc

ENV METRICBEAT_VERSION=5.1.1

RUN apk add --no-cache \
      ca-certificates \
      curl

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-${METRICBEAT_VERSION}-linux-x86_64.tar.gz && \
    tar -xvvf metricbeat-${METRICBEAT_VERSION}-linux-x86_64.tar.gz && \
    mv metricbeat-${METRICBEAT_VERSION}-linux-x86_64/ /metricbeat && \
    mv /metricbeat/metricbeat.yml /metricbeat/metricbeat.example.yml && \
    mv /metricbeat/metricbeat /bin/metricbeat && \
    chmod +x /bin/metricbeat && \
    mkdir -p /metricbeat/config /metricbeat/data

WORKDIR /metricbeat

ADD start.sh /metricbeat/start.sh
ADD metricbeat.yml /metricbeat/metricbeat.yml

CMD /metricbeat/start.sh