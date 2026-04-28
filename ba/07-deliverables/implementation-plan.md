# Implementation Plan

## Purpose

This document defines the high-level implementation plan for the TNP MedNet project.

## Phase 1: Discovery and Planning

| Task | Owner |
|---|---|
| Confirm business drivers | Dr. Tony To |
| Confirm technical scope | Tommy Huynh |
| Confirm risk and compliance expectations | Peter Phan |
| Confirm operational requirements | Misha Milanovic |
| Complete BA discovery documents | Project Team |

## Phase 2: Core Network Build

| Task | Owner |
|---|---|
| Configure ISP router | Network Engineer |
| Configure Sophos firewall base connectivity | Network Engineer |
| Configure CSW01 and CSW02 | Network Engineer |
| Configure HSRP | Network Engineer |
| Validate DC VLANs | Network Engineer |

## Phase 3: MPLS and BGP

| Task | Owner |
|---|---|
| Configure PE-Router-L | Network Engineer |
| Configure P-Router | Network Engineer |
| Configure PE-Router-R | Network Engineer |
| Configure CE to PE BGP | Network Engineer |
| Validate MPLS L3VPN routing | Network Engineer |

## Phase 4: Branch Security

| Task | Owner |
|---|---|
| Configure Metro pfSense | Network Engineer |
| Configure Remote Clinic pfSense | Network Engineer |
| Configure Metro access switch | Network Engineer |
| Configure Remote Clinic access switch | Network Engineer |
| Test VLAN isolation | Network Engineer |

## Phase 5: Server and Monitoring

| Task | Owner |
|---|---|
| Configure Windows Server 2022 AD01 | Systems Engineer |
| Configure Windows Server 2022 SQL01 | Systems Engineer |
| Configure Ubuntu 24.04 MON01 | Systems Engineer |
| Deploy Docker monitoring stack | Systems Engineer |
| Configure Wazuh and Splunk | Security Analyst |

## Phase 6: Testing and Handover

| Task | Owner |
|---|---|
| Complete connectivity matrix | IT Operations |
| Complete BGP verification | Network Engineer |
| Complete MPLS verification | Network Engineer |
| Complete HSRP failover test | Network Engineer |
| Complete attack simulation | Security Analyst |
| Complete runbook | Misha Milanovic |
| Complete handover | Project Team |

## Rollback Strategy

Major changes must include rollback steps. If a change causes loss of connectivity, revert to the previous saved configuration and validate with the relevant test commands.
