# 🏥 TNP MedNet — Enterprise Healthcare Network Lab

## Project Overview

**TNP MedNet** is a production-style enterprise healthcare network lab built in **EVE-NG** on **VMware Workstation**. The lab simulates a multi-site healthcare organisation based in **Ho Chi Minh City, Vietnam**, with a central data centre, metro hospital, remote community clinic, MPLS provider core, enterprise firewalls, Windows Server infrastructure, branch segmentation, and a Docker-based monitoring stack.

This project is designed to demonstrate practical skills across enterprise networking, infrastructure, cybersecurity, cloud integration, monitoring, business analysis, and technical documentation.

The lab focuses on a realistic healthcare environment where clinical system availability, secure WAN connectivity, network segmentation, operational monitoring, and incident response are critical.

---

## Lab Summary

| Item | Details |
|---|---|
| Lab Name | TNP MedNet — Enterprise Healthcare Network Lab |
| Platform | EVE-NG on VMware Workstation |
| Host OS | Windows |
| Host RAM | 64 GB |
| Estimated Lab RAM Usage | Around 38 GB |
| Total Nodes | Around 22 devices |
| Main Use Case | Multi-site healthcare enterprise network simulation |
| Current Version | v1.0 MPLS Complete |
| Last Updated | 28 April 2026 |

---

## Organisation Profile

**TNP MedNet Pty Ltd** is a simulated healthcare organisation operating in Ho Chi Minh City. The organisation provides clinical, administrative, and telehealth services across a central data centre, a metro hospital, and an outer-area community healthcare branch.

| Area | Details |
|---|---|
| Organisation | TNP MedNet Pty Ltd |
| Headquarters | Ho Chi Minh City, Vietnam |
| Staff | 250 staff |
| Clinical Staff | 180 |
| Administrative Staff | 70 |
| Main Sites | Data Centre, Metro Hospital, Remote Community Clinic |
| Strategic Focus | Reliable clinical access, secure connectivity, monitoring, compliance, and future cloud integration |

---

## Site Locations

| Site | Location | Purpose |
|---|---|---|
| Data Centre | Chanh Hung Ward, Ho Chi Minh City | Core infrastructure, servers, firewall, SIEM, and central network services |
| Metro Hospital | Ben Thanh Ward, Ho Chi Minh City | Main clinical and administrative hospital site |
| Remote Community Clinic | Long Phuoc Ward, Ho Chi Minh City | Outer-area healthcare branch used to simulate rural-style connectivity and remote clinical access |

The remote community clinic represents a healthcare site that depends heavily on stable WAN connectivity to access central patient systems, clinical applications, security monitoring, and support services.

---

## Key Personnel

| Name | Role | Responsibility |
|---|---|---|
| Dr. Tony To | Co-founder, Chief Medical Officer, and Executive Sponsor | Clinical leadership, patient outcomes, compliance direction, business approval, and budget ownership |
| Tommy Huynh | Co-founder, Chief Technology Officer, and Project Lead | Network architecture, cybersecurity design, infrastructure planning, vendor management, and implementation |
| Peter Phan | Co-founder and Director of Risk, Safety, and Compliance | Risk oversight, safety governance, incident escalation, compliance awareness, and public safety alignment |
| Misha Milanovic | IT Operations Manager | Day-to-day operations, incident response, telco liaison, runbook ownership, and operational sign-off |

### Governance Note

Peter Phan provides governance input from a public safety and law enforcement background. His role is focused on risk, safety, compliance, incident escalation, and coordination with external authorities during major operational or security incidents.

He does not manage day-to-day network engineering tasks. His role helps ensure that technology decisions align with safety, accountability, incident response, and compliance expectations.

---

## Project Objectives

The main objectives of this project are to:

