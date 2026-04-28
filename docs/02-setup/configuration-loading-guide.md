# Configuration Loading Guide

## Purpose

This guide explains how to load the completed Cisco device configurations into the **TNP MedNet — Enterprise Healthcare Network Lab** in EVE-NG.

The current configuration set covers the core routing and switching foundation of the lab, including the ISP router, data centre core switches, MPLS provider routers, and customer edge routers.

The full lab design includes firewalls, access switches, Windows servers, Ubuntu monitoring, and endpoints. However, those components are not included in the current completed configuration set yet.

---

## Current Configuration Scope

The current uploaded configuration package includes **8 configured Cisco devices**.

| No. | Device | Role | Config File | Status |
|---:|---|---|---|---|
| 1 | VIETTEL-ISP-RTR | ISP edge router and NAT router | `configs/isp/viettel-isp-rtr.txt` | Configured |
| 2 | TNPH-DC-CSW01 | Data centre core switch, HSRP active, CE primary | `configs/dc/tnph-dc-csw01.txt` | Configured |
| 3 | TNPH-DC-CSW02 | Data centre core switch, HSRP standby, CE backup | `configs/dc/tnph-dc-csw02.txt` | Configured |
| 4 | PE-Router-L | MPLS provider edge router, left side | `configs/mpls/pe-router-l.txt` | Configured |
| 5 | P-Router | MPLS provider core router | `configs/mpls/p-router.txt` | Configured |
| 6 | PE-Router-R | MPLS provider edge router, right side | `configs/mpls/pe-router-r.txt` | Configured |
| 7 | TNPH-MET-CE01 | Metro Hospital customer edge router | `configs/metro/tnph-met-ce01.txt` | Configured |
| 8 | TNPH-RUR-CE01 | Remote Community Clinic customer edge router | `configs/rural/tnph-rur-ce01.txt` | Configured |

---

## Pending Configuration Scope

The following components are part of the full lab design but are not fully configured in the current device configuration package.

| Area | Device / Component | Expected File | Status |
|---|---|---|---|
| Data Centre | TNPH-DC-SOPH01 | `configs/dc/tnph-dc-soph01-export.xml` | Pending |
| Metro Hospital | TNPH-MET-PFS01 | `configs/metro/tnph-met-pfs01-export.xml` | Pending |
| Metro Hospital | TNPH-MET-ASW01 | `configs/metro/tnph-met-asw01.txt` | Pending |
| Remote Community Clinic | TNPH-RUR-PFS01 | `configs/rural/tnph-rur-pfs01-export.xml` | Pending |
| Remote Community Clinic | TNPH-RUR-ASW01 | `configs/rural/tnph-rur-asw01.txt` | Pending |
| Data Centre | TNPH-DC-AD01 | Windows Server 2022 setup documentation | Pending |
| Data Centre | TNPH-DC-SQL01 | Windows Server 2022 setup documentation | Pending |
| Data Centre | TNPH-DC-MON01 | Ubuntu 24.04 Docker monitoring documentation | Pending |
| Metro Hospital | MET-MedApp1 | Endpoint setup documentation | Pending |
| Metro Hospital | MET-VoIP | Endpoint setup documentation | Pending |
| Metro Hospital | MET-StaffPC | Endpoint setup documentation | Pending |
| Remote Community Clinic | RUR-MedApp2 | Endpoint setup documentation | Pending |
| Remote Community Clinic | RUR-Kali | Kali testing documentation | Pending |

---

## Recommended Loading Order

The recommended loading order is designed to bring up the MPLS provider core first, then the customer edge and data centre routing.

| Step | Device | Reason |
|---:|---|---|
| 1 | P-Router | Core MPLS label-switching router should be prepared first |
| 2 | PE-Router-L | Left provider edge router connects to Metro and DC primary |
| 3 | PE-Router-R | Right provider edge router connects to Remote Clinic and DC backup |
| 4 | TNPH-DC-CSW01 | Primary data centre CE and HSRP active switch |
| 5 | TNPH-DC-CSW02 | Backup data centre CE and HSRP standby switch |
| 6 | TNPH-MET-CE01 | Metro Hospital CE router |
| 7 | TNPH-RUR-CE01 | Remote Community Clinic CE router |
| 8 | VIETTEL-ISP-RTR | ISP/NAT router for internet-facing path |

