## vm-agent ENV Injection Demo

This demo shows the vm-agent can inject environment variables into the config file.

> The file pointed by -promscrape.config may contain %{ENV_VAR} placeholders which are substituted by the corresponding ENV_VAR environment variable values.

As we can see in config file `prometheus.yml`, the `metrics_path` is not hard-coded in config, but using the value of environment variable `URI`.

The value of `URI` is specified in `docker-compose.yml` line 10:
```
- URI=aaa
```

Once this docker-compose service is bootstraped, `docker-compose up`, we can notice such log lines in console.

```
vm-agent    | 2022-06-13T06:05:08.656Z	error	VictoriaMetrics/lib/promscrape/scrapework.go:355	error when scraping "http://metric-source:80/aaa" from job "test-scrape" with labels {instance="metric-source:80",job="test-scrape"}: error when scraping "http://metric-source:80/aaa": dial tcp4: lookup metric-source on 127.0.0.11:53: no such host; try -enableTCP6 command-line flag if you scrape ipv6 addresses
```

From the log, we can be sure that the environment variables have been injected into the config successfully.
