FROM victoriametrics/vmagent:v1.77.2

WORKDIR /vm-agent

#ENTRYPOINT ["sleep", "3h"]
ENTRYPOINT ["/vmagent-prod", "-promscrape.config=/vm-agent/prometheus.yml", "-remoteWrite.url=https://a-fake-one", "-promscrape.config.strictParse=false"]
