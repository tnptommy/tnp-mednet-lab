# Risk Register

## Purpose

This document tracks project and operational risks for TNP MedNet.

## Risk Register

| ID | Risk | Impact | Likelihood | Rating | Owner | Mitigation |
|---|---|---|---|---|---|---|
| R-001 | MPLS routing misconfiguration | High | Medium | High | Tommy Huynh | Use staged testing and verification commands |
| R-002 | BGP neighbour failure | High | Medium | High | Misha Milanovic | Monitor BGP syslog and document failover steps |
| R-003 | HSRP failover not working | High | Low | Medium | Tommy Huynh | Validate `show standby brief` and failover testing |
| R-004 | Firewall policy blocks clinical traffic | High | Medium | High | Tommy Huynh | Test firewall rules before go-live |
| R-005 | Monitoring stack performance issue | Medium | Medium | Medium | Misha Milanovic | Allocate 6–8 GB RAM and monitor Docker containers |
| R-006 | Sensitive credentials committed to GitHub | High | Medium | High | Peter Phan | Use placeholders and `.gitignore` |
| R-007 | Poor documentation handover | Medium | Medium | Medium | Misha Milanovic | Complete runbook and handover document |
| R-008 | Cost overrun | Medium | Medium | Medium | Finance Team | Track cost in VND, USD, and AUD |
| R-009 | Security simulation impacts clinical VLAN | High | Low | Medium | Peter Phan | Keep Kali in isolated VLAN 666 |
| R-010 | Windows Server setup delay | Medium | Medium | Medium | Tommy Huynh | Stage AD/DNS/DHCP before application testing |
| R-011 | Incomplete compliance evidence | Medium | Medium | Medium | Peter Phan | Maintain testing records and change logs |

## Financial Risk Reference

| Item | Estimate |
|---|---:|
| Total project investment | VND 25.03B / USD 950K / AUD 1.32M |
| Annual downtime impact baseline | VND 12.7B / USD 483K / AUD 672K |

## Risk Review Frequency

Risks should be reviewed at each major project phase:

1. Core network build
2. Branch security implementation
3. Server infrastructure deployment
4. Monitoring stack deployment
5. Testing and handover
