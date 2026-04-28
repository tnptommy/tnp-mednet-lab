# Solution Design

## Purpose

This document describes the solution components selected for the TNP MedNet network lab.

## Solution Components

| Component | Design Choice | Reason |
|---|---|---|
| WAN | MPLS L3VPN | Scalable private connectivity between sites |
| Routing | eBGP and MP-BGP VPNv4 | Enterprise-style customer-provider routing |
| Provider Core | OSPF and MPLS LDP | Label switching and core transport |
| Data Centre Gateways | HSRP on CSW01 and CSW02 | Gateway redundancy |
| Firewall Edge | Sophos XG | Central data centre security control |
| Branch Firewall | pfSense | Branch segmentation and policy control |
| Monitoring | Wazuh and Splunk | SIEM, syslog, dashboards, and alerts |
| Servers | Windows Server 2022 | AD, DNS, DHCP, and SQL services |
| Container Platform | Ubuntu 24.04 with Docker | Monitoring stack deployment |
| Documentation | GitHub repository | Portfolio-ready technical and BA documentation |

## Routing Design

The customer network uses AS 65001. The provider network uses AS 65002. CE devices peer with PE routers using eBGP. Provider PE routers exchange VPNv4 routes using MP-BGP. The P router remains BGP-free and performs MPLS label switching only.

## Firewall Design

The Sophos firewall protects the data centre edge. pfSense firewalls are used at the metro and remote clinic branches to control local VLAN traffic and upstream access to the MPLS WAN.

## Monitoring Design

Wazuh collects host and security events. Splunk receives syslog and provides dashboards for network status, BGP events, security alerts, and MPLS visibility.

## Documentation Design

All project artefacts are organised into:

- `ba/`
- `configs/`
- `monitoring/`
- `docs/`
- `scripts/`
- `topology/`
- `diagrams/`
- `images/`
