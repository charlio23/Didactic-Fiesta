#!/bin/bash
# Renewing Let's Encrypt SSL certificates
# José Ballester, Aug 2016

# Setup: CentOS 6, Vesta and certbot-auto

# Optional: add --pre-hook "service nginx stop" --post-hook "service nginx start" if the following line does not work at first
certbot-auto renew --standalone 
v-change-web-domain-sslcert admin masternod.com /etc/letsencrypt/live/
