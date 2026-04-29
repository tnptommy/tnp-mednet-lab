#!/usr/bin/env bash

set -e

LOCATION="australiasoutheast"
RG="TNPH-RG-MEDNET-LAB-AUSE-001"
VNET="TNPH-VNET-HUB-LAB-AUSE-001"

MGMT_SNET="TNPH-SNET-MGMT-LAB-AUSE-001"
SHARED_SNET="TNPH-SNET-SHARED-LAB-AUSE-001"
SECOPS_SNET="TNPH-SNET-SECOPS-LAB-AUSE-001"
PEP_SNET="TNPH-SNET-PEP-LAB-AUSE-001"

NSG_MGMT="TNPH-NSG-MGMT-LAB-AUSE-001"
NSG_SHARED="TNPH-NSG-SHARED-LAB-AUSE-001"
NSG_SECOPS="TNPH-NSG-SECOPS-LAB-AUSE-001"

RT="TNPH-RT-HUB-LAB-AUSE-001"
LAW="TNPH-LAW-MEDNET-LAB-AUSE-001"
STORAGE="tnphstmednetlab001"

az group create \
  --name "$RG" \
  --location "$LOCATION" \
  --tags Project=TNPH-MedNet-Lab Environment=Lab Owner=Tommy-Huynh ManagedBy=TNPH-CloudOps-MSP CostCentre=Student-Lab

az network vnet create \
  --resource-group "$RG" \
  --name "$VNET" \
  --location "$LOCATION" \
  --address-prefix 10.50.0.0/16 \
  --subnet-name "$MGMT_SNET" \
  --subnet-prefix 10.50.10.0/24

az network vnet subnet create \
  --resource-group "$RG" \
  --vnet-name "$VNET" \
  --name GatewaySubnet \
  --address-prefix 10.50.0.0/27

az network vnet subnet create \
  --resource-group "$RG" \
  --vnet-name "$VNET" \
  --name "$SHARED_SNET" \
  --address-prefix 10.50.20.0/24

az network vnet subnet create \
  --resource-group "$RG" \
  --vnet-name "$VNET" \
  --name "$SECOPS_SNET" \
  --address-prefix 10.50.30.0/24

az network vnet subnet create \
  --resource-group "$RG" \
  --vnet-name "$VNET" \
  --name "$PEP_SNET" \
  --address-prefix 10.50.40.0/24

az network nsg create --resource-group "$RG" --name "$NSG_MGMT" --location "$LOCATION"
az network nsg create --resource-group "$RG" --name "$NSG_SHARED" --location "$LOCATION"
az network nsg create --resource-group "$RG" --name "$NSG_SECOPS" --location "$LOCATION"

az network vnet subnet update \
  --resource-group "$RG" \
  --vnet-name "$VNET" \
  --name "$MGMT_SNET" \
  --network-security-group "$NSG_MGMT"

az network vnet subnet update \
  --resource-group "$RG" \
  --vnet-name "$VNET" \
  --name "$SHARED_SNET" \
  --network-security-group "$NSG_SHARED"

az network vnet subnet update \
  --resource-group "$RG" \
  --vnet-name "$VNET" \
  --name "$SECOPS_SNET" \
  --network-security-group "$NSG_SECOPS"

az network route-table create \
  --resource-group "$RG" \
  --name "$RT" \
  --location "$LOCATION"

az network vnet subnet update \
  --resource-group "$RG" \
  --vnet-name "$VNET" \
  --name "$MGMT_SNET" \
  --route-table "$RT"

az network vnet subnet update \
  --resource-group "$RG" \
  --vnet-name "$VNET" \
  --name "$SHARED_SNET" \
  --route-table "$RT"

az network vnet subnet update \
  --resource-group "$RG" \
  --vnet-name "$VNET" \
  --name "$SECOPS_SNET" \
  --route-table "$RT"

az monitor log-analytics workspace create \
  --resource-group "$RG" \
  --workspace-name "$LAW" \
  --location "$LOCATION" \
  --retention-time 30

az storage account create \
  --resource-group "$RG" \
  --name "$STORAGE" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2 \
  --min-tls-version TLS1_2 \
  --allow-blob-public-access false

echo "Azure foundation deployment completed."
