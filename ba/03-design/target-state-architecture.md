# Target State Architecture

## Purpose

This document describes the future-state architecture for TNP MedNet.

## Target Architecture Summary

The target architecture uses a centralised data centre in Chanh Hung Ward, a metro hospital in Ben Thanh Ward, and a remote community clinic in Long Phuoc Ward. The sites are connected using an MPLS L3VPN provider network.

## Target Design Principles

| Principle | Description |
|---|---|
| Secure by design | Traffic is segmented using VLANs, firewalls, and VRF separation |
| Resilient gateway design | HSRP provides default gateway redundancy in the data centre |
| Scalable WAN design | MPLS L3VPN supports additional branch sites |
| Operational visibility | Wazuh and Splunk provide security and network monitoring |
| Clear documentation | GitHub repository contains configs, docs, scripts, BA artefacts, and topology files |

## Target Logical Architecture

| Layer | Components |
|---|---|
| Cloud | Azure VPN Gateway and future cloud-hosted services |
| ISP | VIETTEL-ISP-RTR and internet NAT |
| Data Centre Edge | Sophos firewall |
| Data Centre Core | CSW01 and CSW02 with HSRP |
| MPLS Core | PE-Router-L, P-Router, PE-Router-R |
| Branch Edge | Metro CE and Remote Clinic CE |
| Branch Security | pfSense firewalls |
| Access Layer | Metro and Remote Clinic access switches |
| Monitoring | Wazuh and Splunk on MON01 |

## Target Security Segmentation

| Segment | Purpose |
|---|---|
| Clinical VLAN | Medical application access |
| Admin VLAN | Staff workstation access |
| Server VLAN | Active Directory and SQL services |
| SIEM VLAN | Monitoring and log collection |
| Isolated VLAN | Controlled attack simulation |

## Expected Outcome

The target architecture provides a reusable and professional enterprise healthcare design that supports uptime, security visibility, operational handover, and future expansion.