This order makes it easier to verify OSPF, LDP, MPLS, MP-BGP, and CE-to-PE BGP in stages.

---

## Pre-Loading Checklist

Before loading configurations, confirm the following:

| Check | Requirement |
|---|---|
| EVE-NG topology exists | The lab topology should be created or imported |
| Device names match | Device names should match the config file names |
| Interfaces match | EVE-NG interfaces should match the interface numbers used in the configs |
| Cisco images are working | IOSv and IOSvL2 nodes should boot correctly |
| Console access works | You should be able to open device consoles |
| Config files exist | Configs should be available under the `configs/` folder |
| Lab passwords are reviewed | Do not publish real passwords in public repositories |

---

## Configuration File Locations

```text
configs/
├── isp/
│   └── viettel-isp-rtr.txt
│
├── dc/
│   ├── tnph-dc-csw01.txt
│   ├── tnph-dc-csw02.txt
│   └── tnph-dc-soph01-export.xml
│
├── mpls/
│   ├── pe-router-l.txt
│   ├── p-router.txt
│   └── pe-router-r.txt
│
├── metro/
│   ├── tnph-met-ce01.txt
│   ├── tnph-met-asw01.txt
│   └── tnph-met-pfs01-export.xml
│
└── rural/
    ├── tnph-rur-ce01.txt
    ├── tnph-rur-asw01.txt
    └── tnph-rur-pfs01-export.xml
```

Only the following files currently contain completed Cisco configurations:

```text
configs/isp/viettel-isp-rtr.txt
configs/dc/tnph-dc-csw01.txt
configs/dc/tnph-dc-csw02.txt
configs/mpls/pe-router-l.txt
configs/mpls/p-router.txt
configs/mpls/pe-router-r.txt
configs/metro/tnph-met-ce01.txt
configs/rural/tnph-rur-ce01.txt
```

---

## Manual Loading Method

Open each device console in EVE-NG and paste the matching configuration file.

For each device:

1. Open the device console.
2. Enter privileged mode if required.
3. Paste the full configuration.
4. Wait until the configuration finishes.
5. Confirm the configuration is saved.
6. Run verification commands.

Most config files already include:

```bash
configure terminal
...
end
write memory
```

If a device does not save automatically, run:

```bash
write memory
```

or:

```bash
copy running-config startup-config
```

---

## Device 1: VIETTEL-ISP-RTR

### Role

The **VIETTEL-ISP-RTR** acts as the ISP edge router. It provides internet-facing connectivity through VMware NAT and performs NAT/PAT for lab traffic.

### Config File

```text
configs/isp/viettel-isp-rtr.txt
```

### Key Interfaces

| Interface | IP Address | Purpose |
|---|---|---|
| Gi0/0 | 192.168.195.10/24 | Link to VMware NAT internet |
| Gi0/1 | 203.0.113.1/30 | Link to Sophos WAN |
| Loopback0 | 1.1.1.100/32 | Router ID and management |

### Verification Commands

```bash
show ip interface brief
show ip route
show ip nat translations
show access-lists
ping 192.168.195.2
ping 8.8.8.8
```

### Expected Results

| Check | Expected Result |
|---|---|
| Gi0/0 | Up/up |
| Gi0/1 | Up/up |
| Default route | Points to 192.168.195.2 |
| NAT | PAT configured through Gi0/0 |
| Internet test | Ping to VMware NAT gateway should work |

---

## Device 2: TNPH-DC-CSW01

### Role

**TNPH-DC-CSW01** is the primary data centre core switch. It acts as the HSRP active gateway for VLAN 99 and VLAN 100 and also peers with PE-Router-L using eBGP.

### Config File

