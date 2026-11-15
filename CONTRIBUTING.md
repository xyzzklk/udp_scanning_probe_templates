# Contributing to UDP Scanning Probes

First off, thank you for your interest in contributing! Whether it's a new UDP service probe, a bug fix or an optimised template, your help is appreciated.

## How to Contribute

1. **Fork the Repository**
2. **Create a Feature Branch** (`git checkout -b feature/amazing-udp-probe`)
3. **Add Your Payload or Template**:
   - Place raw binary/text payloads inside the `probe_templates/` directory.
   - Follow the established naming convention: `servicename_port.pkt` (e.g., `customservice_1234.pkt`), or use similar but sensible naming for extended description.
   - Or, use `.tpl` if the file includes variable placeholders (like `${DADDR}`), like layer 7 UDP templates.
4. **Ensure Integrity (No Line Ending Corruption)**:
   - This repository uses a `.gitattributes` file to force Git to treat `.pkt` and `.tpl` files as binary. Ensure your editor doesn't accidentally inject `CRLF` line endings if your template is text/XML-based.
5. **Commit & Push** (`git commit -m "Add probe for <Service> on port <Port>"` -> `git push origin feature/amazing-udp-probe`)
6. **Open a Pull Request**

## Guidelines for New Payloads
- Ensure the payload represents a valid query for the target service.
- In your pull request description, briefly explain what service the probe targets, its default UDP port and whether it acts as an amplification vector.