# Compliance

## Purpose

This document describes compliance considerations for the TNP MedNet healthcare network lab.

## Compliance Context

TNP MedNet is a simulated healthcare environment. The lab does not process real patient data. However, the design follows healthcare-style security and governance principles.

## Compliance Principles

| Principle | Description |
|---|---|
| Data protection | Do not store real patient data in the lab |
| Least privilege | Limit access between VLANs and systems |
| Auditability | Keep logs, change records, and testing evidence |
| Incident accountability | Define clear escalation and ownership |
| Secure configuration | Avoid insecure protocols and exposed credentials |
| Evidence-based testing | Document verification results and screenshots |

## Privacy and Security Considerations

| Area | Control |
|---|---|
| Patient data | Use dummy data only |
| Credentials | Do not commit real passwords to GitHub |
| Network access | Segment clinical, admin, SIEM, and isolated VLANs |
| Monitoring | Centralise logs using Wazuh and Splunk |
| Attack testing | Keep Kali in isolated VLAN 666 |
| Change control | Use documented change process |
| Incident response | Use P1/P2 escalation flow |

## Governance Ownership

| Role | Compliance Responsibility |
|---|---|
| Dr. Tony To | Clinical and executive accountability |
| Tommy Huynh | Technical security design |
| Peter Phan | Risk, safety, and escalation governance |
| Misha Milanovic | Operational readiness and evidence collection |

## GitHub Compliance Note

The repository must not include:

- Real patient data
- Real production credentials
- Private SSH keys
- Confidential firewall exports
- Sensitive personal information
- Unredacted logs containing private data

Use placeholder values where needed.
