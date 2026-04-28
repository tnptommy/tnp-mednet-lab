# Business Case

## Project Name

TNP MedNet — Enterprise Healthcare Network Lab

## Executive Summary

TNP MedNet requires a secure, resilient, and scalable enterprise network to support clinical operations across Ho Chi Minh City. The current environment relies on fragmented site connectivity, limited monitoring, and inconsistent operational visibility.

This project proposes a modern multi-site healthcare network using MPLS L3VPN, BGP, HSRP, enterprise firewalling, VLAN segmentation, Windows Server infrastructure, and a Docker-based monitoring stack using Wazuh and Splunk.

The solution supports the Data Centre in Chanh Hung Ward, the Metro Hospital in Ben Thanh Ward, and a Remote Community Clinic in Long Phuoc Ward.

## Business Drivers

| Driver | Description |
|---|---|
| Clinical availability | Doctors and staff need reliable access to patient systems. |
| Secure connectivity | Branch sites require private and segmented WAN access. |
| Monitoring visibility | IT operations need centralised alerting and logging. |
| Future expansion | The organisation plans to support more community clinics. |
| Compliance readiness | Healthcare data requires strong governance and audit visibility. |

## Problem Statement

TNP MedNet needs to reduce operational risk caused by isolated site designs, limited monitoring, manual troubleshooting, and weak segmentation between clinical, administrative, and testing environments.

Without improvement, the organisation risks longer outages, slower incident response, lower confidence from clinical teams, and higher security exposure.

## Proposed Solution

The proposed solution includes:

- MPLS L3VPN between the data centre, metro hospital, and remote clinic
- BGP and MP-BGP VPNv4 for scalable routing
- HSRP for resilient data centre gateways
- Sophos firewall at the data centre edge
- pfSense firewalls at branch sites
- VLAN segmentation for clinical, admin, monitoring, and isolated testing traffic
- Windows Server services for AD, DNS, DHCP, and SQL
- Docker monitoring stack using Wazuh and Splunk
- Business Analysis, testing, runbook, and handover documentation

## Financial Summary

Planning exchange rates used:

| Currency | Planning Rate |
|---|---|
| 1 USD | 26,350 VND |
| 1 AUD | 18,930 VND |
| 1 USD | 1.39 AUD |

## Estimated Project Investment

| Cost Category | VND | USD | AUD |
|---|---:|---:|---:|
| Network infrastructure | 8,432,000,000 | 320,000 | 445,400 |
| Firewall and security stack | 3,952,500,000 | 150,000 | 208,800 |
| Server and monitoring infrastructure | 3,425,500,000 | 130,000 | 181,000 |
| Professional services and implementation | 5,270,000,000 | 200,000 | 278,400 |
| Documentation, testing, and training | 1,317,500,000 | 50,000 | 69,600 |
| Contingency | 2,635,000,000 | 100,000 | 139,200 |
| **Total Estimated Investment** | **25,032,500,000** | **950,000** | **1,322,400** |

## Estimated Business Benefits

| Benefit | Estimated Value |
|---|---:|
| Reduced outage impact per year | VND 12.7B / USD 483K / AUD 672K |
| Improved incident response | Faster fault isolation through central monitoring |
| Better clinical availability | More reliable access to patient and clinical systems |
| Stronger security posture | Better segmentation and visibility |
| Reusable expansion model | Faster onboarding for future clinic sites |

## Expected Return

| Metric | Estimate |
|---|---|
| Payback period | 2.7 years |
| 5-year operational saving | VND 25.8B / USD 980K / AUD 1.36M |
| Availability target | 99.5% or higher for core clinical services |

## Key Stakeholders

| Stakeholder | Role |
|---|---|
| Dr. Tony To | Executive Sponsor and Chief Medical Officer |
| Tommy Huynh | CTO and Project Lead |
| Peter Phan | Director of Risk, Safety, and Compliance |
| Misha Milanovic | IT Operations Manager |
| Clinical Teams | End users of patient and clinical systems |
| Administrative Teams | Users of back-office systems |
| IT Operations Team | Responsible for support and maintenance |

## Recommendation

Proceed with the TNP MedNet network modernisation project using a phased delivery model. The first priority should be the MPLS core, data centre gateway redundancy, and branch connectivity. Monitoring, documentation, and operational handover should follow before production go-live.
