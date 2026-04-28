# Non-Functional Requirements

## Purpose

This document defines quality, performance, security, availability, and operational requirements.

## Availability Requirements

| ID | Requirement | Target |
|---|---|---|
| NFR-001 | Core clinical access should remain available during single gateway failure | HSRP failover |
| NFR-002 | WAN routing should recover after a BGP peer failure | Manual or automatic reconvergence depending on scenario |
| NFR-003 | Core services should target improved availability | 99.5% or higher |
| NFR-004 | Monitoring should be available during normal business operations | 95% or higher in lab scope |

## Performance Requirements

| ID | Requirement | Target |
|---|---|---|
| NFR-005 | Site-to-site ping tests should complete successfully | 100% expected in lab state |
| NFR-006 | Routing convergence should be verified during failover tests | Recorded in testing documents |
| NFR-007 | Monitoring dashboards should load within acceptable time | Less than 10 seconds in lab environment |

## Security Requirements

| ID | Requirement | Target |
|---|---|---|
| NFR-008 | Clinical and admin traffic must be segmented | VLAN separation |
| NFR-009 | Isolated attacker traffic must not have unrestricted access | pfSense rules and VLAN isolation |
| NFR-010 | Device management must avoid insecure protocols | SSH preferred, no Telnet |
| NFR-011 | Sensitive credentials must not be committed to GitHub | Placeholders only |
| NFR-012 | Security logs should be centralised | Wazuh and Splunk |

## Scalability Requirements

| ID | Requirement | Target |
|---|---|---|
| NFR-013 | The design should support additional clinic sites | Reusable CE/pfSense/access switch model |
| NFR-014 | MPLS design should support additional VRFs in future | Provider core scalable model |
| NFR-015 | Monitoring stack should support additional agents | Wazuh agent groups |

## Maintainability Requirements

| ID | Requirement | Target |
|---|---|---|
| NFR-016 | Configuration files must be stored in clear folders | `configs/` directory |
| NFR-017 | Technical guides must be easy to follow | Step-by-step documentation |
| NFR-018 | Runbooks must support incident response | P1/P2 procedures |
| NFR-019 | Testing evidence must be documented | Testing folder and screenshots |
