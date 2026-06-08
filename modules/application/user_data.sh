#!/bin/bash
set -euxo pipefail

dnf install -y httpd

cat > /etc/httpd/conf.d/app.conf <<'CONF'
KeepAlive Off
MaxKeepAliveRequests 1

<Directory "/var/www/html">
    Options +ExecCGI
    AddHandler cgi-script .cgi
    DirectoryIndex index.cgi
    Require all granted
</Directory>
CONF

cat > /var/www/html/index.cgi <<'CGI'
#!/bin/bash
echo "Content-Type: text/html"
echo "Connection: close"
echo ""

COMPUTE_MACHINE_UUID=$(cat /sys/devices/virtual/dmi/id/product_uuid | tr '[:upper:]' '[:lower:]')
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
COMPUTE_INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: ${TOKEN}" http://169.254.169.254/latest/meta-data/instance-id)
RESPONSE_UUID=$(cat /proc/sys/kernel/random/uuid)

cat <<HTML
<html>
  <body>
    <p>This message was generated on instance ${COMPUTE_INSTANCE_ID} with the following UUID ${RESPONSE_UUID}</p>
  </body>
</html>
HTML
CGI

chmod 755 /var/www/html/index.cgi
systemctl enable httpd
systemctl start httpd
