# Azure VNet and Subnet Plan

## Azure Address Space

| Network | CIDR | Purpose |
|---|---|---|
| Azure Hub VNet | 10.50.0.0/16 | Main Azure cloud network |

## Azure Subnets

| Subnet | CIDR |
|---|---|
| GatewaySubnet | 10.50.0.0/27 |
| TNPH-SNET-MGMT-LAB-AUE-001 | 10.50.10.0/24 |
| TNPH-SNET-SHARED-LAB-AUE-001 | 10.50.20.0/24 |
| TNPH-SNET-SECOPS-LAB-AUE-001 | 10.50.30.0/24 |
| TNPH-SNET-PEP-LAB-AUE-001 | 10.50.40.0/24 |

## On-Premises Summary

The on-premises environment uses 10.1.0.0/16 ranges.

The Azure 10.50.0.0/16 range does not overlap with the on-premises network.
