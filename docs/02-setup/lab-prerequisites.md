# Lab Prerequisites

## Purpose

This document lists the hardware, software, and knowledge requirements needed to build the TNP MedNet lab.

---

## Host Machine Requirements

| Component | Recommended Requirement |
|---|---|
| CPU | Modern multi-core CPU with virtualisation support |
| RAM | 64 GB recommended |
| Storage | 300 GB or more free space |
| Host OS | Windows |
| Virtualisation Platform | VMware Workstation Pro |
| Network | Internet access for downloads and updates |

---

## Virtualisation Requirements

The lab is designed to run EVE-NG inside VMware Workstation.

Required:

- VMware Workstation Pro
- EVE-NG Community or Professional
- Hardware virtualisation enabled in BIOS/UEFI
- Sufficient RAM allocated to EVE-NG
- NAT network for internet access
- Optional host-only network for management

---

## Recommended EVE-NG VM Settings

| Setting | Recommended Value |
|---|---|
| vCPU | 8 or more |
| RAM | 38 GB or more for full lab |
| Disk | 150 GB or more |
| Network Adapter 1 | NAT |
| Network Adapter 2 | Host-only or bridged management network |
| Nested virtualisation | Enabled if required |

---

## Required Operating System Images

| Image | Purpose |
|---|---|
| Cisco IOSv | Routers |
| Cisco IOSvL2 | Layer 2 and Layer 3 switches |
| Sophos XG / SFOS | Data centre firewall |
| pfSense CE | Branch firewall |
| Windows Server 2022 | AD01 and SQL01 |
| Ubuntu 24.04 | MON01 Docker monitoring server |
| Linux Lite | Metro endpoints |
| Kali Linux Light | Security testing |
| VPCS | Lightweight endpoint testing |

---

## Required Skills

Basic understanding is recommended in the following areas:

- Cisco CLI
- IP addressing and subnetting
- VLANs and trunking
- OSPF
- BGP
- MPLS concepts
- Windows Server basics
- Linux basics
- Docker basics
- Git and GitHub

---

## Repository Requirements

Before starting the lab, clone or create the repository:

```bash
git clone git@github.com:tnptommy/tnp-mednet-lab.git
cd tnp-mednet-lab
```

If the repository already exists locally:

```bash
cd ~/Documents/TechnicalProject/tnp-mednet-lab
git pull origin main
```

---

## Recommended Folder Preparation

The repository should contain these main folders:

```text
ba/
configs/
monitoring/
docs/
scripts/
topology/
diagrams/
images/
```

---

## Security Reminder

Do not commit real credentials, private SSH keys, production firewall exports, or sensitive data to GitHub.

Use placeholders for passwords and secrets.