```text
configs/dc/tnph-dc-csw01.txt
```

### Key Interfaces

| Interface | IP Address / VLAN | Purpose |
|---|---|---|
| Loopback0 | 1.1.1.1/32 | Router ID |
| Gi0/0 | 10.1.1.2/30 | Link to Sophos PortC |
| Gi0/1 | Trunk | EtherChannel link to CSW02 |
| Gi0/2 | Trunk | EtherChannel link to CSW02 |
| Gi0/3 | 10.0.4.2/30 | eBGP link to PE-Router-L |
| Gi1/1 | VLAN 99 | AD01 |
| Gi1/2 | VLAN 99 | SQL01 |
| Gi1/3 | VLAN 100 | MON01 |
| VLAN99 | 10.1.99.2/24 | Server VLAN SVI |
| VLAN100 | 10.1.100.2/24 | Monitoring VLAN SVI |

### Verification Commands

```bash
show ip interface brief
show vlan brief
show etherchannel summary
show spanning-tree vlan 99
show spanning-tree vlan 100
show standby brief
show ip bgp summary
show ip route bgp
ping 10.0.4.1
ping 1.1.1.2 source 1.1.1.1
ping 1.1.1.10 source 1.1.1.1
ping 1.1.1.20 source 1.1.1.1
```

### Expected Results

| Check | Expected Result |
|---|---|
| VLAN 99 | Created and active |
| VLAN 100 | Created and active |
| Port-channel1 | Up |
| HSRP VLAN 99 | Active |
| HSRP VLAN 100 | Active |
| BGP to PE-Router-L | Established |
| STP | Root bridge for VLAN 99 and VLAN 100 |

---

## Device 3: TNPH-DC-CSW02

### Role

**TNPH-DC-CSW02** is the secondary data centre core switch. It acts as the HSRP standby gateway for VLAN 99 and VLAN 100 and peers with PE-Router-R using eBGP.

### Config File

```text
configs/dc/tnph-dc-csw02.txt
```

### Key Interfaces

| Interface | IP Address / VLAN | Purpose |
|---|---|---|
| Loopback0 | 1.1.1.2/32 | Router ID |
| Gi0/0 | 10.1.1.6/30 | Link to Sophos PortD |
| Gi0/1 | Trunk | EtherChannel link to CSW01 |
| Gi0/2 | Trunk | EtherChannel link to CSW01 |
| Gi0/3 | 10.0.5.2/30 | eBGP link to PE-Router-R |
| Gi1/1 | VLAN 99 | AD01 backup link |
| Gi1/2 | VLAN 99 | SQL01 backup link |
| Gi1/3 | VLAN 100 | MON01 backup link |
| VLAN99 | 10.1.99.3/24 | Server VLAN SVI |
| VLAN100 | 10.1.100.3/24 | Monitoring VLAN SVI |

### Verification Commands

```bash
show ip interface brief
show vlan brief
show etherchannel summary
show spanning-tree vlan 99
show spanning-tree vlan 100
show standby brief
show ip bgp summary
show ip route bgp
ping 10.0.5.1
ping 1.1.1.1 source 1.1.1.2
ping 1.1.1.10 source 1.1.1.2
ping 1.1.1.20 source 1.1.1.2
```

### Expected Results

| Check | Expected Result |
|---|---|
| VLAN 99 | Created and active |
| VLAN 100 | Created and active |
| Port-channel1 | Up |
| HSRP VLAN 99 | Standby |
| HSRP VLAN 100 | Standby |
| BGP to PE-Router-R | Established |
| STP | Secondary root for VLAN 99 and VLAN 100 |

---

## Device 4: PE-Router-L

### Role

**PE-Router-L** is the left provider edge router in the Viettel MPLS provider network. It connects to the Metro Hospital CE router and the primary data centre CE switch.

### Config File

```text
configs/mpls/pe-router-l.txt
```

### Key Interfaces

