#!/bin/bash
# auther: ge2x3k2@gmail.com

echo "info: nginx non-daemon startup"
nginx -c /etc/nginx/nginx.conf -g 'daemon off;'