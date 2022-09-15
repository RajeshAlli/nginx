#!/bin/bash

source common.sh
MSPACE=$(cat $0 | grep Print | awk -F '"' '{print $2}' | awk '{ print length }' | sort | tail -1)

Print "Download Html Pages"
curl -s -L -o /tmp/master.zip "https://github.com/microsoft/project-html-website/archive/refs/heads/master.zip" &>>$LOG
Stat $?

Print "Remove Old Html Pages"
rm -rf /usr/share/nginx/html/* &>>$LOG
Stat $?

Print "Extract Frontend Archive"
unzip -o -d /tmp /tmp/master.zip &>>$LOG
Stat $?

Print "Copy files to Nginx path"
mv project-html-website-master/* /usr/share/nginx/html/. &>>$LOG
Stat $??