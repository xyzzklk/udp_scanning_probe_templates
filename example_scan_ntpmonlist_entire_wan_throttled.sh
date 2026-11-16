# Adjust the -B parameter to change the bandwidth. Otherwise may knock down local gateway!
sudo zmap \
    -M udp -p 123 -B 20M \
    --probe-args=file:"./probe_templates/ntp_123_monlist.pkt" \
    -o ntp_up_wan_hosts.txt