# Architecture Overview

## Purpose

This document provides a high-level architecture overview of the **TNP MedNet — Enterprise Healthcare Network Lab**.

The lab simulates a multi-site healthcare organisation based in **Ho Chi Minh City, Vietnam**. It includes a central data centre, a metro hospital, a remote community clinic, an MPLS provider core, enterprise firewalls, Windows Server infrastructure, and a Docker-based monitoring stack.

The purpose of the architecture is to demonstrate how a healthcare organisation can design a secure, resilient, and scalable enterprise network for clinical access, operational support, monitoring, and future cloud integration.

---

## Business Context

TNP MedNet operates across three simulated healthcare locations:

| Site | Location | Purpose |
|---|---|---|
| Data Centre | Chanh Hung Ward, Ho Chi Minh City | Central infrastructure, firewall, servers, monitoring, and core routing |
| Metro Hospital | Ben Thanh Ward, Ho Chi Minh City | Main clinical and administrative healthcare site |
| Remote Community Clinic | Long Phuoc Ward, Ho Chi Minh City | Outer-area healthcare branch used to simulate rural-style remote access |

The network is designed for healthcare use cases where doctors, nurses, administrative staff, and IT operations teams require reliable access to clinical systems and monitoring platforms.

---

## Architecture Goals

The main goals of the architecture are:

1. Provide secure connectivity between all healthcare sites.
2. Use MPLS L3VPN to simulate enterprise WAN connectivity.
3. Use BGP and MP-BGP VPNv4 for scalable routing.
4. Keep the provider core separated from customer routes.
5. Use HSRP for data centre gateway redundancy.
6. Segment traffic using VLANs and firewalls.
7. Provide central monitoring using Wazuh and Splunk.
8. Support future cloud integration through Azure VPN Gateway.
9. Maintain clear documentation for GitHub portfolio and operational handover.

---

## High-Level Topology

```text
Azure Cloud
    |
IPSec VPN
    |
VIETTEL-ISP-RTR
    |
Sophos Firewall
    |
Data Centre Core Switches
    |
MPLS L3VPN Provider Core
    |
Metro Hospital and Remote Community Clinic
```

---

## Architecture Layers

| Layer | Components | Description |
|---|---|---|
| Cloud Layer | Azure VPN Gateway, Azure VNet | Future cloud-hosted healthcare services and FHIR API integration |
| ISP Layer | VIETTEL-ISP-RTR | Internet uplink, NAT, and WAN edge routing |
| Data Centre Edge | Sophos XG | Central firewall and security boundary |
| Data Centre Core | TNPH-DC-CSW01, TNPH-DC-CSW02 | Layer 3 core, HSRP, server VLANs, monitoring VLAN |
| MPLS Core | PE-Router-L, P-Router, PE-Router-R | Provider core using OSPF, MPLS LDP, and MP-BGP VPNv4 |
| Branch Edge | TNPH-MET-CE01, TNPH-RUR-CE01 | Customer edge routing for branch sites |
| Branch Firewall | Metro pfSense, Remote Clinic pfSense | Local firewalling, VLAN gateway, and segmentation |
| Access Layer | Metro and Remote Clinic access switches | Endpoint access for clinical, admin, and isolated VLANs |
| Monitoring Layer | TNPH-DC-MON01 | Ubuntu 24.04 Docker host running Wazuh and Splunk |

---

## Main Technologies

| Area | Technologies |
|---|---|
| Routing | OSPF, eBGP, MP-BGP VPNv4 |
| MPLS | MPLS LDP, VRF, L3VPN |
| Switching | VLANs, trunking, HSRP v2, EtherChannel LACP, Rapid PVST+ |
| Firewalling | Sophos XG, pfSense |
| Servers | Windows Server 2022, Active Directory, DNS, DHCP, SQL Server |
| Monitoring | Ubuntu 24.04, Docker, Wazuh, Splunk |
| Cloud | Azure VPN Gateway, Azure VNet |

---

## Design Summary

### Data Centre

The data centre is the central site of the network. It hosts the main firewall, core switches, Windows servers, and monitoring server.

Key data centre components:

- Sophos XG firewall
- TNPH-DC-CSW01
- TNPH-DC-CSW02
- Windows Server 2022 AD01
- Windows Server 2022 SQL01
- Ubuntu 24.04 MON01
- Server VLAN 99
- Monitoring VLAN 100
- HSRP default gateways

### MPLS Provider Core

The MPLS provider core simulates a service provider WAN.

Provider devices:

- PE-Router-L
- P-Router
- PE-Router-R

The P router is intentionally kept as a BGP-free core device. It does not know customer routes. It only performs MPLS label switching.

### Metro Hospital

The metro hospital represents the main clinical branch. It contains:

- Metro CE router
- Metro pfSense firewall
- Metro access switch
- Clinical endpoint
- VoIP endpoint
- Admin workstation

### Remote Community Clinic

The remote community clinic represents an outer-area healthcare branch. It contains:

- Remote Clinic CE router
- Remote Clinic pfSense firewall
- Remote Clinic access switch
- Clinical endpoint
- Kali Linux host in isolated VLAN 666

The isolated VLAN is used only for controlled security testing.

---

## Traffic Flow Example

Example: Remote clinic clinical user accessing a data centre service.

```text
Remote Clinic Endpoint
    |
Remote Clinic Access Switch
    |
Remote Clinic pfSense
    |
Remote Clinic CE Router
    |
PE-Router-R
    |
MPLS Provider Core
    |
PE-Router-L
    |
Data Centre Core Switch
    |
Server VLAN
    |
Windows Server 2022 Service
```

---

## Security Architecture

The security architecture uses multiple layers of control:

| Control | Purpose |
|---|---|
| Sophos XG | Protects the data centre edge |
| pfSense | Provides branch firewalling and VLAN control |
| VLAN segmentation | Separates clinical, admin, monitoring, and isolated traffic |
| VRF TNPH | Separates customer routing inside the provider network |
| Wazuh | Endpoint security event collection |
| Splunk | Syslog, dashboards, and event correlation |
| Isolated VLAN 666 | Controlled attack simulation environment |

---

## Monitoring Architecture

The monitoring platform runs on **TNPH-DC-MON01**, an Ubuntu 24.04 Docker host.

Monitoring services include:

- Wazuh Manager
- Wazuh Indexer
- Wazuh Dashboard
- Splunk Enterprise

Log sources include:

- Windows Server 2022 AD01
- Windows Server 2022 SQL01
- Sophos firewall
- pfSense firewalls
- Cisco routers and switches
- Kali Linux testing host
- Branch endpoints

---

## Architecture Outcome

The final architecture provides a realistic enterprise healthcare network design that demonstrates:

- Multi-site WAN design
- MPLS L3VPN
- Customer-provider routing separation
- BGP-free provider core
- Data centre gateway redundancy
- Branch firewall segmentation
- Centralised monitoring
- Security testing
- Technical and Business Analysis documentation