| Interface | IP Address | Purpose |
|---|---|---|
| Loopback0 | 2.2.2.1/32 | OSPF router ID, LDP ID, MP-BGP update source |
| Gi0/0 | 10.0.6.1/30 | VRF TNPH link to Metro CE |
| Gi0/1 | 10.0.10.1/30 | MPLS LDP link to P-Router |
| Gi0/3 | 10.0.4.1/30 | VRF TNPH link to CSW01 |

### Verification Commands

```bash
show ip interface brief
show ip ospf neighbor
show mpls ldp neighbor
show mpls forwarding-table
show ip vrf
show ip vrf interfaces
show ip route vrf TNPH
show ip bgp summary
show ip bgp vpnv4 vrf TNPH summary
ping 2.2.2.2
ping 2.2.2.3
ping vrf TNPH 10.0.4.2 source 10.0.4.1
ping vrf TNPH 10.0.6.2 source 10.0.6.1
```

### Expected Results

| Check | Expected Result |
|---|---|
| OSPF neighbour | P-Router should be FULL |
| LDP neighbour | P-Router should be discovered |
| VPNv4 BGP | Established with PE-Router-R |
| VRF TNPH | Gi0/0 and Gi0/3 assigned to VRF |
| eBGP VRF | CSW01 and Metro CE should establish |
| MPLS forwarding table | Labels installed |

---

## Device 5: P-Router

### Role

**P-Router** is the provider core router. It only runs OSPF and MPLS LDP. It does not run BGP and does not contain customer VRFs.

### Config File

```text
configs/mpls/p-router.txt
```

### Key Interfaces

| Interface | IP Address | Purpose |
|---|---|---|
| Loopback0 | 2.2.2.2/32 | OSPF router ID and LDP ID |
| Gi0/1 | 10.0.10.2/30 | MPLS LDP link to PE-Router-L |
| Gi0/2 | 10.0.11.1/30 | MPLS LDP link to PE-Router-R |

### Verification Commands

```bash
show ip interface brief
show ip ospf neighbor
show mpls ldp neighbor
show mpls forwarding-table
show ip route
ping 2.2.2.1
ping 2.2.2.3
show running-config | section router bgp
```

### Expected Results

| Check | Expected Result |
|---|---|
| OSPF neighbours | PE-Router-L and PE-Router-R should be FULL |
| LDP neighbours | PE-Router-L and PE-Router-R should be discovered |
| MPLS forwarding table | Labels installed |
| BGP config | No BGP should be configured |
| Customer routes | Customer routes should not appear in global routing table |

---

## Device 6: PE-Router-R

### Role

**PE-Router-R** is the right provider edge router in the Viettel MPLS provider network. It connects to the Remote Community Clinic CE router and the backup data centre CE switch.

### Config File

```text
configs/mpls/pe-router-r.txt
```

### Key Interfaces

| Interface | IP Address | Purpose |
|---|---|---|
| Loopback0 | 2.2.2.3/32 | OSPF router ID, LDP ID, MP-BGP update source |
| Gi0/0 | 10.0.7.1/30 | VRF TNPH link to Remote Clinic CE |
| Gi0/2 | 10.0.11.2/30 | MPLS LDP link to P-Router |
| Gi0/3 | 10.0.5.1/30 | VRF TNPH link to CSW02 |

### Verification Commands

```bash
show ip interface brief
show ip ospf neighbor
show mpls ldp neighbor
show mpls forwarding-table
show ip vrf
show ip vrf interfaces
show ip route vrf TNPH
show ip bgp summary
show ip bgp vpnv4 vrf TNPH summary
ping 2.2.2.1
ping 2.2.2.2
ping vrf TNPH 10.0.5.2 source 10.0.5.1
ping vrf TNPH 10.0.7.2 source 10.0.7.1
```

### Expected Results

| Check | Expected Result |
|---|---|
| OSPF neighbour | P-Router should be FULL |
| LDP neighbour | P-Router should be discovered |
| VPNv4 BGP | Established with PE-Router-L |
| VRF TNPH | Gi0/0 and Gi0/3 assigned to VRF |
| eBGP VRF | CSW02 and Remote Clinic CE should establish |
| MPLS forwarding table | Labels installed |

