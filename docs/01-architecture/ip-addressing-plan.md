# IP Addressing Plan

## Purpose

This document defines the IP addressing plan for the TNP MedNet enterprise healthcare network lab.

The addressing plan is designed to clearly separate internet, data centre, MPLS provider, branch, server, monitoring, and testing networks.

---

## Addressing Principles

| Principle | Description |
|---|---|
| Clear site separation | Each site has its own network range |
| Point-to-point links | WAN and routing links use /30 networks |
| Loopback stability | Router loopbacks are used for identification and routing |
| VLAN separation | Clinical, admin, server, monitoring, and isolated networks are separated |
| Provider isolation | Provider loopbacks are not advertised to the customer network |

---

## Internet and ISP

| Network / IP | Device / Interface | Purpose |
|---|---|---|
| 192.168.195.0/24 | VMware NAT | Internet uplink network |
| 192.168.195.10 | VIETTEL-ISP-RTR Gi0/0 | ISP router internet-facing interface |
| 192.168.195.2 | VMware NAT Gateway | Default internet gateway |
| 203.0.113.0/30 | ISP to Sophos WAN link | Public WAN point-to-point link |
| 203.0.113.1 | VIETTEL-ISP-RTR Gi0/1 | ISP side of WAN link |
| 203.0.113.2 | TNPH-DC-SOPH01 PortB | Sophos WAN interface |

---

## Sophos Data Centre Links

| Network / IP | Device / Interface | Purpose |
|---|---|---|
| 172.16.16.0/24 | Sophos management network | Firewall management |
| 172.16.16.16 | TNPH-DC-SOPH01 PortA | Sophos management IP |
| 10.1.1.0/30 | Sophos PortC to CSW01 | Data centre firewall-to-core link |
| 10.1.1.1 | Sophos PortC | Sophos side to CSW01 |
| 10.1.1.2 | TNPH-DC-CSW01 Gi0/0 | CSW01 side to Sophos |
| 10.1.1.4/30 | Sophos PortD to CSW02 | Secondary firewall-to-core link |
| 10.1.1.5 | Sophos PortD | Sophos side to CSW02 |
| 10.1.1.6 | TNPH-DC-CSW02 Gi0/0 | CSW02 side to Sophos |

---

## Data Centre VLANs

### VLAN 99 — Server VLAN

| IP | Device | Purpose |
|---|---|---|
| 10.1.99.0/24 | VLAN 99 | Data centre server subnet |
| 10.1.99.1 | HSRP VIP | Default gateway for server VLAN |
| 10.1.99.2 | TNPH-DC-CSW01 VLAN99 SVI | Primary gateway interface |
| 10.1.99.3 | TNPH-DC-CSW02 VLAN99 SVI | Secondary gateway interface |
| 10.1.99.10 | TNPH-DC-AD01 | Windows Server 2022 Active Directory |
| 10.1.99.11 | TNPH-DC-SQL01 | Windows Server 2022 SQL Server |

### VLAN 100 — Monitoring VLAN

| IP | Device | Purpose |
|---|---|---|
| 10.1.100.0/24 | VLAN 100 | Monitoring and SIEM subnet |
| 10.1.100.1 | HSRP VIP | Default gateway for monitoring VLAN |
| 10.1.100.2 | TNPH-DC-CSW01 VLAN100 SVI | Primary gateway interface |
| 10.1.100.3 | TNPH-DC-CSW02 VLAN100 SVI | Secondary gateway interface |
| 10.1.100.10 | TNPH-DC-MON01 | Ubuntu 24.04 Docker monitoring server |

---

## Customer Loopbacks

| IP | Device | Purpose |
|---|---|---|
| 1.1.1.1/32 | TNPH-DC-CSW01 Loopback0 | Customer core loopback |
| 1.1.1.2/32 | TNPH-DC-CSW02 Loopback0 | Customer backup core loopback |
| 1.1.1.10/32 | TNPH-MET-CE01 Loopback0 | Metro CE loopback |
| 1.1.1.20/32 | TNPH-RUR-CE01 Loopback0 | Remote Clinic CE loopback |

---

## Provider Loopbacks

| IP | Device | Purpose |
|---|---|---|
| 2.2.2.1/32 | PE-Router-L Loopback0 | OSPF, LDP, and MP-BGP router ID |
| 2.2.2.2/32 | P-Router Loopback0 | OSPF and LDP router ID |
| 2.2.2.3/32 | PE-Router-R Loopback0 | OSPF, LDP, and MP-BGP router ID |

Provider loopbacks are not advertised to the customer network. This keeps the provider infrastructure hidden from the customer routing table.

---

## MPLS and WAN Links

| Network | Link | IP Allocation |
|---|---|---|
| 10.0.4.0/30 | CSW01 to PE-Router-L | CSW01 10.0.4.2, PE-L 10.0.4.1 |
| 10.0.5.0/30 | CSW02 to PE-Router-R | CSW02 10.0.5.2, PE-R 10.0.5.1 |
| 10.0.6.0/30 | Metro CE to PE-Router-L | Metro CE 10.0.6.2, PE-L 10.0.6.1 |
| 10.0.7.0/30 | Remote Clinic CE to PE-Router-R | Remote CE 10.0.7.2, PE-R 10.0.7.1 |
| 10.0.10.0/30 | PE-Router-L to P-Router | PE-L 10.0.10.1, P 10.0.10.2 |
| 10.0.11.0/30 | P-Router to PE-Router-R | P 10.0.11.1, PE-R 10.0.11.2 |

---

## Metro Hospital Networks

| Network / IP | Device | Purpose |
|---|---|---|
| 10.1.10.0/30 | Metro CE to pfSense | Branch WAN link |
| 10.1.10.1 | TNPH-MET-CE01 Gi0/1 | CE side |
| 10.1.10.2 | TNPH-MET-PFS01 em0 | pfSense WAN |
| 10.1.11.0/24 | Metro VLAN 10 | Clinical network |
| 10.1.11.1 | TNPH-MET-PFS01 em1 | Clinical gateway |
| 10.1.11.10 | MET-MedApp1 | Clinical endpoint |
| 10.1.11.11 | MET-VoIP | VoIP endpoint |
| 10.1.20.0/24 | Metro VLAN 20 | Admin network |
| 10.1.20.1 | TNPH-MET-PFS01 em1.20 | Admin gateway |
| 10.1.20.10 | MET-StaffPC | Admin workstation |

---

## Remote Community Clinic Networks

| Network / IP | Device | Purpose |
|---|---|---|
| 10.1.30.0/30 | Remote Clinic CE to pfSense | Branch WAN link |
| 10.1.30.1 | TNPH-RUR-CE01 Gi0/1 | CE side |
| 10.1.30.2 | TNPH-RUR-PFS01 em0 | pfSense WAN |
| 10.1.31.0/24 | Remote Clinic VLAN 10 | Clinical network |
| 10.1.31.1 | TNPH-RUR-PFS01 em1 | Clinical gateway |
| 10.1.31.10 | RUR-MedApp2 | Clinical endpoint |
| 10.1.66.0/24 | Remote Clinic VLAN 666 | Isolated attacker VLAN |
| 10.1.66.1 | TNPH-RUR-PFS01 em1.666 | Isolated VLAN gateway |
| 10.1.66.10 | RUR-Kali | Kali Linux testing host |

---

## Summary

The IP addressing plan provides clear separation between:

- Internet and ISP networks
- Data centre firewall and core links
- Server and monitoring VLANs
- Customer and provider loopbacks
- MPLS point-to-point links
- Metro hospital networks
- Remote community clinic networks
- Isolated attack simulation network
