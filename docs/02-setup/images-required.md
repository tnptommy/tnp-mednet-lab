# Images Required

## Purpose

This document lists the virtual images required to build the TNP MedNet lab in EVE-NG.

---

## Network Device Images

| Image | Used For | Required |
|---|---|---|
| Cisco IOSv | ISP router, PE routers, P router, CE routers | Yes |
| Cisco IOSvL2 | Data centre core switches and access switches | Yes |
| Sophos XG / SFOS | Data centre firewall | Yes |
| pfSense CE | Metro and Remote Clinic branch firewalls | Yes |

---

## Server Images

| Image | Used For | Required |
|---|---|---|
| Windows Server 2022 | AD01 and SQL01 | Yes |
| Ubuntu 24.04 | MON01 Docker monitoring server | Yes |

---

## Endpoint Images

| Image | Used For | Required |
|---|---|---|
| Linux Lite | Metro clinical endpoint, VoIP endpoint, admin workstation | Optional but recommended |
| Kali Linux Light | Isolated security testing host | Yes for attack simulation |
| VPCS | Lightweight remote clinic endpoint | Optional |

---

## Image Usage Mapping

| Node | Image |
|---|---|
| VIETTEL-ISP-RTR | Cisco IOSv |
| TNPH-DC-CSW01 | Cisco IOSvL2 |
| TNPH-DC-CSW02 | Cisco IOSvL2 |
| PE-Router-L | Cisco IOSv |
| P-Router | Cisco IOSv |
| PE-Router-R | Cisco IOSv |
| TNPH-MET-CE01 | Cisco IOSv |
| TNPH-RUR-CE01 | Cisco IOSv |
| TNPH-MET-ASW01 | Cisco IOSvL2 |
| TNPH-RUR-ASW01 | Cisco IOSvL2 |
| TNPH-DC-SOPH01 | Sophos XG / SFOS |
| TNPH-MET-PFS01 | pfSense CE |
| TNPH-RUR-PFS01 | pfSense CE |
| TNPH-DC-AD01 | Windows Server 2022 |
| TNPH-DC-SQL01 | Windows Server 2022 |
| TNPH-DC-MON01 | Ubuntu 24.04 |
| MET-MedApp1 | Linux Lite |
| MET-VoIP | Linux Lite + Linphone |
| MET-StaffPC | Linux Lite |
| RUR-MedApp2 | VPCS |
| RUR-Kali | Kali Linux Light |

---

## EVE-NG Image Notes

Image names may differ depending on the file format and EVE-NG installation method.

General EVE-NG image folders are usually stored under:

```bash
/opt/unetlab/addons/qemu/
```

After adding images, fix permissions:

```bash
/opt/unetlab/wrappers/unl_wrapper -a fixpermissions
```

---

## Licensing Note

Only use operating system and network images that you are legally allowed to use for lab, study, or evaluation purposes.
