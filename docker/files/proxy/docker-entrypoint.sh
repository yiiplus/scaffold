#!/bin/bash
# @auther <gengxiankun@126.com>

echo "info: nginx non-daemon startup"
nginx -c /etc/nginx/nginx.conf -g 'daemon off;'