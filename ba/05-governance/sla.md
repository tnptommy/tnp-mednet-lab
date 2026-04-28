# Service Level Agreement

## Purpose

This document defines target service levels for the TNP MedNet lab environment.

## SLA Scope

The SLA covers:

- MPLS WAN connectivity
- Data centre routing and switching
- Clinical VLAN access
- Server VLAN access
- Monitoring and alerting
- Incident response targets

## Availability Targets

| Service | Target Availability |
|---|---|
| Core clinical network | 99.5% |
| Data centre server VLAN | 99.5% |
| Metro hospital WAN | 99.0% |
| Remote clinic WAN | 98.5% |
| Monitoring stack | 95.0% |
| Isolated testing VLAN | Best effort |

## Response Targets

| Priority | Target Response | Target Update Frequency |
|---|---|---|
| P1 | 15 minutes | Every 30 minutes |
| P2 | 30 minutes | Every 1 hour |
| P3 | 4 business hours | Daily |
| P4 | 2 business days | As required |

## Recovery Targets

| Service | Target Recovery |
|---|---|
| HSRP gateway failover | Less than 1 minute in lab validation |
| BGP routing issue | Within 2 hours for P1/P2 |
| Firewall policy issue | Within 4 hours for P2/P3 |
| Monitoring container issue | Within 1 business day |
| Documentation issue | Within 2 business days |

## Exclusions

This SLA does not cover:

- Host machine failure
- VMware Workstation failure
- EVE-NG image corruption
- Internet provider outage outside lab control
- Intentional attack simulations performed during approved testing windows
