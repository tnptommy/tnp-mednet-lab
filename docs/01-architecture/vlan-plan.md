# VLAN Plan

## Purpose

This document defines the VLAN design for the TNP MedNet enterprise healthcare network lab.

The VLAN plan separates clinical systems, administrative workstations, data centre servers, monitoring services, and isolated security testing.

---

## VLAN Summary

| VLAN | Name | Purpose | Site |
|---|---|---|---|
| 10 | CLINICAL | Medical applications and VoIP | Metro, Remote Clinic |
| 20 | ADMIN | Staff workstations | Metro |
| 99 | DC_SERVERS | Active Directory and SQL Server | Data Centre |
| 100 | DC_SIEM | Monitoring VM and Docker stack | Data Centre |
| 666 | ISOLATED | Kali Linux attack simulation | Remote Clinic |
| 999 | NATIVE | Native VLAN for trunk links | All sites |

---

## VLAN 10 — Clinical

| Item | Details |
|---|---|
| VLAN ID | 10 |
| Name | CLINICAL |
| Sites | Metro Hospital, Remote Community Clinic |
| Purpose | Medical applications, clinical endpoints, VoIP |
| Metro subnet | 10.1.11.0/24 |
| Remote Clinic subnet | 10.1.31.0/24 |
| Security requirement | Only approved access to clinical and data centre services |

Clinical VLANs are used by healthcare users who require access to patient-facing systems and internal healthcare applications.

---

## VLAN 20 — Admin

| Item | Details |
|---|---|
| VLAN ID | 20 |
| Name | ADMIN |
| Site | Metro Hospital |
| Purpose | Administrative staff workstations |
| Subnet | 10.1.20.0/24 |
| Gateway | 10.1.20.1 |

The admin VLAN is separated from the clinical VLAN to reduce unnecessary access between clinical and office systems.

---

## VLAN 99 — Data Centre Servers

| Item | Details |
|---|---|
| VLAN ID | 99 |
| Name | DC_SERVERS |
| Site | Data Centre |
| Purpose | Active Directory, DNS, DHCP, and SQL services |
| Subnet | 10.1.99.0/24 |
| HSRP VIP | 10.1.99.1 |
| CSW01 SVI | 10.1.99.2 |
| CSW02 SVI | 10.1.99.3 |

This VLAN contains Windows Server 2022 infrastructure such as AD01 and SQL01.

---

## VLAN 100 — Data Centre SIEM

| Item | Details |
|---|---|
| VLAN ID | 100 |
| Name | DC_SIEM |
| Site | Data Centre |
| Purpose | Monitoring, SIEM, Docker services |
| Subnet | 10.1.100.0/24 |
| HSRP VIP | 10.1.100.1 |
| Monitoring Server | 10.1.100.10 |

This VLAN hosts MON01, an Ubuntu 24.04 Docker server running Wazuh and Splunk.

---

## VLAN 666 — Isolated Security Testing

| Item | Details |
|---|---|
| VLAN ID | 666 |
| Name | ISOLATED |
| Site | Remote Community Clinic |
| Purpose | Kali Linux attack simulation |
| Subnet | 10.1.66.0/24 |
| Gateway | 10.1.66.1 |
| Kali Host | 10.1.66.10 |

This VLAN is used only for controlled security testing. It should not have unrestricted access to clinical, admin, or server networks.

---

## VLAN 999 — Native VLAN

| Item | Details |
|---|---|
| VLAN ID | 999 |
| Name | NATIVE |
| Purpose | Native VLAN for trunk links |
| Security note | Should not be used for user endpoints |

Using a dedicated unused native VLAN helps reduce the risk of accidental traffic leakage on trunk links.

---

## Trunking Design

| Link | Allowed VLANs |
|---|---|
| CSW01 to CSW02 EtherChannel | 99, 100, 999 |
| Metro pfSense to Metro Access Switch | 10, 20, 999 |
| Remote pfSense to Remote Access Switch | 10, 666, 999 |

---

## Access Port Design

| Device | Port Purpose | VLAN |
|---|---|---|
| MET-MedApp1 | Clinical endpoint | 10 |
| MET-VoIP | VoIP endpoint | 10 |
| MET-StaffPC | Admin workstation | 20 |
| RUR-MedApp2 | Remote clinical endpoint | 10 |
| RUR-Kali | Security testing host | 666 |
| TNPH-DC-AD01 | Domain controller | 99 |
| TNPH-DC-SQL01 | SQL server | 99 |
| TNPH-DC-MON01 | Monitoring server | 100 |

---

## Design Notes

- Clinical and admin networks are separated.
- Monitoring services are kept in a dedicated data centre VLAN.
- Security testing is isolated in VLAN 666.
- The native VLAN is not used for endpoint traffic.
- Branch VLAN routing is handled by pfSense.
- Data centre VLAN gateways are provided by CSW01 and CSW02 using HSRP.
