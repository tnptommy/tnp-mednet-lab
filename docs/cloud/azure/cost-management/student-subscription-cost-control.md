# Azure Student Subscription Cost Control

This document defines cost-control rules for running the TNP MedNet Azure lab under an Azure Student subscription.

## Low-Cost Resources

The following resources are suitable for the foundation phase:

- Resource Group
- VNet
- Subnets
- NSGs
- Route Table
- Azure Policy
- Small Log Analytics usage
- Storage Account with minimal data

## Cost-Sensitive Resources

The following resources should not run permanently:

- Azure VPN Gateway
- Azure Firewall
- Azure Bastion
- Azure Virtual Machines
- NAT Gateway
- Defender paid plans

## Cost-Control Rules

- Do not deploy Azure VPN Gateway until ready to test.
- Delete Azure VPN Gateway after screenshots and validation.
- Stop and deallocate Azure VMs after use.
- Keep Log Analytics ingestion low.
- Use short retention where possible.
- Review cost before and after each Azure phase.
- Remove unused public IPs.
- Avoid premium SKUs unless required for short testing.

## Cleanup Checklist

- Delete unused public IPs
- Delete temporary VMs
- Delete VPN Gateway after testing
- Delete temporary disks
- Disable paid Defender plans after demo
- Check Cost Management in Azure Portal
