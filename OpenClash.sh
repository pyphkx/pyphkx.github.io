#!/usr/bin/env bash
cd /
if [ ! -d "/OpenClashConfig/" ];then
  echo "OpenClashConfig 文件夹不存在！"
  mkdir /OpenClashConfig
  echo "OpenClashConfig 文件夹创建成功！"
fi
cd /OpenClashConfig
if [ -f "Config.yml" ];then
  echo "配置文件存在,备份配置文件！"
  mv Config.yml Config_backup.yml
fi
get_url="https://raw.githubusercontent.com/pojiezhiyuanjun/freev2/master/"
get_date=`date -d "yesterday" +%m%d`
get_url=$get_url$get_date"clash.yml"
wget -c $get_url --no-check-certificate -O config.yml
if [ -f "Config.yml" ];then
  rm -f Config_backup.yml
  echo "自动订阅成功！"
else
  mv Config_backup.yml Config.yml
  echo "自动订阅失败，检查订阅连接！"
fi