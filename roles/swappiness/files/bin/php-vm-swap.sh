#!/bin/bash
for pid in $(pgrep php); do
    echo -n "$pid "
    grep VmSwap /proc/$pid/status
done
