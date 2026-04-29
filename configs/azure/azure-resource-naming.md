# Azure Resource Naming Reference

## Primary Resources

| Resource Type | Name |
|---|---|
| Resource Group | TNPH-RG-MEDNET-LAB-AUE-001 |
| Virtual Network | TNPH-VNET-HUB-LAB-AUE-001 |
| Route Table | TNPH-RT-HUB-LAB-AUE-001 |
| Log Analytics Workspace | TNPH-LAW-MEDNET-LAB-AUE-001 |
| Storage Account | tnphstmednetlab001 |

## Subnets

| Purpose | Name | CIDR |
|---|---|---|
| Gateway | GatewaySubnet | 10.50.0.0/27 |
| Management | TNPH-SNET-MGMT-LAB-AUE-001 | 10.50.10.0/24 |
| Shared Services | TNPH-SNET-SHARED-LAB-AUE-001 | 10.50.20.0/24 |
| SecOps | TNPH-SNET-SECOPS-LAB-AUE-001 | 10.50.30.0/24 |
| Private Endpoints | TNPH-SNET-PEP-LAB-AUE-001 | 10.50.40.0/24 |

## NSGs

| Subnet | NSG |
|---|---|
| TNPH-SNET-MGMT-LAB-AUE-001 | TNPH-NSG-MGMT-LAB-AUE-001 |
| TNPH-SNET-SHARED-LAB-AUE-001 | TNPH-NSG-SHARED-LAB-AUE-001 |
| TNPH-SNET-SECOPS-LAB-AUE-001 | TNPH-NSG-SECOPS-LAB-AUE-001 |