---

## Device 7: TNPH-MET-CE01

### Role

**TNPH-MET-CE01** is the Metro Hospital customer edge router. It connects the Metro site to the MPLS provider through PE-Router-L.

### Config File

```text
configs/metro/tnph-met-ce01.txt
```

### Key Interfaces

| Interface | IP Address | Purpose |
|---|---|---|
| Loopback0 | 1.1.1.10/32 | Router ID |
| Gi0/0 | 10.0.6.2/30 | eBGP link to PE-Router-L |
| Gi0/1 | 10.1.10.1/30 | Link to Metro pfSense |

### Advertised Networks

| Network | Purpose |
|---|---|
| 10.1.11.0/24 | Metro clinical VLAN |
| 10.1.20.0/24 | Metro admin VLAN |
| 1.1.1.10/32 | Metro CE loopback |

### Verification Commands

```bash
show ip interface brief
show ip route
show ip route bgp
show ip bgp summary
ping 10.0.6.1
ping 1.1.1.1 source 1.1.1.10
ping 1.1.1.2 source 1.1.1.10
ping 1.1.1.20 source 1.1.1.10
```

### Expected Results

| Check | Expected Result |
|---|---|
| BGP to PE-Router-L | Established |
| Routes to DC | Learned through BGP |
| Routes to Remote Clinic | Learned through BGP |
| Static routes to Metro VLANs | Point to Metro pfSense |
| Ping to DC loopbacks | Successful after MPLS/BGP is working |

---

## Device 8: TNPH-RUR-CE01

### Role

**TNPH-RUR-CE01** is the Remote Community Clinic customer edge router. It connects the remote clinic to the MPLS provider through PE-Router-R.

### Config File

```text
configs/rural/tnph-rur-ce01.txt
```

### Key Interfaces

| Interface | IP Address | Purpose |
|---|---|---|
| Loopback0 | 1.1.1.20/32 | Router ID |
| Gi0/0 | 10.0.7.2/30 | eBGP link to PE-Router-R |
| Gi0/1 | 10.1.30.1/30 | Link to Remote Clinic pfSense |

### Advertised Networks

| Network | Purpose |
|---|---|
| 10.1.31.0/24 | Remote Clinic clinical VLAN |
| 10.1.66.0/24 | Remote Clinic isolated VLAN |
| 1.1.1.20/32 | Remote Clinic CE loopback |

### Verification Commands

```bash
show ip interface brief
show ip route
show ip route bgp
show ip bgp summary
ping 10.0.7.1
ping 1.1.1.1 source 1.1.1.20
ping 1.1.1.2 source 1.1.1.20
ping 1.1.1.10 source 1.1.1.20
```

### Expected Results

| Check | Expected Result |
|---|---|
| BGP to PE-Router-R | Established |
| Routes to DC | Learned through BGP |
| Routes to Metro | Learned through BGP |
| Static routes to Remote Clinic VLANs | Point to Remote Clinic pfSense |
| Ping to DC and Metro loopbacks | Successful after MPLS/BGP is working |

---

## End-to-End Verification Plan

After all 8 device configs are loaded, verify the lab in this order.

### Step 1: Check Interface Status

Run on every Cisco device:

```bash
show ip interface brief
```

Expected result:

```text
All used interfaces should be up/up.
Unused interfaces should be administratively down.
```

---

### Step 2: Check Provider Core OSPF

Run on PE-Router-L, P-Router, and PE-Router-R:

```bash
show ip ospf neighbor
```

Expected result:

```text
PE-Router-L should see P-Router as FULL.
P-Router should see PE-Router-L and PE-Router-R as FULL.
PE-Router-R should see P-Router as FULL.
```

---

### Step 3: Check MPLS LDP

Run on PE-Router-L, P-Router, and PE-Router-R:

```bash
show mpls ldp neighbor
```

Expected result:

