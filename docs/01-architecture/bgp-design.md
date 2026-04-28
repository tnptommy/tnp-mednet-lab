# BGP Design

## Purpose

This document explains the BGP design used in the TNP MedNet enterprise healthcare network lab.

The design uses eBGP between customer edge devices and provider edge devices, plus MP-BGP VPNv4 between provider edge routers.

---

## Autonomous Systems

| AS Number | Organisation | Devices |
|---|---|---|
| 65001 | TNP MedNet Customer Network | CSW01, CSW02, Metro CE, Remote Clinic CE |
| 65002 | Viettel Provider Network | PE-Router-L, P-Router, PE-Router-R |

---

## BGP Design Goals

The BGP design aims to:

1. Separate customer and provider routing.
2. Advertise customer networks through MPLS L3VPN.
3. Use MP-BGP VPNv4 between PE routers.
4. Keep the P router free from BGP.
5. Support future branch expansion.
6. Keep provider loopbacks hidden from customer routers.

---

## VRF Design

| Item | Value |
|---|---|
| VRF Name | TNPH |
| Route Distinguisher | 65002:100 |
| Route Target Export | 65002:100 |
| Route Target Import | 65002:100 |

The VRF separates TNP MedNet customer routes inside the provider network.

---

## CE to PE eBGP Sessions

| Customer Device | Customer IP | Provider Device | Provider IP | Customer AS | Provider AS |
|---|---:|---|---:|---:|---:|
| TNPH-DC-CSW01 | 10.0.4.2 | PE-Router-L | 10.0.4.1 | 65001 | 65002 |
| TNPH-DC-CSW02 | 10.0.5.2 | PE-Router-R | 10.0.5.1 | 65001 | 65002 |
| TNPH-MET-CE01 | 10.0.6.2 | PE-Router-L | 10.0.6.1 | 65001 | 65002 |
| TNPH-RUR-CE01 | 10.0.7.2 | PE-Router-R | 10.0.7.1 | 65001 | 65002 |

---

## MP-BGP VPNv4 Design

| Peer 1 | Peer 2 | Purpose |
|---|---|---|
| PE-Router-L 2.2.2.1 | PE-Router-R 2.2.2.3 | VPNv4 route exchange for VRF TNPH |

PE routers exchange VPNv4 routes using their loopback interfaces. These routes carry customer prefixes between provider edge routers.

---

## Customer Networks Advertised

### Data Centre

| Network | Description |
|---|---|
| 10.1.99.0/24 | Data centre server VLAN |
| 10.1.100.0/24 | Data centre monitoring VLAN |
| 1.1.1.1/32 | CSW01 loopback |
| 1.1.1.2/32 | CSW02 loopback |

### Metro Hospital

| Network | Description |
|---|---|
| 10.1.11.0/24 | Metro clinical VLAN |
| 10.1.20.0/24 | Metro admin VLAN |
| 1.1.1.10/32 | Metro CE loopback |

### Remote Community Clinic

| Network | Description |
|---|---|
| 10.1.31.0/24 | Remote clinical VLAN |
| 10.1.66.0/24 | Isolated security testing VLAN |
| 1.1.1.20/32 | Remote Clinic CE loopback |

---

## Provider Networks Not Advertised to Customer

| Network | Description |
|---|---|
| 2.2.2.1/32 | PE-Router-L loopback |
| 2.2.2.2/32 | P-Router loopback |
| 2.2.2.3/32 | PE-Router-R loopback |

Provider loopbacks are used for OSPF, LDP, and MP-BGP inside the provider core. They should not be visible in the customer routing table.

---

## Expected Verification Commands

On PE routers:

```bash
show ip bgp vpnv4 vrf TNPH summary
show ip route vrf TNPH
```

On CE routers and data centre core switches:

```bash
show ip bgp summary
show ip route bgp
```

---

## Expected Results

| Check | Expected Result |
|---|---|
| CE to PE BGP | Established |
| PE to PE VPNv4 BGP | Established |
| VRF route table | Customer routes visible inside VRF TNPH |
| P router BGP | No BGP configured |
| Customer route table | Customer routes only, no provider loopbacks |

---

## Design Notes

- Customer AS is 65001.
- Provider AS is 65002.
- CE routers do not run MPLS.
- PE routers run VRF-aware eBGP with CE routers.
- PE routers run MP-BGP VPNv4 with each other.
- P router only supports OSPF and MPLS LDP.
