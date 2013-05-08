# Formatted Metrics

Get your [Heroku Formatted Metrics](https://devcenter.heroku.com/articles/log-runtime-metrics) out of logplex and into Librato. Easily.

### Dependencies

* A [Librato]() account
* An [Iron.io]() account

### Installation

1. If you don't already have an Iron.io account setup, you can add it easily

   ```bash
   heroku addons:add iron_worker:developer
   export $(heroku config | grep IRON)
   gem install iron_worker_ng
   ```

2. Upload the worker

   ```bash
   iron_worker upload -n Logs --config '{"librato_user": "<your email>", "librato_token": "<your token>" }' \
     --worker-config https://github.com/ejholmes/formatted-metrics/logs.worker
   ```

3. Add a syslog drain to your apps

   ```bash
   heroku drains:add \
     "$(iron_worker webhook Logs | tail -n 1 | sed 's/^ *//g')
   ```

4. Make sure you have `log-runtime-metrics` enabled

   ```bash
   heroku labs:enable log-runtime-metrics
   ```
