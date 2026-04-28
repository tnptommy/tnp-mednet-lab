# MPLS Design

## Purpose

This document explains the MPLS design used in the TNP MedNet enterprise healthcare network lab.

The MPLS core provides private WAN connectivity between the data centre, metro hospital, and remote community clinic.

---

## MPLS Design Summary

The MPLS provider core uses three routers:

```text
PE-Router-L ---- P-Router ---- PE-Router-R
```

| Device | Role |
|---|---|
| PE-Router-L | Provider edge router for Data Centre primary and Metro Hospital |
| P-Router | Provider core router for label switching |
| PE-Router-R | Provider edge router for Data Centre backup and Remote Community Clinic |

---

## Protocol Stack

| Device Type | Protocols |
|---|---|
| PE Router | OSPF, MPLS LDP, MP-BGP VPNv4, VRF-aware eBGP |
| P Router | OSPF and MPLS LDP only |
| CE Router | eBGP only |

---

## OSPF Design

| Item | Value |
|---|---|
| OSPF Area | Area 0 |
| Participants | PE-Router-L, P-Router, PE-Router-R |
| Advertised networks | Provider loopbacks and provider point-to-point links |

OSPF is used only inside the provider core. It provides reachability between PE and P router loopbacks.

---

## LDP Design

| Device | LDP Router ID |
|---|---|
| PE-Router-L | 2.2.2.1 |
| P-Router | 2.2.2.2 |
| PE-Router-R | 2.2.2.3 |

LDP is enabled on provider-facing links only.

---

## MPLS Core Links

| Link | Network |
|---|---|
| PE-Router-L to P-Router | 10.0.10.0/30 |
| P-Router to PE-Router-R | 10.0.11.0/30 |

---

## CE to PE Links

| Link | Network | MPLS Enabled |
|---|---|---|
| CSW01 to PE-Router-L | 10.0.4.0/30 | No |
| CSW02 to PE-Router-R | 10.0.5.0/30 | No |
| Metro CE to PE-Router-L | 10.0.6.0/30 | No |
| Remote Clinic CE to PE-Router-R | 10.0.7.0/30 | No |

CE to PE links use eBGP. MPLS is not enabled on customer-facing links.

---

## BGP-Free Core

The P router does not run BGP and does not have customer VRFs.

This is an important service provider design concept. The P router only forwards labelled packets. It does not need to know customer networks such as:

- 10.1.99.0/24
- 10.1.100.0/24
- 10.1.11.0/24
- 10.1.20.0/24
- 10.1.31.0/24
- 10.1.66.0/24

---

## Packet Flow Example

Example: Metro clinical endpoint accessing a data centre server.

```text
MET-MedApp1
    |
Metro Access Switch
    |
Metro pfSense
    |
TNPH-MET-CE01
    |
PE-Router-L
    |
P-Router
    |
PE-Router-R or PE-Router-L depending on route
    |
Data Centre Core
    |
Windows Server 2022 Service
```

At the MPLS layer:

1. CE router sends traffic to the PE router.
2. PE router performs VRF lookup.
3. PE router pushes an inner VPN label and an outer LDP transport label.
4. P router swaps the outer label.
5. Egress PE router removes labels and performs VRF lookup.
6. Traffic is forwarded toward the destination customer site.

---

## Verification Commands

Run on PE and P routers:

```bash
show mpls ldp neighbor
show mpls forwarding-table
show ip ospf neighbor
```

Run on PE routers:

```bash
show ip bgp vpnv4 vrf TNPH summary
show ip route vrf TNPH
```

---

## Expected Results

| Check | Expected Result |
|---|---|
| OSPF neighbour | FULL |
| LDP neighbour | Established |
| MPLS forwarding table | Labels installed |
| VPNv4 BGP | Established between PE routers |
| P router BGP | Not configured |
| Customer routes on P router | Not visible |

---

## Design Notes

- MPLS is only enabled inside the provider core.
- CE routers do not run MPLS.
- P router does not run BGP.
- Customer traffic is separated using VRF TNPH.
- MP-BGP VPNv4 carries customer routes between PE routers.
