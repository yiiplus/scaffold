FROM daocloud.io/library/centos:7.2.1511

RUN yum install -y epel-release &&\
    rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm &&\
    yum install -y --enablerepo=remi readline-devel pcre-devel openssl-devel perl wget gcc make

RUN yum install -y epel-release &&\
 rpm -ivh https://kojipkgs.fedoraproject.org/packages/http-parser/2.7.1/3.el7/x86_64/http-parser-2.7.1-3.el7.x86_64.rpm &&\
 yum -y install nodejs openssl &&\
 npm set registry https://registry.npm.taobao.org &&\
 npm set disturl https://npm.taobao.org/dist &&\
 npm cache clean &&\
 yum clean all

RUN npm -g install fis3 fis3-smarty fis-postprocessor-require-async fis-parser-jdists&&\
 npm -g install fis-postprocessor-require-async &&\
 npm -g install fis-parser-jdists

CMD ["/usr/sbin/init"]
