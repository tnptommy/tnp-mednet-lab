# Gap Analysis

## Purpose

This document compares the current state with the target state and identifies required changes.

## Gap Summary

| Area | Current State | Target State | Gap |
|---|---|---|---|
| WAN | Basic site connectivity | MPLS L3VPN | Need provider-style routed WAN |
| Routing | Limited dynamic routing | eBGP, MP-BGP VPNv4, OSPF, LDP | Need full routing architecture |
| Segmentation | Inconsistent VLAN separation | Clinical, admin, server, SIEM, isolated VLANs | Need clear VLAN design |
| Monitoring | Fragmented or missing | Wazuh and Splunk | Need central monitoring stack |
| Security | Limited branch policy | Sophos and pfSense firewall layers | Need policy-based segmentation |
| Availability | Single points of failure | HSRP gateway redundancy | Need failover design |
| Documentation | Incomplete | Full GitHub documentation | Need BA and technical artefacts |
| Operations | Manual troubleshooting | Runbook and test evidence | Need operational handover |

## Financial Gap

| Area | Current Impact | Target Benefit |
|---|---|---|
| Downtime | Estimated annual impact of VND 12.7B / USD 483K / AUD 672K | Reduced downtime and faster restoration |
| Expansion | High manual effort for each new site | Reusable branch template |
| Security operations | Limited visibility | Central log correlation and alerting |
| Support effort | Senior engineer dependency | Standard runbook and automation scripts |

## Recommended Actions

1. Complete core MPLS and BGP design.
2. Complete branch firewall and VLAN segmentation.
3. Deploy monitoring stack on Ubuntu 24.04.
4. Complete Windows Server 2022 services.
5. Create verification scripts and testing evidence.
6. Finalise BA artefacts, runbook, and handover document.
