#!/bin/bash
#
# Decode sequence file into plain text
#
# input is path to a sequence file on the local file system
# You will need to find out which classes are encoded in the sequence file
# and add jars containing them to the list in the -libjars flag
#
input=$1
MATH=/path/to/mahout-math.jar
CORE=/path/to/mahout-core.jar
GUAVA=/path/to/guava.jar
hadoop fs -rmr unseq
hadoop fs -rmr $input
hadoop fs -put $input $input
hadoop jar /path/to/hadoop-streaming.jar \
 -libjars $MATH,$CORE,$GUAVA \
 -input $input/part* \
 -output unseq \
 -inputformat SequenceFileAsTextInputFormat
hadoop fs -cat unseq/part*
