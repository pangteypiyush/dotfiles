#!/bin/bash

[ ! -z "$1" ] && command -v wmctrl && wmctrl -a "$1"