1. Design a realistic enterprise healthcare network.
2. Build a multi-site MPLS L3VPN architecture.
3. Separate customer and provider routing using VRF and MP-BGP.
4. Implement resilient data centre gateways using HSRP.
5. Improve security through firewall placement and VLAN segmentation.
6. Deploy monitoring using Wazuh and Splunk.
7. Simulate security detection scenarios from an isolated attacker VLAN.
8. Document the project using technical and business analysis artefacts.
9. Create a professional GitHub portfolio project for networking, infrastructure, cloud, and cybersecurity roles.

---

## High-Level Architecture

The lab is divided into five major layers:

| Layer | Description |
|---|---|
| Cloud Layer | Azure VPN Gateway, Azure VNet, and future cloud-hosted healthcare services |
| Internet and ISP Layer | Internet uplink, NAT, ISP edge routing, and WAN handoff |
| Data Centre Layer | Sophos firewall, redundant core switches, HSRP, servers, and monitoring |
| MPLS Provider Core | PE and P routers running OSPF, MPLS LDP, and MP-BGP VPNv4 |
| Branch Layer | Metro and remote clinic sites using CE routers, pfSense, access switches, and VLANs |

---

## Network Topology Summary

```text
Azure Cloud
    |
IPSec VPN
    |
VIETTEL-ISP-RTR
    |
Sophos Firewall
    |
Data Centre Core Switches
    |
MPLS L3VPN Provider Core
    |
Metro Hospital and Remote Community Clinic
```

The MPLS core provides private WAN connectivity between the data centre, metro hospital, and remote community clinic. The provider core uses a BGP-free core design, where the P router performs label switching only and does not carry customer routes.

---

## Technology Stack

### Routing and WAN

- OSPF
- eBGP
- MP-BGP VPNv4
- MPLS LDP
- VRF
- MPLS L3VPN
- BGP-free provider core

### Switching

- VLANs
- 802.1Q trunking
- HSRP v2
- EtherChannel LACP
- Rapid PVST+

### Security

- Sophos XG firewall
- pfSense firewall
- VLAN segmentation
- Isolated attacker VLAN
- Syslog forwarding
- Security monitoring

### Servers and Monitoring

- Windows Server 2022
- Active Directory
- DNS
- DHCP
- SQL Server
- Ubuntu Server 24.04
- Docker
- Wazuh
- Splunk Enterprise

### Cloud

- Azure VPN Gateway
- Azure VNet
- Future FHIR API integration

---

## Device Inventory

| Node | Device | Image | Zone |
|---|---|---|---|
| 1 | VIETTEL-ISP-RTR | Cisco IOSv | ISP |
| 2 | TNPH-DC-SOPH01 | Sophos XG/SFOS | Data Centre |
| 3 | TNPH-DC-CSW01 | Cisco IOSvL2 | Data Centre |
| 4 | TNPH-DC-CSW02 | Cisco IOSvL2 | Data Centre |
| 5 | TNPH-DC-AD01 | Windows Server 2022 | Data Centre |
| 6 | TNPH-DC-SQL01 | Windows Server 2022 | Data Centre |
| 7 | TNPH-DC-MON01 | Ubuntu 24.04 + Docker | Data Centre |
| 8 | PE-Router-L | Cisco IOSv | MPLS |
| 9 | P-Router | Cisco IOSv | MPLS |
| 10 | PE-Router-R | Cisco IOSv | MPLS |
| 11 | TNPH-MET-CE01 | Cisco IOSv | Metro |
| 12 | TNPH-MET-PFS01 | pfSense CE | Metro |
| 13 | TNPH-MET-ASW01 | Cisco IOSvL2 | Metro |
| 14 | MET-MedApp1 | Linux Lite | Metro |
| 15 | MET-VoIP | Linux Lite + Linphone | Metro |
| 16 | MET-StaffPC | Linux Lite | Metro |
| 17 | TNPH-RUR-CE01 | Cisco IOSv | Remote Clinic |
| 18 | TNPH-RUR-PFS01 | pfSense CE | Remote Clinic |
| 19 | TNPH-RUR-ASW01 | Cisco IOSvL2 | Remote Clinic |
| 20 | RUR-MedApp2 | VPCS | Remote Clinic |
| 21 | RUR-Kali | Kali Linux | Remote Clinic |

