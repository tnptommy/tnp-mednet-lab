# As-Is Process

## Purpose

This document describes current operational processes before the target-state project is fully implemented.

## As-Is Incident Process

| Step | Current Process | Issue |
|---|---|---|
| 1 | User reports issue to IT | No structured priority classification |
| 2 | IT checks manually | Slow fault isolation |
| 3 | Engineer logs into devices | Dependency on senior engineer knowledge |
| 4 | Root cause is identified manually | Limited monitoring correlation |
| 5 | Fix is applied | Limited change record |
| 6 | User is notified | Communication may be inconsistent |

## As-Is Change Process

| Step | Current Process | Issue |
|---|---|---|
| 1 | Engineer identifies required change | No formal request template |
| 2 | Verbal approval may be given | Weak audit trail |
| 3 | Change is implemented | Risk review may be incomplete |
| 4 | Testing is informal | Limited rollback evidence |
| 5 | Documentation may be updated later | Documentation can become stale |

## As-Is Monitoring Process

| Area | Current Process | Issue |
|---|---|---|
| Network events | Manual device checks | No central alerting |
| Security events | Limited endpoint visibility | Delayed detection |
| Firewall events | Checked per device | No correlation |
| BGP/MPLS state | CLI verification only | Not dashboarded |

## As-Is Pain Summary

The current process is reactive. It can work in a small environment but is not suitable for a healthcare organisation where clinical availability, accountability, and security visibility are important.
