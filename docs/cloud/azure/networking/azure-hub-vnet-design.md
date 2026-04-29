# Azure Hub VNet Design

This document defines the Azure Hub VNet design for the TNP MedNet Lab.

## Hub VNet

- Name: TNPH-VNET-HUB-LAB-AUE-001
- Address Space: 10.50.0.0/16
- Region: Australia East

## Subnet Plan

| Subnet Name | Address Prefix | Purpose |
|---|---|---|
| GatewaySubnet | 10.50.0.0/27 | Future Azure VPN Gateway |
| TNPH-SNET-MGMT-LAB-AUE-001 | 10.50.10.0/24 | Management workloads |
| TNPH-SNET-SHARED-LAB-AUE-001 | 10.50.20.0/24 | Shared services |
| TNPH-SNET-SECOPS-LAB-AUE-001 | 10.50.30.0/24 | Security and monitoring |
| TNPH-SNET-PEP-LAB-AUE-001 | 10.50.40.0/24 | Private endpoints |

## Design Notes

The Azure address space uses 10.50.0.0/16 to avoid overlap with the on-premises TNP MedNet network.

The GatewaySubnet is created now so the environment is ready for future site-to-site VPN testing.
