#! /usr/bin/bash

# Bash Script to Analyze Network Traffic

# Input: Path to the Wireshark pcap file
pcap_file="NetworkPackets.pcap"
touch "$pcap_file"

# Function to extract information from the pcap file
analyze_traffic() {
    local length_file
    local Http_PACKETS
    local Https_TLS_PACKETS

    # Use tshark or similar commands for packet analysis, filter by protocols (HTTP, HTTPS/TLS)
    tshark -i wlp0s20f3 -c 2000 -f "tcp port 80 or tcp port 443" -w  $pcap_file

    # Hint: Consider commands to count total packets
    length_file=$(tshark -r $pcap_file | wc -l)

    # Calculate number of HTTP packets
    Http_PACKETS=$(tshark -r $pcap_file -Y http | wc -l)
    
    # Calculate number of HTTPS/TLS packets
    Https_TLS_PACKETS=$(tshark -r $pcap_file -Y tls | wc -l)

    # extract IP addresses, and generate summary statistics.

    # Output analysis summary
    echo "----- Network Traffic Analysis Report -----"
    # Hints: Total packets, protocols, top source, and destination IP addresses.
    echo "1. Total Packets: $length_file"
    echo "2. Protocols:"
    echo "   - HTTP: $Http_PACKETS packets"
    echo "   - HTTPS/TLS: $Https_TLS_PACKETS packets"
    echo ""
    echo "3. Top 5 Source IP Addresses:"
    tshark -r $pcap_file  -T fields -e ip.src | sort | uniq -c | sort -nr | head -n 5
    echo ""
    echo "4. Top 5 Destination IP Addresses:"
    tshark -r $pcap_file  -T fields -e ip.dst | sort | uniq -c | sort -nr | head -n 5
    echo ""
    echo "------------- End of Report --------------"
}

# Run the analysis function
analyze_traffic
