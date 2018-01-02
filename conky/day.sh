#!/bin/bash

SECONDS=$(( $(date +%s) - 800150400 ))
echo ${SECONDS:0:3},${SECONDS:3:3},${SECONDS:6:3} seconds