---

## VLAN Plan

| VLAN | Name | Purpose | Site |
|---|---|---|---|
| 10 | CLINICAL | Medical applications and VoIP | Metro, Remote Clinic |
| 20 | ADMIN | Staff workstations | Metro |
| 99 | DC_SERVERS | Active Directory and SQL Server | Data Centre |
| 100 | DC_SIEM | Monitoring VM and Docker stack | Data Centre |
| 666 | ISOLATED | Kali Linux attack simulation | Remote Clinic |
| 999 | NATIVE | Native VLAN for trunk links | All sites |

---

## IP Addressing Summary

### Internet and ISP

| Network or IP | Purpose |
|---|---|
| 192.168.195.0/24 | VMware NAT internet uplink |
| 192.168.195.10 | VIETTEL-ISP-RTR internet-facing interface |
| 192.168.195.2 | VMware NAT gateway |
| 203.0.113.0/30 | Viettel to Sophos WAN link |
| 203.0.113.1 | VIETTEL-ISP-RTR WAN-side link |
| 203.0.113.2 | Sophos WAN interface |

### Data Centre

| Network or IP | Purpose |
|---|---|
| 172.16.16.0/24 | Sophos management network |
| 172.16.16.16 | Sophos management IP |
| 10.1.1.0/30 | Sophos to CSW01 |
| 10.1.1.4/30 | Sophos to CSW02 |
| 10.1.99.0/24 | DC server VLAN |
| 10.1.99.1 | HSRP VIP for server VLAN |
| 10.1.99.10 | Active Directory server |
| 10.1.99.11 | SQL server |
| 10.1.100.0/24 | DC monitoring VLAN |
| 10.1.100.1 | HSRP VIP for monitoring VLAN |
| 10.1.100.10 | Monitoring server |

### Customer Loopbacks

| Device | Loopback |
|---|---|
| TNPH-DC-CSW01 | 1.1.1.1/32 |
| TNPH-DC-CSW02 | 1.1.1.2/32 |
| TNPH-MET-CE01 | 1.1.1.10/32 |
| TNPH-RUR-CE01 | 1.1.1.20/32 |

### Provider Loopbacks

| Device | Loopback |
|---|---|
| PE-Router-L | 2.2.2.1/32 |
| P-Router | 2.2.2.2/32 |
| PE-Router-R | 2.2.2.3/32 |

Provider loopbacks are not advertised to the customer network. This follows the BGP-free core principle.

### MPLS Core Links

| Network | Purpose |
|---|---|
| 10.0.4.0/30 | CSW01 to PE-Router-L |
| 10.0.5.0/30 | CSW02 to PE-Router-R |
| 10.0.6.0/30 | Metro CE to PE-Router-L |
| 10.0.7.0/30 | Remote Clinic CE to PE-Router-R |
| 10.0.10.0/30 | PE-Router-L to P-Router |
| 10.0.11.0/30 | P-Router to PE-Router-R |

### Metro Hospital

| Network | Purpose |
|---|---|
| 10.1.10.0/30 | Metro CE to pfSense |
| 10.1.11.0/24 | Metro clinical VLAN |
| 10.1.20.0/24 | Metro admin VLAN |

### Remote Community Clinic

| Network | Purpose |
|---|---|
| 10.1.30.0/30 | Remote Clinic CE to pfSense |
| 10.1.31.0/24 | Remote Clinic clinical VLAN |
| 10.1.66.0/24 | Remote Clinic isolated attacker VLAN |

---

## BGP Design

### Autonomous Systems

| AS Number | Organisation | Devices |
|---|---|---|
| 65001 | TNP MedNet Customer Network | CSW01, CSW02, Metro CE, Remote Clinic CE |
| 65002 | Viettel Provider Network | PE-Router-L, P-Router, PE-Router-R |

### VRF Design

| Item | Value |
|---|---|
| VRF Name | TNPH |
| Route Distinguisher | 65002:100 |
| Route Target Export | 65002:100 |
| Route Target Import | 65002:100 |

