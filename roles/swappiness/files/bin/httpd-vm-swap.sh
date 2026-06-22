#!/bin/bash
for pid in $(pgrep httpd); do
    echo -n "$pid "
    grep VmSwap /proc/$pid/status
done
