# Business Requirements Document

## Purpose

This document defines the business requirements for the TNP MedNet enterprise healthcare network project.

## Business Objectives

| ID | Objective |
|---|---|
| BO-001 | Improve clinical system availability across all sites |
| BO-002 | Provide secure WAN connectivity between the data centre, metro hospital, and remote clinic |
| BO-003 | Support future expansion to additional healthcare branches |
| BO-004 | Improve monitoring visibility for network and security events |
| BO-005 | Reduce downtime impact and improve incident response |
| BO-006 | Improve audit readiness and operational documentation |

## Business Requirements

| ID | Requirement | Priority | Owner |
|---|---|---|---|
| BR-001 | The network must support reliable access to clinical applications from all sites | Must Have | Dr. Tony To |
| BR-002 | The solution must separate clinical, admin, monitoring, and isolated testing traffic | Must Have | Tommy Huynh |
| BR-003 | The WAN design must support scalable branch connectivity | Must Have | Tommy Huynh |
| BR-004 | The data centre must provide resilient default gateways for server and monitoring VLANs | Must Have | Tommy Huynh |
| BR-005 | The monitoring platform must collect security and network logs from key infrastructure | Must Have | Misha Milanovic |
| BR-006 | The project must include clear incident and change management documentation | Must Have | Peter Phan |
| BR-007 | The solution must support future Azure VPN and cloud service integration | Should Have | Tommy Huynh |
| BR-008 | The project must provide financial visibility in VND, USD, and AUD | Should Have | Finance Team |
| BR-009 | The final deliverables must be suitable for operational handover | Must Have | Misha Milanovic |

## Financial Requirement

| ID | Requirement |
|---|---|
| FIN-001 | Project cost estimates must show VND as the primary currency with USD and AUD equivalents. |
| FIN-002 | Major cost items must be grouped by infrastructure, security, monitoring, implementation, documentation, and contingency. |
| FIN-003 | Business value must include outage reduction, operational efficiency, and expansion readiness. |

## Acceptance Criteria

| Requirement | Acceptance Criteria |
|---|---|
| BR-001 | Branch users can reach approved data centre services |
| BR-002 | VLANs are created and tested according to the VLAN plan |
| BR-003 | CE to PE BGP sessions are established |
| BR-004 | HSRP is active/standby as designed |
| BR-005 | Wazuh and Splunk receive test logs |
| BR-006 | Incident and change management documents are completed |
| BR-009 | Runbook and handover document are ready before project closure |
