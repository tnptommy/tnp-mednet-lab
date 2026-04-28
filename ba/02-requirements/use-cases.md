# Use Cases

## UC-001: Remote Clinic Access to Clinical Systems

| Field | Description |
|---|---|
| Primary Actor | Remote clinic doctor |
| Goal | Access clinical applications hosted from the data centre |
| Precondition | MPLS L3VPN and branch firewall are operational |
| Trigger | User opens clinical application |
| Main Flow | User connects from clinical VLAN, traffic passes through pfSense, CE router, MPLS core, DC core, and server VLAN |
| Success Criteria | Application is reachable and response is stable |
| Failure Scenario | WAN or BGP failure blocks access |

## UC-002: BGP Failure Detection

| Field | Description |
|---|---|
| Primary Actor | IT Operations Manager |
| Goal | Detect BGP neighbour failure |
| Precondition | Syslog forwarding is configured |
| Trigger | BGP neighbour goes down |
| Main Flow | Router generates syslog, Splunk receives event, alert is created |
| Success Criteria | Event appears in Splunk dashboard |
| Failure Scenario | Syslog forwarding is not configured |

## UC-003: Isolated Attack Simulation

| Field | Description |
|---|---|
| Primary Actor | Security analyst |
| Goal | Simulate suspicious scanning from isolated VLAN |
| Precondition | Kali host is connected to VLAN 666 |
| Trigger | Nmap scan is launched |
| Main Flow | Kali sends scan traffic, pfSense controls access, Wazuh/Splunk detect suspicious activity |
| Success Criteria | Alert is generated and documented |
| Failure Scenario | Logs are not forwarded or rule is not triggered |

## UC-004: HSRP Gateway Failover

| Field | Description |
|---|---|
| Primary Actor | Network engineer |
| Goal | Verify gateway redundancy |
| Precondition | CSW01 and CSW02 are configured for HSRP |
| Trigger | Active gateway failure |
| Main Flow | Standby switch becomes active, users continue to use HSRP VIP |
| Success Criteria | Gateway remains reachable |
| Failure Scenario | HSRP priority or VLAN configuration is incorrect |

## UC-005: Operational Handover

| Field | Description |
|---|---|
| Primary Actor | IT Operations Team |
| Goal | Take ownership of the completed lab environment |
| Precondition | Testing and documentation are completed |
| Trigger | Project closure |
| Main Flow | Project team provides configs, runbook, diagrams, testing evidence, and known issues |
| Success Criteria | Operations team signs off handover |
| Failure Scenario | Missing documentation delays sign-off |
