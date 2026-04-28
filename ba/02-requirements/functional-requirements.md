# Functional Requirements Document

## Purpose

This document defines the functional requirements for the TNP MedNet network solution.

## Network Functional Requirements

| ID | Requirement | Priority |
|---|---|---|
| FR-001 | The data centre must connect to the ISP through the Sophos firewall | Must Have |
| FR-002 | CSW01 and CSW02 must provide Layer 3 gateways for VLAN 99 and VLAN 100 | Must Have |
| FR-003 | HSRP must provide gateway redundancy for DC server and monitoring VLANs | Must Have |
| FR-004 | The MPLS provider core must support PE-to-PE VPNv4 route exchange | Must Have |
| FR-005 | The P router must operate as a BGP-free core device | Must Have |
| FR-006 | CE routers must exchange customer routes with PE routers using eBGP | Must Have |
| FR-007 | Metro and remote clinic sites must use pfSense as branch firewalls | Must Have |
| FR-008 | Access switches must separate endpoint traffic by VLAN | Must Have |
| FR-009 | The remote clinic must include an isolated VLAN for Kali attack simulation | Should Have |

## Monitoring Functional Requirements

| ID | Requirement | Priority |
|---|---|---|
| FR-010 | Wazuh must collect endpoint security events | Must Have |
| FR-011 | Splunk must receive syslog from network and firewall devices | Must Have |
| FR-012 | Dashboards must show network, BGP, MPLS, and security events | Should Have |
| FR-013 | BGP neighbour down events must be detectable through syslog | Should Have |
| FR-014 | Nmap scan activity from VLAN 666 must generate a monitoring event | Should Have |

## Server Functional Requirements

| ID | Requirement | Priority |
|---|---|---|
| FR-015 | AD01 must provide Active Directory services | Must Have |
| FR-016 | AD01 must provide DNS and DHCP services where required | Should Have |
| FR-017 | SQL01 must represent backend clinical database services | Should Have |
| FR-018 | MON01 must host Docker services for monitoring | Must Have |

## Documentation Functional Requirements

| ID | Requirement | Priority |
|---|---|---|
| FR-019 | All major network devices must have configuration files stored in the repository | Must Have |
| FR-020 | Testing documents must include BGP, MPLS, HSRP, VLAN, and attack simulation tests | Must Have |
| FR-021 | A runbook must be produced for operational support | Must Have |
