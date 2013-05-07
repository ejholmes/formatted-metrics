# Formatted Metrics

Get your [Heroku Formatted Metrics]() into Librato.

## Installation

### Dependencies

* A [Librato]() account
* An [Iron.io]() account

1. Upload the worker

   ```bash
   $ gem install iron_worker_ng
   $ iron_worker upload -n Logs --worker-config https://github.com/ejholmes/formatted-metrics/logs.worker
   ```

2. Add a syslog drain to your apps

   ```bash
   heroku drains:add $(iron_worker webhook Logs)\&librato_user=<librato email>\&librato_token=<librato token>
   ```
