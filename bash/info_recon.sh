#!/bin/bash
read -p "Enter the target domain: " DOMAIN
OUTPUT_FILE="report.txt"

if [ -z "$DOMAIN" ]; then
    echo "[-] No domain entered. Exiting..."
    exit 1
fi

echo "[+] Gathering subdomains for $DOMAIN..."


(subfinder -d $DOMAIN; assetfinder --subs-only $DOMAIN) | sort -u > subdomains.txt
echo "[+] Subdomains saved to subdomains.txt"

echo "[+] Probing live domains..."
cat subdomains.txt | httprobe | sort -u > $OUTPUT_FILE

echo "[+] Live domains saved in $OUTPUT_FILE"
echo "[+] Recon completed!"
