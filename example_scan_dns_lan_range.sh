# Replace "192.168.0.0/24" with the actual network range you want to scan
sudo zmap \
    -M udp -p 53 \
    --probe-args=file:"./probe_templates/dns_53.pkt" \
    -b /dev/null \
    192.168.0.0/24 \
    -o dns_up_hosts.txt