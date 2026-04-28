# Design Decisions

## Purpose

This document records key design decisions made during the TNP MedNet project.

## Decision Register

| ID | Decision | Reason | Owner |
|---|---|---|---|
| DD-001 | Use MPLS L3VPN for WAN connectivity | Provides realistic enterprise customer-provider routing | Tommy Huynh |
| DD-002 | Use AS 65001 for customer and AS 65002 for provider | Clean separation between customer and telco routing | Tommy Huynh |
| DD-003 | Use VRF TNPH | Separates customer routes inside provider network | Tommy Huynh |
| DD-004 | Keep P router BGP-free | Follows scalable MPLS provider design | Tommy Huynh |
| DD-005 | Use HSRP for data centre VLAN gateways | Provides gateway redundancy | Tommy Huynh |
| DD-006 | Use Sophos at data centre edge | Provides enterprise firewall function | Tommy Huynh |
| DD-007 | Use pfSense at branches | Provides flexible branch firewall and VLAN control | Tommy Huynh |
| DD-008 | Use Wazuh and Splunk together | Demonstrates endpoint security and log analytics | Misha Milanovic |
| DD-009 | Use Ubuntu 24.04 for monitoring node | Modern LTS platform for Docker stack | Tommy Huynh |
| DD-010 | Use Windows Server 2022 for AD and SQL nodes | Modern Windows Server platform | Tommy Huynh |
| DD-011 | Use VND as primary financial currency with USD and AUD equivalents | Aligns with HCMC-based profile and international portfolio readability | Finance Team |
| DD-012 | Add Peter Phan as Risk, Safety, and Compliance Director | Adds governance and incident escalation realism | Dr. Tony To |

## Deferred Decisions

| ID | Decision | Reason |
|---|---|---|
| DEF-001 | Azure VPN full configuration | Deferred until core lab is stable |
| DEF-002 | Full firewall policy matrix | Deferred until pfSense and Sophos exports are completed |
| DEF-003 | Production-grade HA firewall pair | Lab currently documents Sophos HA concept but can be expanded later |
