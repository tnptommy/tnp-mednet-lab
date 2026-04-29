# Azure Hybrid Cloud Foundation

This folder contains the Azure extension for the TNP MedNet Lab.

The Azure layer extends the on-premises healthcare network into a hybrid cloud and MSP-style environment.

## Scope

- Azure Resource Group
- Azure Hub VNet
- Azure subnets
- Network Security Groups
- Route Table
- Log Analytics Workspace
- Storage Account
- Azure Policy planning
- Azure Arc planning
- Azure Backup planning
- Future site-to-site VPN planning

## Naming Standard

All Azure resources should start with TNPH where Azure allows uppercase names.

Example names:

- TNPH-RG-MEDNET-LAB-AUE-001
- TNPH-VNET-HUB-LAB-AUE-001
- TNPH-SNET-MGMT-LAB-AUE-001
- TNPH-NSG-MGMT-LAB-AUE-001
- TNPH-LAW-MEDNET-LAB-AUE-001

Storage account names must be lowercase:

- tnphstmednetlab001

## Cost Control

This lab is designed for Azure Student subscription usage.

Cost-sensitive services such as Azure VPN Gateway, Azure Firewall, Azure Bastion, and Azure VMs should only be deployed during short validation windows.
