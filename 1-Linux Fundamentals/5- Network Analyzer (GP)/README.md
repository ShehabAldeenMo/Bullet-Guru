# Network Analyzer (GP)

## Table of Contents 
- [Description](#description) 
- [tshark command](#tshark-command)
- [Output](#output)

## Description
The primary objective of this network task is to analyze network traffic using Wireshark and automate specific tasks with a Bash script, generating a summary report. Capture network traffic using Wireshark.
Develop a Bash script to analyze the captured data. Extract relevant information like total packets, protocols, and top source/destination IP addresses. Generate a summary report based on the analysis.

## tshark
`tShark` is the command-line version of Wireshark, a network protocol analyzer. It captures and analyzes network packets directly from the command line, making it a powerful tool for network troubleshooting, analysis, and security monitoring.

1. Capture Packets on an Interface `tshark -i eth0`
2. Capture Packets and Save to a File `tshark -i eth0 -w capture.pcap`
3. Read Packets from a File `tshark -r capture.pcap`
4. Capture Only a Specific Number of Packets `tshark -i eth0 -c 10`
5. Display Specific Information from Packets `tshark -T fields -e ip.src -e ip.dst` which <br />
`-T fields`: Specifies that the output should only include certain fields. <br />
`-e ip.src -e ip.dst`: Displays only the source and destination IP addresses. <br />
6. Capture Packets with a Filter `tshark -i eth0 -f "tcp port 80"`
7. Capture in Background and Log Output `tshark -i eth0 -b filesize:10240 -w capture.pcap`

## Output

![Screenshot from 2024-09-09 23-48-20](https://github.com/user-attachments/assets/f6695859-a1be-414b-9369-8d1a0895075e)
