# Incident Management

## Purpose

This document defines the incident management process for TNP MedNet.

## Incident Priority Matrix

| Priority | Description | Example | Target Response |
|---|---|---|---|
| P1 | Critical clinical service outage | All sites cannot access clinical systems | 15 minutes |
| P2 | Major site or security incident | Metro or remote clinic WAN outage | 30 minutes |
| P3 | Degraded service | One VLAN or non-critical service affected | 4 business hours |
| P4 | Minor request or documentation issue | Non-urgent configuration clarification | 2 business days |

## Incident Roles

| Role | Responsibility |
|---|---|
| IT Support Team | First response and ticket creation |
| Network Engineer | Routing, switching, firewall, and WAN troubleshooting |
| Security Analyst | Wazuh/Splunk investigation |
| IT Operations Manager | Incident coordination and communication |
| Risk, Safety, and Compliance Director | Major incident escalation and governance |
| Executive Sponsor | Business-level decision for critical incidents |

## P1 Incident Flow

1. Incident detected by user report or monitoring alert.
2. IT Support creates P1 ticket.
3. IT Operations Manager is notified.
4. Network and security teams begin investigation.
5. Peter Phan is notified if safety, compliance, or external escalation is required.
6. Workaround or restoration is prioritised.
7. Service is validated using the connectivity matrix.
8. Root cause is documented.
9. Post-incident review is completed.

## P2 Incident Flow

1. Incident is logged and classified.
2. Relevant technical owner is assigned.
3. Monitoring dashboards are reviewed.
4. Runbook is followed.
5. Impacted users are updated.
6. Service is restored and validated.
7. Incident record is closed with evidence.

## Incident Evidence

Evidence should include:

- Time of detection
- Impacted site or service
- Screenshots or log entries
- Commands used
- Root cause
- Resolution steps
- Preventive actions
