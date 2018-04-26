#!/bin/bash
echo '============ fis build start ============'

DIR="$( cd "$( dirname "$0"  )" && pwd  )"

#初始化
rm -rf $DIR/../plugin $DIR/../smarty.conf $DIR/../domain.conf $DIR/../config/fis/* $DIR/../views/* $DIR/../web/static/*
echo 'rm fis3 build files ok.'

#编译
fis3 release prod -r $DIR/layouts -d $DIR/../
echo 'release layouts ok.'
fis3 release prod -r $DIR/common -d $DIR/../
echo 'release common ok.'
fis3 release prod -r $DIR/home -d $DIR/../
echo 'release home ok.'

#删除测试数据
# rm -rf $DIR/../test $DIR/../web/static/common/test $DIR/../web/static/home/test
# echo 'rm fis3 test files ok.'

echo '============ fis build end ============'