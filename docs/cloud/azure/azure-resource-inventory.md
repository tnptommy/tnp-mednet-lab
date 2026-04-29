# Azure Resource Inventory

This document tracks the Azure resources used in the TNP MedNet Lab.

## Current Status

Azure Foundation has been created in the Azure Student subscription using the Australia Southeast region.

## Resource Inventory

| Resource Name | Resource Type | Region | Purpose | Status | Cost Risk |
|---|---|---|---|---|---|
| TNPH-RG-MEDNET-LAB-AUSE-001 | Resource Group | Australia Southeast | Main Azure lab container | Created | Free |
| TNPH-VNET-HUB-LAB-AUSE-001 | Virtual Network | Australia Southeast | Azure hub network | Created | Free |
| GatewaySubnet | Subnet | Australia Southeast | Reserved for future Azure VPN Gateway | Created | Free |
| TNPH-SNET-MGMT-LAB-AUSE-001 | Subnet | Australia Southeast | Management workloads | Created | Free |
| TNPH-SNET-SHARED-LAB-AUSE-001 | Subnet | Australia Southeast | Shared services workloads | Created | Free |
| TNPH-SNET-SECOPS-LAB-AUSE-001 | Subnet | Australia Southeast | Security and monitoring workloads | Created | Free |
| TNPH-SNET-PEP-LAB-AUSE-001 | Subnet | Australia Southeast | Future private endpoints | Created | Free |
| TNPH-NSG-MGMT-LAB-AUSE-001 | Network Security Group | Australia Southeast | Management subnet filtering | Created | Free |
| TNPH-NSG-SHARED-LAB-AUSE-001 | Network Security Group | Australia Southeast | Shared services subnet filtering | Created | Free |
| TNPH-NSG-SECOPS-LAB-AUSE-001 | Network Security Group | Australia Southeast | SecOps subnet filtering | Created | Free |
| TNPH-RT-HUB-LAB-AUSE-001 | Route Table | Australia Southeast | Future hybrid routing | Created | Free |
| TNPH-LAW-MEDNET-LAB-AUSE-001 | Log Analytics Workspace | Australia Southeast | Azure Monitor logs | Created | Low if limited ingestion |
| tnphstmednetlab001 | Storage Account | Australia Southeast | Scripts, reports, and future Terraform state planning | Created | Low |

## Not Yet Deployed

The following resources are planned for later phases and should not be deployed permanently under the Azure Student subscription.

| Resource | Purpose | Status | Cost Risk |
|---|---|---|---|
| Azure VPN Gateway | Site-to-site VPN to Sophos firewall | Planned | High if left running |
| Local Network Gateway | On-premises network representation | Planned | Low |
| Azure Bastion | Secure private VM access | Planned | Medium |
| Azure Firewall | Central cloud firewall | Planned | High |
| Azure Virtual Machines | Cloud workload testing | Planned | Medium to High |
| Recovery Services Vault | Backup and disaster recovery | Planned | Low to Medium |
| Azure Arc | Hybrid server management | Planned | Low |
| Defender for Cloud paid plans | Cloud security posture and workload protection | Planned | Medium if enabled after trial |

## Cost-Control Notes

- Azure VPN Gateway should only be deployed during a short validation window.
- Azure VMs should be stopped and deallocated after testing.
- Log Analytics ingestion should be kept low.
- Defender paid plans should not be enabled permanently unless required.
- Unused public IPs, disks, and gateways should be deleted after testing.
