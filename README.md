# Introduction
This is a collection of a wide range of UDP probe payloads and templates for UDP service scanning with tools like ZMap.

These probes are useful in network scanning because UDP does not establish connections. Simply sending an empty, malformed or random-payload packet does not guarantee a response, and the request might be discarded. Sending a packet with a protocol-compliant layer-4 payload forces the target application to actually reply.

> [!NOTE]
> It is particularly useful to use these probes to discover UDP-based services vulnerable to becoming reflectors of Distributed Reflection Denial of Service attacks.
> 
> In such security audit or research scenario, it is recommended to
> 1. Perform an initial scan using a probe with a scanning tool, like [ZMap](https://github.com/zmap/zmap), to detect opening UDP services in your target environment.
> 2. Then use a filtering tool like [AmpliFilter](https://github.com/xyzzklk/amplifilter) to filter out ones that are _actually_ vulnerable to becoming reflectors.

> [!WARNING]
>
> **⚠️ Disclaimer**
>
> The scripts, packet payloads (`.pkt`) and configurations in this repository are provided strictly for **educational purposes, authorised security research and defensive network auditing**. The author(s) and contributor(s) of this repository assume **no liability whatsoever** for any misuse, damage or legal consequences resulting from the use, modification or distribution of this material. By downloading, cloning, or using any part of this repository, you explicitly agree to the following terms:
> 1. Mass network scanning can generate significant network traffic, impact third-party services and trigger automated security alarms. You must ensure that you have explicit, documented authorisation from the network owner before executing any probes or scripts contained in this repository against any target outside your own test lab.
> 2. Unauthorised network scanning may violate local, national and international laws. The author(s) of this repository assume no liability and are not responsible for any misuse, damage or legal consequences resulting from the use or misuse of the payloads or scripts provided herein.
> 3. The software, scripts and packet payloads in this repository are provided **"AS IS"**, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and non-infringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

# Demo Usage: Using Probe Payloads with ZMap