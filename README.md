# Introduction
This is a collection of a wide range of UDP probe payloads and templates for UDP service scanning with tools like ZMap.

These probes are useful in network scanning because UDP does not establish connections. Simply sending an empty, malformed or random-payload packet does not guarantee a response, and the request might be discarded. Sending a packet with a protocol-compliant layer-4 payload forces the target application to actually reply.

> [!NOTE]
> It is particularly useful to use these probes to discover UDP-based services vulnerable to becoming reflectors of Distributed Reflection Denial of Service attacks.
> 
> In such security audit or research scenario, it is recommended to
> 1. Perform an initial scan using a probe with a scanning tool, like [ZMap](https://github.com/zmap/zmap), to detect open UDP services in your target environment.
> 2. Then use a filtering tool like [AmpliFilter](https://github.com/xyzzklk/amplifilter) to filter out ones that are _actually_ vulnerable to becoming reflectors.

> [!WARNING]
>
> **⚠️ Disclaimer**
>
> The scripts, packet payloads (`.pkt`) and configurations in this repository are provided strictly for **educational purposes, authorised security research and defensive network auditing**. The author(s) and contributor(s) of this repository assume **no liability whatsoever** for any misuse, damage or legal consequences resulting from the use, modification or distribution of this material. By downloading, cloning, or using any part of this repository, you explicitly agree to the following terms:
> 1. Mass network scanning can generate significant network traffic, impact third-party services and trigger automated security alarms. You must ensure that you have explicit, documented authorisation from the network owner before executing any probes or scripts contained in this repository against any target outside your own test lab.
> 2. Unauthorised network scanning may violate local, national and international laws. The author(s) of this repository assume no liability and are not responsible for any misuse, damage or legal consequences resulting from the use or misuse of the payloads or scripts provided herein.
> 3. The software, scripts and packet payloads in this repository are provided **"AS IS"**, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and non-infringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

# Usage Demo: Using Probe Payloads with ZMap
The following instructions give a quick demonstration on using some of these UDP probes with a network scanning tool, here using ZMap as an example.

This demonstration is performed on an official VMWare pre-built virtual machine of the Kali Linux 2026.3 version.

## Step 1: Install ZMap
Zmap does not come pre-installed by default in this VM, so we will have to install it manually.
```shell
sudo apt update && sudo apt upgrade
sudo apt install zmap -y
```
```shell
...
┌──(kali㉿kali)-[~/Documents]
└─$ sudo apt install zmap -y
[sudo] password for kali:
The following packages were automatically installed and are no longer required:
  chromium-sandbox            libappstream5  libgcc-15-dev  libobjc-15-dev    libunibreak7
  gcc-15-base                 libavfilter11  libgumbo3      libopenjph0.28    libxmlb2
  gnome-accessibility-themes  libflashrom1   libhdf4-0      libsimdutf33      python3-unicodedata2
  gnome-themes-extra          libfmt10       libmupdf27.0   libstdc++-15-dev
  libaccountsservice0         libfyaml0      libntfs-3g90   libstemmer0d
Use 'sudo apt autoremove' to remove them.

Installing:
  zmap

Summary:
  Upgrading: 0, Installing: 1, Removing: 0, Not Upgrading: 45
  Download size: 137 kB
  Space needed: 550 kB / 62.0 GB available

Get:1 http://mirror.lagoon.nc/kali kali-rolling/main amd64 zmap amd64 4.3.4-1 [137 kB]
Fetched 137 kB in 1s (120 kB/s)
Selecting previously unselected package zmap.
(Reading database… 438866 files and directories currently installed.)
Preparing to unpack …/zmap_4.3.4-1_amd64.deb…
Unpacking zmap (4.3.4-1)…
Setting up zmap (4.3.4-1)…
Processing triggers for man-db (2.13.1-1)…
Processing triggers for kali-menu (2026.3.4)…

┌──(kali㉿kali)-[~/Documents]
└─$
```

Attempt to display the help menu of ZMap to confirm that it is actually installed.
```shell
┌──(kali㉿kali)-[~/Documents]
└─$ zmap -h
Nov 15 06:13:16.263 [INFO] zmap: By default, ZMap will output the unique IP addresses of hosts that respond successfully (e.g., SYN-ACK packet). This is equivalent to running ZMap with the following flags: --output-module=csv --output-fields=saddr --output-filter='success=1 && repeat=0' --no-header-row. If you want all responses, explicitly set an output module or set --output-filter="".
Usage: zmap [OPTION]... [SUBNETS]...
A fast Internet-wide scanner.

Basic Arguments:
  -p, --target-ports=ports      comma-delimited list of ports and port ranges
                                  to scan (for TCP and UDP scans)
...
equivalent to running zmap --output-module=csv --output-fields=saddr
--output-filter="success = 1 && repeat = 0" --no-header-row.

┌──(kali㉿kali)-[~/Documents]
└─$
```

## Step 2: Downloading the Probes
Either clone this entire repository...
```shell
git clone "https://github.com/xyzzklk/udp_scanning_probe_templates.git"
```

...or download a specific probe file you want to use, say DNS.
```shell
wget "https://github.com/xyzzklk/udp_scanning_probe_templates/blob/main/probe_templates/dns_53.pkt"
```

In this demonstration, we will clone the entire repository (`git clone ...`), and change the current working directory to the repository root.
```shell
cd udp_scanning_probe_templates
```
```shell
┌──(kali㉿kali)-[~/Documents]
└─$ git clone "https://github.com/xyzzklk/udp_scanning_probe_templates.git"
Cloning into 'udp_scanning_probe_templates'...
remote: Enumerating objects: 51, done.
remote: Counting objects: 100% (51/51), done.
remote: Compressing objects: 100% (20/20), done.
remote: Total 51 (delta 6), reused 49 (delta 5), pack-reused 0 (from 0)
Receiving objects: 100% (51/51), 6.28 KiB | 3.14 MiB/s, done.
Resolving deltas: 100% (6/6), done.

┌──(kali㉿kali)-[~/Documents]
└─$ ls
udp_scanning_probe_templates

┌──(kali㉿kali)-[~/Documents]
└─$ cd udp_scanning_probe_templates

┌──(kali㉿kali)-[~/Documents/udp_scanning_probe_templates]
└─$ ls
probe_templates  README.md

┌──(kali㉿kali)-[~/Documents/udp_scanning_probe_templates]
└─$ ls probe_templates
bacnet_rpm_47808.pkt  dns_53.pkt                       memcache_11211.pkt   pca_nq_5632.pkt    snmp1_161.pkt
citrix_1604.pkt       dns_53_queryAwww.google.com.pkt  mssql_1434.pkt       pca_st_5632.pkt    snmp2_161.pkt
db2disco_523.pkt      dns_53_queryAwww.google.it.pkt   natpmp_5351.pkt      portmap_111.pkt    upnp_1900.pkt
digi1_2362.pkt        ipmi_623.pkt                     netbios_137.pkt      ripv1_520.pkt      wdbrpc_17185.pkt
digi2_2362.pkt        ldap_389.pkt                     ntp_123_monlist.pkt  sentinel_5093.pkt  wsd_3702.pkt
digi3_2362.pkt        mdns_5353.pkt                    ntp_123.pkt          sip_options.tpl

┌──(kali㉿kali)-[~/Documents/udp_scanning_probe_templates]
└─$
```

## Step 3: Initiating a ZMap Scan
In my case, I would use the commands documented in [`example_scan_dns_lan_range.sh`](/example_scan_dns_lan_range.sh) to scan my entire LAN for DNS services open, using the UDP payload [`dns_53.pkt`](probe_templates/dns_53.pkt).
```shell
┌──(kali㉿kali)-[~/Documents/udp_scanning_probe_templates]
└─$ sudo zmap -M udp -p 53 --probe-args=file:./probe_templates/dns_53.pkt -b /dev/null 192.168.0.0/24 -o dns_up_hosts.txt
Nov 15 06:33:39.957 [INFO] zmap: By default, ZMap will output the unique IP addresses of hosts that respond successfully (e.g., SYN-ACK packet). This is equivalent to running ZMap with the following flags: --output-module=csv --output-fields=saddr --output-filter='success=1 && repeat=0' --no-header-row. If you want all responses, explicitly set an output module or set --output-filter="".
Nov 15 06:33:39.957 [INFO] dedup: Response deduplication method is full
Nov 15 06:33:40.033 [INFO] recv: duplicate responses will be excluded from output
Nov 15 06:33:40.033 [INFO] recv: unsuccessful responses will be excluded from output
 0:00 1%; send: 38 1 p/s (546 p/s avg); recv: 0 0 p/s (0 p/s avg); drops: 0 p/s (0 p/s avg); hitrate: 0.00%
 0:00 1%; send: 41 36.6 Kp/s (589 p/s avg); recv: 0 0 p/s (0 p/s avg); drops: 0 p/s (0 p/s avg); hitrate: 0.00%
 0:01 13%; send: 256 done (2.69 Kp/s avg); recv: 0 0 p/s (0 p/s avg); drops: 0 p/s (0 p/s avg); hitrate: 0.00%
 0:02 26%; send: 256 done (2.69 Kp/s avg); recv: 0 0 p/s (0 p/s avg); drops: 0 p/s (0 p/s avg); hitrate: 0.00%
 0:03 38%; send: 256 done (2.69 Kp/s avg); recv: 0 0 p/s (0 p/s avg); drops: 0 p/s (0 p/s avg); hitrate: 0.00%
 0:04 50%; send: 256 done (2.69 Kp/s avg); recv: 0 0 p/s (0 p/s avg); drops: 0 p/s (0 p/s avg); hitrate: 0.00%
 0:05 63% (4s left); send: 256 done (2.69 Kp/s avg); recv: 1 1 p/s (0 p/s avg); drops: 0 p/s (0 p/s avg); hitrate: 0.39%
 0:06 75% (3s left); send: 256 done (2.69 Kp/s avg); recv: 1 0 p/s (0 p/s avg); drops: 0 p/s (0 p/s avg); hitrate: 0.39%
 0:07 87% (2s left); send: 256 done (2.69 Kp/s avg); recv: 1 0 p/s (0 p/s avg); drops: 0 p/s (0 p/s avg); hitrate: 0.39%
 0:08 100% (1s left); send: 256 done (2.69 Kp/s avg); recv: 1 0 p/s (0 p/s avg); drops: 0 p/s (0 p/s avg); hitrate: 0.39%
 0:09 100% (0s left); send: 256 done (2.69 Kp/s avg); recv: 1 0 p/s (0 p/s avg); drops: 0 p/s (0 p/s avg); hitrate: 0.39%
Nov 15 06:33:49.041 [INFO] zmap: completed

┌──(kali㉿kali)-[~/Documents/udp_scanning_probe_templates]
└─$
```

And we do have results:
```
┌──(kali㉿kali)-[~/Documents/udp_scanning_probe_templates]
└─$ cat dns_up_hosts.txt
192.168.0.1
```
> [!NOTE]
> When scanning a LAN, we probably need to add the `-b /dev/null` argument to tell ZMap to ignore the default blocklist (`/etc/zmap/blocklist.conf`), which blocks `192.168.0.0/16` by default.

> [!NOTE]
> If someone were to scan a WAN for DNS services, the command would be something like the following, like outlined in [`example_scan_entire_wan.sh`](/example_scan_dns_entire_wan.sh), and in this case we do not need to ignore the default blocklist.
> ```shell
> sudo zmap -M udp -p 53 --probe-args=file:./probe_templates/dns_53.pkt -o dns_up_wan_hosts.txt
> ```

## Step 4 (Optional): Further Process Scan Results
After gathering a list of up hosts, you can decide to further process the up hosts, e.g. detect if there are any ones vulnerable to being exploited as reflectors of amplification DDoS attacks, using a tool like [`AmpliFilter`](https://github.com/xyzzklk/amplifilter).