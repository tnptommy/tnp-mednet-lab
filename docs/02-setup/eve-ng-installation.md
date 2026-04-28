# EVE-NG Installation Guide

## Purpose

This document provides a high-level installation guide for preparing EVE-NG for the TNP MedNet lab.

---

## Step 1: Install VMware Workstation

Install VMware Workstation Pro on the Windows host machine.

Recommended host machine:

| Component | Recommended |
|---|---|
| RAM | 64 GB |
| CPU | Multi-core CPU |
| Storage | 300 GB or more free |
| OS | Windows |

---

## Step 2: Import EVE-NG

1. Download the EVE-NG virtual machine image.
2. Open VMware Workstation.
3. Import or open the EVE-NG VM.
4. Adjust CPU, memory, and network settings.
5. Start the EVE-NG VM.

---

## Step 3: Recommended EVE-NG VM Settings

| Setting | Recommended Value |
|---|---|
| CPU | 8 vCPU or more |
| RAM | 38 GB or more for full lab |
| Disk | 150 GB or more |
| Network Adapter 1 | NAT |
| Network Adapter 2 | Host-only or bridged management network |

---

## Step 4: Enable Virtualisation Support

Make sure virtualisation is enabled in BIOS/UEFI.

Common names:

- Intel VT-x
- Intel Virtualization Technology
- AMD-V
- SVM Mode

---

## Step 5: Access EVE-NG Web Interface

After EVE-NG boots, note the management IP address shown in the console.

Open a browser:

```text
http://<EVE-NG-IP>
```

Login using the EVE-NG credentials configured during setup.

---

## Step 6: Upload Images

Upload required images into the correct EVE-NG image folders.

Common path:

```bash
/opt/unetlab/addons/qemu/
```

After uploading images, run:

```bash
/opt/unetlab/wrappers/unl_wrapper -a fixpermissions
```

---

## Step 7: Create the TNP MedNet Lab

Create a new EVE-NG lab named:

```text
tnp-mednet-lab
```

Recommended lab sections:

- ISP
- Data Centre
- MPLS Core
- Metro Hospital
- Remote Community Clinic
- Cloud
- Monitoring

---

## Step 8: Add Devices

Add the required devices:

- VIETTEL-ISP-RTR
- TNPH-DC-SOPH01
- TNPH-DC-CSW01
- TNPH-DC-CSW02
- TNPH-DC-AD01
- TNPH-DC-SQL01
- TNPH-DC-MON01
- PE-Router-L
- P-Router
- PE-Router-R
- TNPH-MET-CE01
- TNPH-MET-PFS01
- TNPH-MET-ASW01
- MET-MedApp1
- MET-VoIP
- MET-StaffPC
- TNPH-RUR-CE01
- TNPH-RUR-PFS01
- TNPH-RUR-ASW01
- RUR-MedApp2
- RUR-Kali

---

## Step 9: Connect Devices

Build the topology according to the architecture document.

Recommended build order:

1. ISP and Sophos
2. Sophos and data centre core switches
3. Data centre servers
4. MPLS provider core
5. CE to PE links
6. Metro branch
7. Remote clinic branch
8. Monitoring server
9. Endpoints

---

## Step 10: Save and Export

After building the topology:

1. Save the lab.
2. Export the `.unl` file.
3. Store the export under:

```text
topology/tnp-mednet-lab.unl
```

Keep a backup copy:

```text
topology/tnp-mednet-lab-backup.unl
```

---

## Troubleshooting Tips

| Issue | Suggested Check |
|---|---|
| EVE-NG not reachable | Check VMware network adapter and EVE-NG IP |
| Device does not boot | Check image folder and permissions |
| Console does not open | Check browser and EVE-NG console settings |
| Router has no interface | Check image type and node template |
| Slow lab performance | Reduce running nodes or increase RAM |
