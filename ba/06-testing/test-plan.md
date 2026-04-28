# Test Plan

## Purpose

This document defines the testing approach for the TNP MedNet lab.

## Test Scope

Testing covers:

- BGP routing
- MPLS L3VPN
- OSPF and LDP
- HSRP failover
- VLAN segmentation
- Branch connectivity
- Firewall path validation
- Wazuh and Splunk monitoring
- Attack simulation from isolated VLAN

## Test Environments

| Environment | Purpose |
|---|---|
| EVE-NG | Network topology simulation |
| VMware Workstation | Host platform |
| Windows Server 2022 | AD, DNS, DHCP, SQL services |
| Ubuntu 24.04 | Docker monitoring server |
| Kali Linux | Security testing from isolated VLAN |

## Entry Criteria

Testing can begin when:

- Network devices are configured
- BGP sessions are established
- MPLS LDP neighbours are up
- VLANs and SVIs are configured
- pfSense and Sophos are reachable
- Monitoring stack is deployed or ready for log testing

## Exit Criteria

Testing is complete when:

- All mandatory tests pass
- Evidence is captured
- Failed tests are documented
- Known issues are recorded
- Runbook is updated
- Handover document is completed

## Test Categories

| Category | Documents |
|---|---|
| Connectivity | `connectivity-matrix.md` |
| BGP | `bgp-verification.md` |
| MPLS | `mpls-verification.md` |
| HSRP | `hsrp-failover-test.md` |
| VLAN | `vlan-isolation-test.md` |
| Security | `attack-simulation.md` |
