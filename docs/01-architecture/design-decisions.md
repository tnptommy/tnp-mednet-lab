# Architecture Design Decisions

## Purpose

This document records the main architecture decisions for the TNP MedNet enterprise healthcare network lab.

---

## Decision Register

| ID | Decision | Reason | Owner |
|---|---|---|---|
| AD-001 | Use Ho Chi Minh City as the organisation location | Aligns the project with a realistic Vietnam-based healthcare scenario | Tommy Huynh |
| AD-002 | Place the data centre in Chanh Hung Ward | Provides a clear central site for infrastructure services | Tommy Huynh |
| AD-003 | Use Ben Thanh Ward as the metro hospital location | Represents a central urban healthcare site | Tommy Huynh |
| AD-004 | Use Long Phuoc Ward as the remote community clinic | Represents an outer-area branch requiring reliable WAN connectivity | Tommy Huynh |
| AD-005 | Use MPLS L3VPN for WAN design | Demonstrates enterprise and service provider routing skills | Tommy Huynh |
| AD-006 | Use AS 65001 for TNP MedNet and AS 65002 for Viettel | Separates customer and provider routing domains | Tommy Huynh |
| AD-007 | Use VRF TNPH | Keeps customer routes separated in the provider network | Tommy Huynh |
| AD-008 | Keep P router BGP-free | Follows scalable MPLS provider core design | Tommy Huynh |
| AD-009 | Use HSRP for data centre VLAN gateways | Provides gateway redundancy | Tommy Huynh |
| AD-010 | Use Sophos XG at the data centre edge | Simulates enterprise firewalling | Tommy Huynh |
| AD-011 | Use pfSense at branch sites | Provides branch firewall and VLAN control | Tommy Huynh |
| AD-012 | Use Windows Server 2022 | Provides modern Microsoft server infrastructure for AD, DNS, DHCP, and SQL | Tommy Huynh |
| AD-013 | Use Ubuntu 24.04 for MON01 | Provides modern LTS Linux platform for Docker monitoring | Tommy Huynh |
| AD-014 | Use Wazuh and Splunk | Demonstrates SIEM, endpoint monitoring, syslog, and dashboards | Misha Milanovic |
| AD-015 | Include Peter Phan as Director of Risk, Safety, and Compliance | Adds realistic governance and incident escalation ownership | Dr. Tony To |

---

## Deferred Decisions

| ID | Decision | Reason |
|---|---|---|
| DD-001 | Full Azure VPN configuration | Deferred until core network is fully stable |
| DD-002 | Detailed firewall policy matrix | Deferred until Sophos and pfSense configs are finalised |
| DD-003 | Production-grade firewall HA | Lab currently focuses on architecture and simulation |
| DD-004 | Full clinical application deployment | Current scope focuses on infrastructure, not application development |

---

## Design Principles

| Principle | Description |
|---|---|
| Security first | Clinical, admin, monitoring, and testing traffic must be separated |
| Operational clarity | The design must be easy to document, test, and hand over |
| Realistic enterprise design | The lab should reflect real-world network design patterns |
| Scalability | The architecture should support future branch expansion |
| Portfolio quality | Documentation should be clean, professional, and GitHub-ready |
