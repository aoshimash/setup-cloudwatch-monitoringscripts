#!/bin/bash

read -p "AWSAccessKeyId: " AWS_ACCESS_KEY_ID
read -sp "AWSSecretKey: " AWS_SECRET_KEY

SCRIPT_DIR="/monitoring-scripts"
SCRIPT_ZIP="CloudWatchMonitoringScripts-1.2.2.zip"

yum install -y perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https perl-Digest-SHA.x86_64 unzip && \
  mkdir -p $SCRIPT_DIR && \
  cd $SCRIPT_DIR && \
  curl https://aws-cloudwatch.s3.amazonaws.com/downloads/$SCRIPT_ZIP -O && \
  unzip $SCRIPT_ZIP && \
  cd $SCRIPT_DIR/aws-scripts-mon && \
  echo -e "AWSAccessKeyId=$AWS_ACCESS_KEY_ID\nAWSSecretKey=$AWS_SECRET_KEY" > $SCRIPT_DIR/aws-scripts-mon/awscreds.conf && \
  (crontab -l; echo "*/5 * * * * $SCRIPT_DIR/aws-scripts-mon/mon-put-instance-data.pl --mem-used-incl-cache-buff --mem-util --disk-space-util --disk-path=/ --from-cron
") | crontab -
