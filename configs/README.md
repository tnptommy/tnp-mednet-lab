# Device Configuration Files

This folder contains device configuration files for the TNP MedNet enterprise healthcare network lab.

## Current Configured Devices

| Device | File | Status |
|---|---|---|
| VIETTEL-ISP-RTR | `configs/isp/viettel-isp-rtr.txt` | Configured |
| TNPH-DC-CSW01 | `configs/dc/tnph-dc-csw01.txt` | Configured |
| TNPH-DC-CSW02 | `configs/dc/tnph-dc-csw02.txt` | Configured |
| PE-Router-L | `configs/mpls/pe-router-l.txt` | Configured |
| P-Router | `configs/mpls/p-router.txt` | Configured |
| PE-Router-R | `configs/mpls/pe-router-r.txt` | Configured |
| TNPH-MET-CE01 | `configs/metro/tnph-met-ce01.txt` | Configured |
| TNPH-RUR-CE01 | `configs/rural/tnph-rur-ce01.txt` | Configured |

## Pending Configuration Files

| Device / Component | File | Status |
|---|---|---|
| TNPH-DC-SOPH01 | `configs/dc/tnph-dc-soph01-export.xml` | Pending |
| TNPH-MET-PFS01 | `configs/metro/tnph-met-pfs01-export.xml` | Pending |
| TNPH-RUR-PFS01 | `configs/rural/tnph-rur-pfs01-export.xml` | Pending |
| TNPH-MET-ASW01 | `configs/metro/tnph-met-asw01.txt` | Pending |
| TNPH-RUR-ASW01 | `configs/rural/tnph-rur-asw01.txt` | Pending |

## Notes

- The current Cisco device configs use SSH-only management access.
- The project location is Ho Chi Minh City, so device timezone should use `ICT 7 0`.
- Real production credentials should not be committed to a public repository.
- If this repository is public, replace lab passwords with placeholders before publishing.
