#!/bin/bash
read -p "Enter your Domain:" domain
types=("A" "AAAA" "MX" "TXT" "NS")

for type in "${types[@]}"; do
    echo "------ $type ------"
    nslookup -type=$type "$domain"
    echo
done
