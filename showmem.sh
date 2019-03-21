#!/bin/bash

strMemTotal=$(cat /proc/meminfo | grep 'MemTotal:')
strMemFree=$(cat /proc/meminfo | grep 'MemFree:')
strMemBuffers=$(cat /proc/meminfo | grep 'Buffers:')
strMemCache=$(cat /proc/meminfo | grep 'Cached:')
strMemAvailable=$(cat /proc/meminfo | grep 'MemAvailable:')

outputMemTotal="${strMemTotal//MemTotal:}"
outputMemFree="${strMemFree//MemFree:}"
outputMemBuffers="${strMemBuffers//Buffers:}"
outputMemCache="${strMemCache//Cached:}"
outputMemAvailable="${strMemAvailable//MemAvailable:}"

MemTotal=$(( ${outputMemTotal::-3} / 1024))
MemUsed=$(( ( ${outputMemTotal::-3} - ${outputMemFree::-3} - ${outputMemBuffers::-3} - ${outputMemCache::-24} ) / 1024))
MemAvailable=$(( ${outputMemAvailable::-3} / 1024))

echo $MemTotal Mb / $MemUsed Mb / $MemAvailable Mb