```text
PE-Router-L should have an LDP neighbour with P-Router.
P-Router should have LDP neighbours with both PE routers.
PE-Router-R should have an LDP neighbour with P-Router.
```

---

### Step 4: Check MPLS Forwarding Table

Run on PE-Router-L, P-Router, and PE-Router-R:

```bash
show mpls forwarding-table
```

Expected result:

```text
MPLS labels should be installed for provider loopbacks.
```

If the MPLS forwarding table is empty, run this on MPLS routers:

```bash
configure terminal
mpls ldp router-id Loopback0 force
end
write memory
clear mpls ldp neighbor *
```

---

### Step 5: Check PE-to-PE MP-BGP VPNv4

Run on PE-Router-L and PE-Router-R:

```bash
show ip bgp vpnv4 vrf TNPH summary
```

Expected result:

```text
PE-Router-L and PE-Router-R should show VPNv4 BGP as Established.
```

---

### Step 6: Check CE-to-PE eBGP

Run on CSW01, CSW02, Metro CE, and Remote Clinic CE:

```bash
show ip bgp summary
```

Expected result:

```text
CSW01 should peer with PE-Router-L.
CSW02 should peer with PE-Router-R.
TNPH-MET-CE01 should peer with PE-Router-L.
TNPH-RUR-CE01 should peer with PE-Router-R.
All sessions should be Established.
```

---

### Step 7: Check VRF Routes on PE Routers

Run on PE-Router-L and PE-Router-R:

```bash
show ip route vrf TNPH
```

Expected result:

```text
VRF TNPH should contain customer routes from the data centre, metro site, and remote clinic.
```

Expected customer networks:

```text
10.1.99.0/24
10.1.100.0/24
10.1.11.0/24
10.1.20.0/24
10.1.31.0/24
10.1.66.0/24
1.1.1.1/32
1.1.1.2/32
1.1.1.10/32
1.1.1.20/32
```

---

### Step 8: Check HSRP

Run on CSW01 and CSW02:

```bash
show standby brief
```

Expected result:

```text
CSW01 should be Active for VLAN 99 and VLAN 100.
CSW02 should be Standby for VLAN 99 and VLAN 100.
```

---

### Step 9: Check EtherChannel

Run on CSW01 and CSW02:

```bash
show etherchannel summary
```

Expected result:

```text
Port-channel1 should be up.
Gi0/1 and Gi0/2 should be bundled in the port-channel.
```

---

### Step 10: Check End-to-End Loopback Reachability

From CSW01:

```bash
ping 1.1.1.2 source 1.1.1.1
ping 1.1.1.10 source 1.1.1.1
ping 1.1.1.20 source 1.1.1.1
```

From Metro CE:

```bash
ping 1.1.1.1 source 1.1.1.10
ping 1.1.1.2 source 1.1.1.10
ping 1.1.1.20 source 1.1.1.10
```

From Remote Clinic CE:

```bash
ping 1.1.1.1 source 1.1.1.20
ping 1.1.1.2 source 1.1.1.20
ping 1.1.1.10 source 1.1.1.20
```

Expected result:

```text
All customer loopback-to-loopback tests should succeed after MPLS L3VPN and BGP are working.
```

---

## Important Isolation Test

The customer network should not see provider loopbacks.

From CSW01, this test is expected to fail:

```bash
ping 2.2.2.1 source 1.1.1.1
```

Expected result:

```text
Fail
```

This is correct because provider loopbacks are not advertised to the customer network.

---

## HCMC Timezone Correction

The lab profile is based in **Ho Chi Minh City, Vietnam**. Cisco configs should use ICT timezone.

Correct timezone command:

```bash
clock timezone ICT 7 0
```

If a config still contains AEST, replace it before committing to GitHub:

```bash
grep -RIl "clock timezone AEST 10 0" configs 2>/dev/null | xargs -r sed -i 's/clock timezone AEST 10 0/clock timezone ICT 7 0/g'
```

Then verify:

```bash
grep -R "clock timezone" configs
```

