#!/bin/bash

echo "Enter the domain name:"
read domain

# Output file
output_file="output.txt"

# Run Subfinder
echo "[+] Running Subfinder..."
subfinder -d "$domain" > subfinder_results.txt

# Run Sublist3r
echo "[+] Running Sublist3r..."
sublist3r -d "$domain" -o sublister_results.txt

# Run Assetfinder
echo "[+] Running Assetfinder..."
assetfinder --subs-only "$domain" > assetfinder_results.txt

# Merge & Remove Duplicates
cat subfinder_results.txt sublister_results.txt assetfinder_results.txt | sort -u > "$output_file"

# Cleanup
rm subfinder_results.txt sublister_results.txt assetfinder_results.txt

echo "[✔] Subdomain enumeration completed. Results saved in $output_file"
