#!/bin/bash
set -euxo pipefail

dnf install -y httpd

COMPUTE_MACHINE_UUID=$(cat /sys/devices/virtual/dmi/id/product_uuid | tr '[:upper:]' '[:lower:]')
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
COMPUTE_INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: ${TOKEN}" http://169.254.169.254/latest/meta-data/instance-id)

cat > /var/www/html/index.html <<HTML
<html>
  <body>
    <p>This message was generated on instance ${COMPUTE_INSTANCE_ID} with the following UUID ${COMPUTE_MACHINE_UUID}</p>
  </body>
</html>
HTML

cat > /etc/httpd/conf.d/keepalive.conf <<'CONF'
KeepAlive Off
MaxKeepAliveRequests 1
CONF
systemctl enable --now httpd
