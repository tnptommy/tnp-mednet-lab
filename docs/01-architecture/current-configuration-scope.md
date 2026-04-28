# Current Configuration Scope

## Purpose

This document clarifies which devices currently have completed configuration files in the TNP MedNet repository.

The full lab design includes ISP, data centre, MPLS, metro branch, remote clinic, firewalls, servers, monitoring, access switches, and endpoints. However, the current uploaded configuration set only includes the core Cisco routing and switching devices.

## Configured Devices

| Area | Device | Config File | Status |
|---|---|---|---|
| ISP | VIETTEL-ISP-RTR | `configs/isp/viettel-isp-rtr.txt` | Configured |
| Data Centre | TNPH-DC-CSW01 | `configs/dc/tnph-dc-csw01.txt` | Configured |
| Data Centre | TNPH-DC-CSW02 | `configs/dc/tnph-dc-csw02.txt` | Configured |
| MPLS Core | PE-Router-L | `configs/mpls/pe-router-l.txt` | Configured |
| MPLS Core | P-Router | `configs/mpls/p-router.txt` | Configured |
| MPLS Core | PE-Router-R | `configs/mpls/pe-router-r.txt` | Configured |
| Metro Hospital | TNPH-MET-CE01 | `configs/metro/tnph-met-ce01.txt` | Configured |
| Remote Community Clinic | TNPH-RUR-CE01 | `configs/rural/tnph-rur-ce01.txt` | Configured |

## Pending Devices

| Area | Device | Expected File | Status |
|---|---|---|---|
| Data Centre | TNPH-DC-SOPH01 | `configs/dc/tnph-dc-soph01-export.xml` | Pending |
| Metro Hospital | TNPH-MET-PFS01 | `configs/metro/tnph-met-pfs01-export.xml` | Pending |
| Metro Hospital | TNPH-MET-ASW01 | `configs/metro/tnph-met-asw01.txt` | Pending |
| Remote Community Clinic | TNPH-RUR-PFS01 | `configs/rural/tnph-rur-pfs01-export.xml` | Pending |
| Remote Community Clinic | TNPH-RUR-ASW01 | `configs/rural/tnph-rur-asw01.txt` | Pending |
| Data Centre | TNPH-DC-AD01 | Windows Server 2022 setup documentation | Pending |
| Data Centre | TNPH-DC-SQL01 | Windows Server 2022 setup documentation | Pending |
| Data Centre | TNPH-DC-MON01 | Ubuntu 24.04 Docker monitoring documentation | Pending |

## Important Notes

- The full architecture remains multi-site and includes all planned devices.
- The current implemented configuration scope is 8 Cisco devices.
- Sophos, pfSense, access switch, Windows Server, and Ubuntu monitoring configuration files are still pending.
- Device timezone should use `ICT 7 0` for the Ho Chi Minh City-based lab profile.