### CE to PE eBGP Sessions

| Customer Device | Provider Device | Link |
|---|---|---|
| TNPH-DC-CSW01 | PE-Router-L | 10.0.4.2 to 10.0.4.1 |
| TNPH-DC-CSW02 | PE-Router-R | 10.0.5.2 to 10.0.5.1 |
| TNPH-MET-CE01 | PE-Router-L | 10.0.6.2 to 10.0.6.1 |
| TNPH-RUR-CE01 | PE-Router-R | 10.0.7.2 to 10.0.7.1 |

### MP-BGP VPNv4

| Peer 1 | Peer 2 | Purpose |
|---|---|---|
| PE-Router-L | PE-Router-R | VPNv4 route exchange for VRF TNPH |

### Advertised Customer Networks

| Site | Networks |
|---|---|
| Data Centre | 10.1.99.0/24, 10.1.100.0/24, 1.1.1.1/32, 1.1.1.2/32 |
| Metro Hospital | 10.1.11.0/24, 10.1.20.0/24, 1.1.1.10/32 |
| Remote Community Clinic | 10.1.31.0/24, 10.1.66.0/24, 1.1.1.20/32 |

---

## MPLS Design

The MPLS provider core uses a simple three-router design:

```text
PE-Router-L ---- P-Router ---- PE-Router-R
```

### Router Roles

| Device Type | Protocols | Role |
|---|---|---|
| PE Router | OSPF, MPLS LDP, MP-BGP VPNv4, eBGP VRF | Connects customer sites into the MPLS VPN |
| P Router | OSPF and MPLS LDP only | Performs label switching only |
| CE Router | eBGP only | Customer edge routing |

### BGP-Free Core Principle

The P router does not run BGP and does not store customer routes. It only performs MPLS label switching. This makes the provider core more scalable and keeps customer routing separated from the provider transport network.

---

## Docker Monitoring Stack

The monitoring stack runs on **TNPH-DC-MON01**.

| Item | Details |
|---|---|
| OS | Ubuntu Server 24.04 |
| IP Address | 10.1.100.10/24 |
| Default Gateway | 10.1.100.1 |
| RAM | 6–8 GB |
| Deployment Method | Docker Compose |

### Containers

| Service | Purpose | Port |
|---|---|---|
| Wazuh Manager | Agent and event collection | 1514, 55000 |
| Wazuh Indexer | OpenSearch backend | 9200 |
| Wazuh Dashboard | Security dashboard | 443 |
| Splunk Enterprise | Log analysis and dashboards | 8000, 9997 |

### Log Sources

- Windows Server AD01
- Windows Server SQL01
- Metro endpoints
- Remote Clinic endpoint
- Kali Linux
- Sophos firewall
- pfSense Metro
- pfSense Remote Clinic
- Data centre core switches
- MPLS PE routers

### Deployment

```bash
cd monitoring
docker-compose up -d
```

Check running containers:

```bash
docker ps
```

View container logs:

```bash
docker logs <container-name>
```

---

## Detection Scenarios

| Scenario | Source | Expected Result |
|---|---|---|
| Nmap scan from isolated VLAN | Kali in VLAN 666 | Wazuh alert and Splunk correlation |
| BGP neighbour down | Cisco syslog | Splunk routing alert |
| Brute force login attempt | Windows Server AD logs | Wazuh authentication alert |
| Lateral movement attempt | Endpoint and firewall logs | Suspicious movement alert |

---

## Repository Structure

