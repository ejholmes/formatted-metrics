# Formatted Metrics

Get your [Heroku Formatted Metrics](https://devcenter.heroku.com/articles/log-runtime-metrics) out of logplex and into Librato. Easily.

### Dependencies

* A [Librato]() account
* An [Iron.io]() account

### Installation

1. Upload the worker

   ```bash
   gem install iron_worker_ng
   iron_worker upload -n Logs \
     --worker-config https://github.com/ejholmes/formatted-metrics/logs.worker
   ```

2. Add a syslog drain to your apps

   ```bash
   heroku drains:add \
    "$(iron_worker webhook Logs | tail -n 1 | sed 's/^ *//g')&librato_user=<librato email>&librato_token=<librato token>"
   ```

3. Make sure you have `log-runtime-metrics` enabled

   ```bash
   heroku labs:enable log-runtime-metrics
   ```
