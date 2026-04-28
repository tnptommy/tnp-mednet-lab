# Lab Import Guide

## Purpose

This document explains how to import or restore the TNP MedNet EVE-NG lab topology.

---

## Import Sources

The lab topology files are stored in:

```text
topology/
├── tnp-mednet-lab.unl
└── tnp-mednet-lab-backup.unl
```

---

## Step 1: Access EVE-NG

Open the EVE-NG web interface:

```text
http://<EVE-NG-IP>
```

Login with your EVE-NG account.

---

## Step 2: Upload the Lab File

Upload the `.unl` file into the EVE-NG lab folder.

Typical EVE-NG lab path:

```bash
/opt/unetlab/labs/
```

Example:

```bash
scp topology/tnp-mednet-lab.unl root@<EVE-NG-IP>:/opt/unetlab/labs/
```

---

## Step 3: Fix Permissions

After uploading the lab file, SSH into EVE-NG and run:

```bash
/opt/unetlab/wrappers/unl_wrapper -a fixpermissions
```

---

## Step 4: Confirm Required Images

Before starting the lab, confirm that all required images exist in EVE-NG.

Common image folder:

```bash
/opt/unetlab/addons/qemu/
```

Required image categories:

- Cisco IOSv
- Cisco IOSvL2
- Sophos XG / SFOS
- pfSense CE
- Windows Server 2022
- Ubuntu 24.04
- Linux Lite
- Kali Linux Light
- VPCS

---

## Step 5: Open the Lab

In the EVE-NG web interface:

1. Go to the lab list.
2. Open `tnp-mednet-lab`.
3. Confirm all nodes appear.
4. Confirm all links appear.
5. Start devices in stages.

---

## Recommended Start Order

Start the lab in this order to reduce boot and troubleshooting issues:

1. Provider core routers:
   - PE-Router-L
   - P-Router
   - PE-Router-R

2. Data centre network:
   - TNPH-DC-CSW01
   - TNPH-DC-CSW02
   - TNPH-DC-SOPH01
   - VIETTEL-ISP-RTR

3. Branch routers:
   - TNPH-MET-CE01
   - TNPH-RUR-CE01

4. Branch firewalls and switches:
   - TNPH-MET-PFS01
   - TNPH-MET-ASW01
   - TNPH-RUR-PFS01
   - TNPH-RUR-ASW01

5. Servers:
   - TNPH-DC-AD01
   - TNPH-DC-SQL01
   - TNPH-DC-MON01

6. Endpoints:
   - MET-MedApp1
   - MET-VoIP
   - MET-StaffPC
   - RUR-MedApp2
   - RUR-Kali

---

## Step 6: Validate Basic Connectivity

After importing and starting the lab, validate:

```bash
show ip interface brief
show ip route
show ip bgp summary
show mpls ldp neighbor
show standby brief
```

---

## Step 7: Save Changes

After confirming the lab works:

1. Save router and switch configs.
2. Export updated configs into the `configs/` folder.
3. Commit changes to GitHub.

Example:

```bash
git add topology/ configs/
git commit -m "Update EVE-NG topology and device configs"
git push
```

---

## Common Import Issues

| Issue | Cause | Fix |
|---|---|---|
| Nodes missing | Image names do not match | Rename image folders or update node templates |
| Lab does not open | Incorrect permissions | Run EVE-NG fixpermissions |
| Devices boot slowly | Host RAM pressure | Start devices in smaller groups |
| Interfaces mismatch | Different image template | Check node interface mapping |
| Console issue | Browser or console setting | Use HTML5 console or native console |
