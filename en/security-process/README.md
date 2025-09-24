# OpenHarmony Security Vulnerability Governance

A vulnerability is a flaw or weakness in a system's design, implementation, or operation and management that could be exploited to violate the system's security policy(RFC 4949).

 Contents

+ [OpenHarmony Security Vulnerability Governance And Concept](#OpenHarmony Security Vulnerability Governance And Concept)
+ [OpenHarmony Security Vulnerability Handling Policy](#OpenHarmony Security Vulnerability Handling Policy)
+ [OpenHarmony Security Vulnerability Handling Process](#OpenHarmony Security Vulnerability Handling Process)
 + [Collecting Security Vulnerabilities](#collecting-security-vulnerabilities)
 + [Assessing Security Vulnerabilities](#assessing-security-vulnerabilities)
 + [Fixing Security Vulnerabilities](#fixing-security-vulnerabilities)
 + [Disclosing Security Vulnerabilities](#disclosing-security-vulnerabilities)
 
## OpenHarmony Security Vulnerability Governance And Concept
The Openharmony community attaches great importance to the security of the community versions. Despite the industry consensus that security vulnerabilities are inevitable, the OpenHarmony community will adhere to the following principles and actively mitigate potential risks of security vulnerabilities.


1. Active Management: taking steps to reduce security vulnerabilities in products and services;
2. Open Collaboration: cooperate with upstream and downstream communities to provide risk mitigation solutions to customers for security vulnerabilities found in product and services;
## OpenHarmony Security Vulnerability Handling Policy

OpenHarmony community adopts differentiated security vulnerability handling policies for different types of software packages. Please select a proper software package type based on your application scenario in order to reduce the risk security vulnerabilities being exploited.
|software package type|collecting security vulnerabilities|fixing security vulnerabilities|Disclosing Security Vulnerabilities|
|----------|-----------|-----------|-----------|
|LTS versions & Release versoins|support|fix all security vulnerabilities during active maintainence period<br/>fix security vulnerabilities above 7.0(CVSS) during passive maintainence period|assign SA and CVE ID|

about versions lifecycle please refer to: [OpenHarmony Version Lifecycle Management](https://gitcode.com/openharmony/release-management/blob/master/openHarmony-version-lifecycle-management.md)

# OpenHarmony Security Vulnerability Handling Process

The OpenHarmony community has set up a complete security vulnerability handling process in compliance with ISO/IEC 30111 and ISO/IEC 29147 to ensure timely response to community security vulnerabilities and minimize security risks.


## Collecting Security Vulnerabilities

The OpenHarmony community has multiple channels to collect security vulnerabilities from upstream open-source software and native open-source software in the community.


|Source|Channel|Reporting Method|Description|
| -------- |-------- | -------- | -------- |
|Upstream open-source software|cve-manager|Security vulnerability issue*|cve-manager automatically collects security vulnerabilities of upstream open-source software every day and submits CVE issues using the OpenHarmony ci bot account.|
|Upstream open-source software|Contributors|Security vulnerability issue|Community contributors submit issues regarding security vulnerabilities detected in upstream open-source software.|
|Upstream open-source software|Security vulnerability scanning tool|Security vulnerability issue|The LTS versions are scanned for security vulnerabilities every month, and issues will be submitted if security vulnerabilities are detected.|
|Native open-source software|OpenHarmony Security Bounty Program or security researchers|scy@openharmony.io|Security vulnerabilities found in OpenHarmony can be reported via an email encrypted by using the [public key](/publicKey/Scy-OpenHarmony_publickey.asc) to scy@openharmony.io. The OpenHarmony community has launched the [OpenHarmony Security Bounty Program](/en/security-process/rewards_program.md) to encourage the reporters.|

`Security vulnerability issue`: When finding a security vulnerability, create an issue in the repository where the issue is found, select **Private**, and label the issue `Security`.

## Assessing Security Vulnerabilities

The OpenHarmony Security Issue Response Team organizes maintainers to verify the security vulnerabilities reported. The OpenHarmony community assesses security vulnerabilities based on the mainstream [CVSS](https://www.first.org/cvss/calculator/3.1). The table below lists the severity levels and scores of the Common Vulnerability Scoring System (CVSS).

|Severity Rating|Score|
|--------------------------|-----------------|
|Critical|9.0-10.0|
|High|7.0-8.9|
|Medium|4.0-6.9|
|Low|0.1-3.9|

## Fixing Security Vulnerabilities

For confirmed valid security vulnerabilities,the OpenHarmony Security Issue Response Team will organize repairs as soon as possible.If a security vulnerability may generate public opinions or may be exploited, the handling time will be reduced to minimize the impact. 

## Disclosing Security Vulnerabilities

The OpenHarmony community adopts responsible disclosure. After security vulnerabilities are fixed, [security bulletins](/en/security-disclosure/README.md) will be released. You can [subscribe to](https://lists.openatom.io/postorius/lists/security.openharmony.io/) security bulletins by email.
