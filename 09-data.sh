#!/bin/bash

NUMBER1=100
NUMBER2=200
NAME=DevOps

SUM=$(($NUMBER1+$NUMBER2))



echo "SUM is: ${SUM}"


Leaders=("Modi" "Putin" "Trudo" "Trump")

echo "All leaders: ${Leaders[@]}"
echo "First Leader: ${Leaders[0]}"
echo "First Leader: ${Leaders[10]}"