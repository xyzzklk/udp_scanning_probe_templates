sudo zmap \
    -M udp -p 53 \
    --probe-args=file:"./probe_templates/dns_53.pkt" \
    -o dns_up_wan_hosts.txt