# Azure Deployment Plan

This document defines the Azure deployment plan for the TNP MedNet Lab.

## Goal

The goal is to create a cost-controlled Azure foundation for a hybrid cloud healthcare environment.

## Phase 1 — Azure Foundation

Resources:

- Resource Group
- Hub VNet
- Subnets
- NSGs
- Route Table
- Log Analytics Workspace
- Storage Account

## Phase 2 — Monitoring

Resources:

- Azure Monitor
- Log Analytics Workspace
- KQL queries
- Alert planning

## Phase 3 — Governance

Resources:

- Azure Policy
- Tagging standard
- RBAC model
- Cost-control process

## Phase 4 — Azure Arc

Target servers:

- TNPH-DC-AD01
- TNPH-DC-SQL01
- TNPH-DC-MON01

## Phase 5 — VPN

Future resources:

- Azure VPN Gateway
- Local Network Gateway
- Site-to-site VPN to Sophos

VPN Gateway should only be deployed temporarily to avoid unnecessary student subscription cost.