```text
tnp-mednet-lab/
├── README.md
├── LICENSE
├── .gitignore
│
├── ba/
│   ├── 01-discovery/
│   ├── 02-requirements/
│   ├── 03-design/
│   ├── 04-process/
│   ├── 05-governance/
│   ├── 06-testing/
│   └── 07-deliverables/
│
├── configs/
│   ├── isp/
│   ├── dc/
│   ├── mpls/
│   ├── metro/
│   └── rural/
│
├── monitoring/
│   ├── docker-compose.yml
│   ├── wazuh/
│   └── splunk/
│
├── docs/
│   ├── 01-architecture/
│   ├── 02-setup/
│   ├── 03-configuration/
│   ├── 04-testing/
│   ├── 05-troubleshooting/
│   └── 06-screenshots/
│
├── scripts/
│   ├── deployment/
│   ├── testing/
│   └── monitoring/
│
├── topology/
├── diagrams/
└── images/
```

---

## Folder Guide

### `ba/`

Business Analysis documentation for the project.

Main contents:

- Business case
- Stakeholder register
- Stakeholder analysis
- Current state analysis
- Pain points
- Business requirements
- Functional requirements
- Non-functional requirements
- User stories
- Use cases
- Risk register
- SLA
- RACI matrix
- UAT scenarios
- Traceability matrix
- Runbook
- Handover document

### `configs/`

Network and firewall configuration files.

Main contents:

- ISP router configuration
- Data centre core switch configurations
- Sophos firewall export
- MPLS PE and P router configurations
- Metro CE and access switch configurations
- Metro pfSense export
- Remote Clinic CE and access switch configurations
- Remote Clinic pfSense export

### `monitoring/`

Docker-based monitoring and SIEM configuration.

Main contents:

- Docker Compose file
- Wazuh manager configuration
- Wazuh agent group configuration
- Wazuh custom rules
- Wazuh custom decoders
- Splunk inputs
- Splunk props
- Splunk transforms
- Splunk dashboards

### `docs/`

Technical project documentation.

Main contents:

- Architecture overview
- IP addressing plan
- VLAN plan
- BGP design
- MPLS design
- Setup guides
- Configuration guides
- Testing guides
- Troubleshooting guides
- Screenshots

### `scripts/`

Automation and validation scripts.

Main contents:

- Netmiko bulk configuration push
- BGP verification
- MPLS verification
- Ping matrix testing
- Connectivity report generation
- Monitoring deployment helpers

### `topology/`

EVE-NG topology export files.

### `diagrams/`

Network diagrams, MPLS flow diagrams, HSRP failover diagrams, and business process diagrams.

### `images/`

Project images used in the README and documentation.

---

## Verification Commands

### BGP Verification

On PE routers:

```bash
show ip bgp vpnv4 vrf TNPH summary
show ip route vrf TNPH
```

On CE routers and core switches:

```bash
show ip bgp summary
show ip route bgp
```

Expected result:

```text
BGP state: Established
VRF TNPH prefix count: 8 routes
```

### MPLS Verification

```bash
show mpls ldp neighbor
show mpls forwarding-table
show ip ospf neighbor
```

Expected result:

```text
LDP neighbours are up
OSPF neighbours are FULL
MPLS labels are installed
```

### HSRP Verification

```bash
show standby brief
```

Expected result:

```text
TNPH-DC-CSW01: Active for VLAN 99 and VLAN 100
TNPH-DC-CSW02: Standby for VLAN 99 and VLAN 100
```

### End-to-End Ping Tests

From CSW01:

```bash
ping 1.1.1.2 source 1.1.1.1
ping 1.1.1.10 source 1.1.1.1
ping 1.1.1.20 source 1.1.1.1
```

From Metro CE:

```bash
ping 1.1.1.1 source 1.1.1.10
ping 1.1.1.20 source 1.1.1.10
```

From PE-Router-L inside the VRF:

```bash
ping vrf TNPH 10.0.4.2 source 10.0.4.1
ping vrf TNPH 10.0.6.2 source 10.0.6.1
```

---

## Current Lab Status

