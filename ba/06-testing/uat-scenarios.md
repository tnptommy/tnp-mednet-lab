# UAT Scenarios

## Purpose

This document defines user acceptance testing scenarios for TNP MedNet.

## UAT-001: Clinical Access from Metro Hospital

| Field | Description |
|---|---|
| User | Metro clinical staff |
| Scenario | Access clinical system from Metro VLAN 10 |
| Expected Result | Clinical application is reachable |
| Status | Pending |

## UAT-002: Clinical Access from Remote Clinic

| Field | Description |
|---|---|
| User | Remote clinic doctor |
| Scenario | Access data centre clinical services through MPLS WAN |
| Expected Result | Approved clinical services are reachable |
| Status | Pending |

## UAT-003: Admin Access from Metro Hospital

| Field | Description |
|---|---|
| User | Administrative staff |
| Scenario | Access approved admin services |
| Expected Result | Admin VLAN access works as expected |
| Status | Pending |

## UAT-004: Monitoring Visibility

| Field | Description |
|---|---|
| User | IT Operations Manager |
| Scenario | View BGP, firewall, endpoint, and security events |
| Expected Result | Events appear in Splunk and Wazuh |
| Status | Pending |

## UAT-005: Incident Escalation

| Field | Description |
|---|---|
| User | Risk and Compliance Director |
| Scenario | Review P1 incident escalation process |
| Expected Result | Roles, communication, and evidence requirements are clear |
| Status | Pending |

## UAT-006: Handover Readiness

| Field | Description |
|---|---|
| User | IT Operations Team |
| Scenario | Use runbook to verify a simulated BGP issue |
| Expected Result | Operations team can follow steps without project team assistance |
| Status | Pending |