Expected result:

```text
clock timezone ICT 7 0
```

---

## Security Note

The uploaded device configs contain lab credentials. Before making this repository public, replace sensitive values with placeholders.

Recommended placeholder format:

```text
<LAB_PASSWORD>
<ENABLE_SECRET>
<ADMIN_USERNAME>
```

Do not publish:

- Real passwords
- Private SSH keys
- Production firewall exports
- Real patient data
- Sensitive logs
- Personal information

---

## Troubleshooting

### BGP Session Not Established

Check:

```bash
show ip interface brief
show ip bgp summary
ping <neighbour-ip>
show running-config | section router bgp
```

Common causes:

| Cause | Fix |
|---|---|
| Interface is down | Check EVE-NG link and `no shutdown` |
| Wrong neighbour IP | Confirm /30 addressing |
| Wrong AS number | Confirm customer AS 65001 and provider AS 65002 |
| Password mismatch | Confirm BGP password on both peers |
| VRF mismatch | On PE routers, confirm CE-facing interfaces are in VRF TNPH |

---

### MPLS LDP Not Working

Check:

```bash
show ip ospf neighbor
show mpls ldp neighbor
show mpls forwarding-table
```

Common causes:

| Cause | Fix |
|---|---|
| OSPF not FULL | Check provider core interfaces and OSPF networks |
| LDP router ID issue | Use Loopback0 as LDP router ID |
| MPLS not enabled | Confirm `mpls ip` on provider core links |
| Interface down | Check EVE-NG links and interface status |

---

### HSRP Not Working

Check:

```bash
show standby brief
show vlan brief
show ip interface brief
show etherchannel summary
```

Common causes:

| Cause | Fix |
|---|---|
| VLAN missing | Create VLAN 99 and VLAN 100 |
| SVI down | Confirm active access/trunk ports in the VLAN |
| EtherChannel down | Check trunk and channel-group configuration |
| Priority wrong | CSW01 should have higher priority than CSW02 |

---

### EtherChannel Not Up

Check:

```bash
show etherchannel summary
show interfaces trunk
show running-config interface gi0/1
show running-config interface gi0/2
```

Common causes:

| Cause | Fix |
|---|---|
| Trunk mismatch | Match trunk mode and allowed VLANs |
| Native VLAN mismatch | Use VLAN 999 as native VLAN |
| LACP mismatch | Use `channel-group 1 mode active` on both sides |
| Interface shutdown | Apply `no shutdown` |

---

### Provider Loopback Ping Fails from Customer

This can be expected.

Customer devices should not be able to reach provider loopbacks such as:

```text
2.2.2.1
2.2.2.2
2.2.2.3
```

This follows the BGP-free core and provider isolation design.

---

## Final Validation Checklist

| Check | Expected Result | Status |
|---|---|---|
| ISP interfaces are up | Gi0/0 and Gi0/1 up/up | Pending |
| CSW01 HSRP | Active for VLAN 99 and VLAN 100 | Pending |
| CSW02 HSRP | Standby for VLAN 99 and VLAN 100 | Pending |
| CSW EtherChannel | Port-channel1 up | Pending |
| PE-L to P OSPF | FULL | Pending |
| P to PE-R OSPF | FULL | Pending |
| PE-L to P LDP | Established | Pending |
| P to PE-R LDP | Established | Pending |
| PE-L to PE-R VPNv4 | Established | Pending |
| CSW01 to PE-L BGP | Established | Pending |
| CSW02 to PE-R BGP | Established | Pending |
| Metro CE to PE-L BGP | Established | Pending |
| Remote CE to PE-R BGP | Established | Pending |
| Customer loopback pings | Successful | Pending |
| Provider loopback isolation | Customer-to-provider loopback ping fails | Pending |

---

## Commit Changes

After updating or loading configurations, commit the documentation and config files.

```bash
git add configs docs/02-setup/configuration-loading-guide.md
git commit -m "Add configuration loading guide"
git pull origin main --rebase
git push
```
