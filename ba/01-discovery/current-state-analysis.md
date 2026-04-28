# Current State Analysis

## Purpose

This document describes the current operating environment before the TNP MedNet network modernisation project.

## Current Environment Summary

TNP MedNet currently operates across a central data centre, a metro hospital, and a remote community clinic. Connectivity is functional but lacks the resilience, visibility, and segmentation required for a healthcare environment.

## Current Network Characteristics

| Area | Current State |
|---|---|
| WAN connectivity | Site-to-site links are basic and difficult to scale |
| Routing | Limited dynamic routing design |
| Segmentation | Clinical, admin, and testing traffic are not consistently separated |
| Monitoring | No mature centralised SIEM or network monitoring |
| Firewalling | Firewall placement is not standardised across sites |
| Server services | Central services exist but require stronger redundancy and documentation |
| Incident response | Troubleshooting is manual and dependent on individual knowledge |
| Documentation | Network and BA documentation is incomplete |

## Current Business Impact

| Issue | Business Impact |
|---|---|
| Slow troubleshooting | Longer clinical service disruption |
| Limited visibility | Delayed detection of security and routing issues |
| Weak segmentation | Higher risk of lateral movement |
| Manual operations | Increased dependency on senior engineers |
| Limited runbooks | Harder handover and operational support |
| No standard site model | Future clinic expansion becomes slower and riskier |

## Current Availability Baseline

| Metric | Baseline |
|---|---|
| Estimated service availability | 97.8% |
| Estimated annual downtime | 47 hours |
| Estimated annual downtime impact | VND 12.7B / USD 483K / AUD 672K |

## Current Security Gaps

| Gap | Description |
|---|---|
| Limited SIEM integration | Security events are not centrally correlated |
| Weak branch visibility | Branch firewall and endpoint logs are not fully monitored |
| Flat network areas | Some services lack strong VLAN isolation |
| Manual alerting | Routing or firewall failures may not trigger fast alerts |
| No isolated simulation zone | Attack simulation needs a controlled VLAN |

## Current Process Gaps

| Process | Gap |
|---|---|
| Incident management | No consistent P1/P2 flow |
| Change management | No formal CAB-style approval process |
| Testing | No standard test matrix |
| Handover | No complete operational handover document |
| Compliance | Evidence collection is manual |

## Summary

The current state is workable for a small environment but not suitable for a scalable healthcare network. TNP MedNet requires a more structured network architecture, better monitoring, stronger segmentation, and clearer operational processes.
