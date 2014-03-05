#!/bin/bash
# This script pulls all lines with actual info in them from the irclogger history of a given channel.
# 
# Usage: `./irc-parser.sh <channel-name-without-hash>`
# E.g.,  `./irc-parser.sh mahout`
domain="http://colabti.org"
all_days="/irclogger/irclogger_logs/"
channel=$1
for day in `wget -q -O- $domain$all_days$channel | grep "raw=on" | cut -f2 -d"\""`
do
  wget -q -O- "$domain$day" | grep -v "^\[.*\*\*\*" | grep -v "^$"
done
