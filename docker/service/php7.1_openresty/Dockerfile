FROM daocloud.io/library/centos:7.2.1511

RUN yum install -y epel-release &&\
    rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm &&\
    yum install -y --enablerepo=remi readline-devel pcre-devel openssl-devel perl wget gcc make

RUN wget https://openresty.org/download/openresty-1.11.2.3.tar.gz &&\
    tar xzvf openresty-1.11.2.3.tar.gz &&\
    cd openresty-1.11.2.3 &&\
    ./configure --prefix=/opt/openresty\
             --with-luajit\
             --without-http_redis2_module \
             --with-http_iconv_module &&\
    make && make install &&\
    ln -s /opt/openresty/nginx/conf /etc/nginx &&\
    ln -s /opt/openresty/nginx/sbin/nginx /usr/local/bin/ &&\
    sed -i  "34a\    include /etc/nginx/conf.d/*.conf;" /etc/nginx/nginx.conf

RUN yum install -y --enablerepo=remi --enablerepo=remi-php71 php php-opcache php-devel php-mbstring php-xml php-zip php-cli php-fpm php-mcrypt php-mysql php-pdo php-curl php-gd php-mysqld php-bcmath php-redis &&\
    mkdir /run/php-fpm/ &&\
    yum clean all

RUN curl -sSL https://getcomposer.org/installer | php &&\
    mv composer.phar /usr/local/bin/composer

RUN composer global require "fxp/composer-asset-plugin:~1.1.1"

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 80 443 9000

CMD ["docker-entrypoint.sh"]