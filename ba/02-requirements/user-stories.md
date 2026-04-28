# User Stories

## Purpose

This document captures user stories for clinical, technical, operational, and governance stakeholders.

## User Stories

| ID | User Story | Acceptance Criteria | Priority |
|---|---|---|---|
| US-001 | As a doctor at the remote clinic, I want reliable access to clinical applications so that I can view patient information during consultations. | Remote clinic can reach approved DC services. | High |
| US-002 | As a nurse at the metro hospital, I want stable access to patient systems so that patient care is not delayed. | Metro VLAN can reach required clinical systems. | High |
| US-003 | As the CTO, I want MPLS L3VPN between sites so that routing is scalable and separated from provider infrastructure. | CE-to-PE BGP and VPNv4 routes are established. | High |
| US-004 | As the IT Operations Manager, I want a runbook for major failures so that support staff can respond consistently. | Runbook includes BGP, MPLS, HSRP, firewall, and monitoring steps. | High |
| US-005 | As the Risk and Compliance Director, I want clear escalation processes so that serious incidents are handled with accountability. | P1/P2 incident process is documented. | High |
| US-006 | As the security analyst, I want Wazuh and Splunk alerts so that suspicious activity can be detected quickly. | Test alerts are visible in monitoring tools. | High |
| US-007 | As a network engineer, I want verification scripts so that BGP and MPLS state can be checked quickly. | Scripts exist under `scripts/`. | Medium |
| US-008 | As a finance stakeholder, I want costs shown in VND, USD, and AUD so that the project can be understood by local and international readers. | Business case includes three-currency cost table. | Medium |
| US-009 | As a future engineer, I want clear GitHub documentation so that I can understand and rebuild the lab. | README and docs are complete. | High |
