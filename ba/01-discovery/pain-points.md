# Pain Points

## Purpose

This document captures the main business and technical pain points that justify the TNP MedNet project.

## Pain Point Summary

| ID | Pain Point | Impact | Priority |
|---|---|---|---|
| PP-001 | Clinical systems are vulnerable to WAN outages | Doctors may lose access to patient information | High |
| PP-002 | Troubleshooting is too manual | Longer resolution time during incidents | High |
| PP-003 | Monitoring is fragmented | Security and network issues may be detected late | High |
| PP-004 | Branch segmentation is inconsistent | Higher risk of lateral movement | High |
| PP-005 | No standardised clinic network model | Future expansion is slower and harder | Medium |
| PP-006 | Limited firewall visibility across sites | Security investigation is harder | High |
| PP-007 | No strong runbook culture | Operational support depends on individual engineers | Medium |
| PP-008 | Change management is informal | Higher risk during network changes | Medium |
| PP-009 | Compliance evidence is difficult to collect | Audit readiness is weaker | Medium |
| PP-010 | Financial impact of downtime is significant | Annual downtime impact estimated at VND 12.7B / USD 483K / AUD 672K | High |

## Stakeholder Quotes

| Stakeholder | Quote |
|---|---|
| Dr. Tony To | Every hour a doctor cannot access patient history creates clinical risk. |
| Tommy Huynh | The network must be designed like a real enterprise, not a temporary lab. |
| Peter Phan | Risk and incident escalation must be clear before a major outage happens. |
| Misha Milanovic | I need a runbook for every major failure scenario before I sign off. |
| Clinical Staff | We need the system to be available when patients are in front of us. |

## Root Causes

| Root Cause | Description |
|---|---|
| Lack of standard architecture | Current design does not follow a reusable enterprise pattern |
| Limited monitoring integration | Logs and alerts are not centralised |
| Weak segmentation | Traffic separation is incomplete |
| Manual operations | Troubleshooting depends on engineer experience |
| Incomplete documentation | Support teams lack clear reference material |

## Recommended Response

The project should address these pain points through MPLS L3VPN design, HSRP gateway redundancy, centralised firewalling, branch pfSense segmentation, Wazuh/Splunk monitoring, testing documentation, and operational runbooks.