| Component | Status |
|---|---|
| VIETTEL-ISP-RTR | Configured |
| TNPH-DC-SOPH01 | Configured |
| TNPH-DC-CSW01 | Configured, BGP Established |
| TNPH-DC-CSW02 | Configured |
| PE-Router-L | Configured, MPLS and BGP running |
| P-Router | Configured, MPLS LDP running |
| PE-Router-R | Configured, MPLS and BGP running |
| TNPH-MET-CE01 | Configured, BGP Established |
| TNPH-RUR-CE01 | Configured, BGP Established |
| MPLS L3VPN | End-to-end routing verified |
| TNPH-DC-AD01 | Windows setup in progress |
| TNPH-DC-SQL01 | Pending |
| TNPH-DC-MON01 | Docker stack pending |
| TNPH-MET-PFS01 | Pending |
| TNPH-RUR-PFS01 | Pending |
| TNPH-MET-ASW01 | Pending |
| TNPH-RUR-ASW01 | Pending |
| Endpoints | Pending |

---

## Business Analysis Artefacts

### Completed Phase 1 — Discovery

| Artefact | Status |
|---|---|
| Business Case | Completed |
| Stakeholder Register | Completed |
| Stakeholder Analysis | Completed |
| Current State Analysis | Completed |
| Pain Points | Completed |

### Pending Phase 2–7

| Artefact | Status |
|---|---|
| Business Requirements Document | Pending |
| Functional Requirements Document | Pending |
| Non-Functional Requirements | Pending |
| User Stories | Pending |
| Use Cases | Pending |
| RACI Matrix | Pending |
| Risk Register | Pending |
| SLA Document | Pending |
| Test Plan | Pending |
| UAT Scenarios | Pending |
| Traceability Matrix | Pending |
| Runbook | Pending |
| Handover Document | Pending |

---

## Roadmap

### Phase 1 — Core Network

- Build ISP and data centre connectivity
- Configure Sophos firewall
- Configure data centre core switches
- Configure HSRP
- Configure MPLS provider core
- Configure CE to PE BGP
- Verify MPLS L3VPN routing

### Phase 2 — Branch Security

- Configure Metro pfSense
- Configure Remote Clinic pfSense
- Configure Metro access switch
- Configure Remote Clinic access switch
- Implement VLAN segmentation
- Test branch-to-data-centre access

### Phase 3 — Server Infrastructure

- Configure Active Directory
- Configure DNS and DHCP
- Configure SQL Server
- Join endpoints to the domain
- Validate access to clinical applications

### Phase 4 — Monitoring

- Deploy Docker on MON01
- Deploy Wazuh
- Deploy Splunk
- Forward syslog from network devices
- Install Wazuh agents
- Build dashboards and alerts

### Phase 5 — Testing and Documentation

- Complete connectivity matrix
- Complete BGP verification
- Complete MPLS verification
- Complete HSRP failover testing
- Complete VLAN isolation testing
- Complete attack simulation testing
- Finalise runbook and handover documentation

---

## Skills Demonstrated

This project demonstrates practical skills in:

- Enterprise network design
- Cisco routing and switching
- BGP and MPLS
- VRF and L3VPN
- OSPF and LDP
- HSRP and gateway redundancy
- Firewall placement and segmentation
- pfSense and Sophos firewall design
- Windows Server infrastructure
- Docker deployment
- Wazuh SIEM
- Splunk log analysis
- Technical documentation
- Business Analysis documentation
- Testing and verification
- Troubleshooting
- GitHub project organisation

---

## Security Note

This repository is a lab and portfolio project. Sensitive credentials, private keys, real production data, and confidential configuration values should not be committed to GitHub.

Recommended practice:

- Do not commit real passwords.
- Do not commit private SSH keys.
- Do not commit production firewall exports.
- Use placeholders for sensitive values.
- Store secrets outside the repository.
- Use `.gitignore` for temporary files and sensitive local artefacts.

---

## Author

**Tommy Huynh**  
Bachelor of Information Technology  
Major: Networking and Cybersecurity  
University of Technology Sydney  

Project focus:

- Networking
- Infrastructure
- Cybersecurity
- Cloud
- Business Analysis
- Enterprise lab documentation

---

## Disclaimer

This is a simulated lab environment created for learning, demonstration, and portfolio purposes. It does not represent a live production healthcare network.
