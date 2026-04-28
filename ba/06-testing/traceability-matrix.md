# Traceability Matrix

## Purpose

This document maps business and functional requirements to test cases.

## Requirement to Test Mapping

| Requirement ID | Requirement Summary | Test Document | Expected Evidence |
|---|---|---|---|
| BR-001 | Reliable clinical access | connectivity-matrix.md | Successful ping and application reachability |
| BR-002 | Traffic segmentation | vlan-isolation-test.md | VLAN access results |
| BR-003 | Scalable WAN design | bgp-verification.md | BGP established and routes received |
| BR-004 | Resilient DC gateways | hsrp-failover-test.md | HSRP active/standby output |
| BR-005 | Central monitoring | attack-simulation.md | Wazuh and Splunk events |
| BR-006 | Incident and change process | incident-management.md, change-management.md | Completed BA documents |
| FR-004 | VPNv4 route exchange | bgp-verification.md | VPNv4 VRF summary |
| FR-005 | BGP-free core | mpls-verification.md | P router has no BGP/VRF |
| FR-010 | Wazuh endpoint events | attack-simulation.md | Wazuh alert screenshot |
| FR-011 | Splunk syslog events | bgp-verification.md | Splunk BGP/syslog event |
| NFR-001 | Gateway failover | hsrp-failover-test.md | Failover result |
| NFR-011 | No secrets in GitHub | compliance.md | Security note and repository review |

## Traceability Notes

Each requirement should have at least one test or document proving that the requirement has been addressed. Failed tests must be recorded with corrective actions.
