#!/bin/bash
# Generating and incorporating Let's Encrypt SSL certificates
# José Ballester, Aug 2016

# Setup: CentOS 6, Vesta and certbot-auto
# To install certbot-auto, execute the following commands:
#	wget https://dl.eff.org/certbot-auto
#	chmod a+x certbot-auto
#	mv certbot-auto /bin/

# Usage: ./newSSL.sh {VestaUser} {VestaDomain}
# Example: ./newSSL.sh jballester jose.ballester.me

user="$1"
domain="$2"

echo "Generating SSL certificates via Certbot..."
certbot-auto certonly --standalone -d ${domain} -d www.${domain} --pre-hook "service nginx
 stop" --post-hook "service nginx start"

echo "Copying symbolic links to /etc/letsencrypt/live/..."
ln -s /etc/letsencrypt/live/${domain}/cert.pem /etc/letsencrypt/live/${domain}.crt
ln -s /etc/letsencrypt/live/${domain}/privkey.pem /etc/letsencrypt/live/${domain}.key
ln -s /etc/letsencrypt/live/${domain}/chain.pem /etc/letsencrypt/live/${domain}.ca

echo "Activating SSL certificates in Vesta..."
v-add-web-domain-ssl ${user} ${domain} /etc/letsencrypt/live/

echo "Done!"
