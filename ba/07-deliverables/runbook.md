# Operations Runbook

## Purpose

This runbook provides operational guidance for common TNP MedNet support scenarios.

## Key Devices

| Area | Devices |
|---|---|
| ISP | VIETTEL-ISP-RTR |
| Data Centre | Sophos, CSW01, CSW02, AD01, SQL01, MON01 |
| MPLS Core | PE-Router-L, P-Router, PE-Router-R |
| Metro | MET-CE01, MET-PFS01, MET-ASW01 |
| Remote Clinic | RUR-CE01, RUR-PFS01, RUR-ASW01 |

## Common Checks

### Check BGP

Run on CE or PE routers:

`show ip bgp summary`

Run on PE routers for VRF:

`show ip bgp vpnv4 vrf TNPH summary`

### Check MPLS

Run on PE and P routers:

`show mpls ldp neighbor`

`show mpls forwarding-table`

### Check OSPF

Run on provider core routers:

`show ip ospf neighbor`

### Check HSRP

Run on CSW01 and CSW02:

`show standby brief`

### Check Routes

Run on CE routers:

`show ip route bgp`

Run on PE routers:

`show ip route vrf TNPH`

## P1 Clinical Access Outage

1. Confirm affected site.
2. Check whether issue affects all sites or one branch.
3. Check BGP neighbour status.
4. Check MPLS LDP neighbour status.
5. Check HSRP state at data centre.
6. Check firewall reachability.
7. Review Splunk and Wazuh alerts.
8. Restore service using documented rollback if needed.
9. Capture evidence and update incident record.

## BGP Neighbour Down

1. Identify failed neighbour.
2. Check interface status.
3. Check IP reachability.
4. Check BGP summary.
5. Confirm AS numbers and VRF context.
6. Review recent changes.
7. Restore configuration or interface state.
8. Validate route table.

## HSRP Issue

1. Run `show standby brief`.
2. Confirm CSW01 is active and CSW02 is standby.
3. Check VLAN SVI status.
4. Check trunk and EtherChannel status.
5. Validate gateway reachability from server VLAN.
6. Record result.

## Monitoring Stack Issue

1. SSH to MON01.
2. Run `docker ps`.
3. Check failed containers.
4. Run `docker logs <container-name>`.
5. Restart service if required.
6. Validate Wazuh and Splunk dashboards.

## Escalation

| Scenario | Escalate To |
|---|---|
| Clinical outage | Misha Milanovic and Dr. Tony To |
| Security incident | Peter Phan and Security Analyst |
| WAN provider issue | Misha Milanovic and provider support |
| Major design issue | Tommy Huynh |
