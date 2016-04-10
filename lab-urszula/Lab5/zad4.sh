#!/bin/bash
s=0
w=0
awk 'BEGIN {RS = "[.?!]"}
NF<4 { w+=1; }
END { print w } ' $1
