# To-Be Process

## Purpose

This document defines the improved operational process after the TNP MedNet project is implemented.

## To-Be Incident Process

| Step | Target Process |
|---|---|
| 1 | User or monitoring system reports an issue |
| 2 | IT Support classifies incident as P1, P2, P3, or P4 |
| 3 | Monitoring dashboards are checked in Wazuh and Splunk |
| 4 | Network engineer follows the relevant runbook |
| 5 | Risk and Compliance Director is notified for major incidents |
| 6 | Change or fix is applied using documented steps |
| 7 | Service is validated using the test matrix |
| 8 | Incident is closed with root cause and evidence |

## To-Be Change Process

| Step | Target Process |
|---|---|
| 1 | Change request is created |
| 2 | Business and technical impact are documented |
| 3 | Risk review is completed |
| 4 | CAB approval is obtained for medium/high-risk changes |
| 5 | Change is implemented during approved window |
| 6 | Validation testing is completed |
| 7 | Rollback is performed if required |
| 8 | Documentation is updated |

## To-Be Monitoring Process

| Area | Target Process |
|---|---|
| Network events | Syslog forwarded to Splunk |
| Endpoint events | Wazuh agents forward events |
| Firewall events | Sophos and pfSense logs centralised |
| BGP events | Dashboard and alert created |
| Security events | Wazuh/Splunk detection scenarios tested |

## To-Be Benefits

| Benefit | Description |
|---|---|
| Faster response | Monitoring and runbooks reduce investigation time |
| Better accountability | Clear incident and change ownership |
| Stronger compliance | Evidence is easier to collect |
| Reduced downtime | Faster fault isolation and validation |
| Better handover | Operations team receives structured documentation |
