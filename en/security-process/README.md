# OpenHarmony Security Vulnerability Handling Process

The OpenHarmony community has set up a complete security vulnerability handling process in compliance with ISO/IEC 30111 and ISO/IEC 29147 to ensure timely response to community security vulnerabilities and minimize security risks.

Contents

+ [Collecting Security Vulnerabilities](#collecting-security-vulnerabilities)
+ [Assessing Security Vulnerabilities](#assessing-security-vulnerabilities)
+ [Fixing Security Vulnerabilities](#fixing-security-vulnerabilities)
+ [Disclosing Security Vulnerabilities](#disclosing-security-vulnerabilities)



## Collecting Security Vulnerabilities

The OpenHarmony community has multiple channels to collect security vulnerabilities from upstream open-source software and native open-source software in the community.


|Source|Channel|Reporting Method|Description|
| -------- |-------- | -------- | -------- |
|Upstream open-source software|cve-manager|Security vulnerability issue*|cve-manager automatically collects security vulnerabilities of upstream open-source software every day and submits CVE issues using the OpenHarmony ci bot account.|
|Upstream open-source software|Contributors|Security vulnerability issue|Community contributors submit a security vulnerability issue when finding security vulnerabilities in upstream open-source software.|
|Upstream open-source software|Security vulnerability scanning tool|Security vulnerability issue|The LTS versions are scanned for security vulnerabilities every month, and issues will be submitted if security vulnerabilities are detected.|
|Native open-source software|OpenHarmony Security Bounty Program or security researchers|scy@openharmony.io|Security vulnerabilities found in OpenHarmony can be reported via an email encrypted by using the [public key](/publicKey/Scy-OpenHarmony_publickey.asc) to scy@openharmony.io. The OpenHarmony community has launched the [OpenHarmony Security Bounty Program](/en/security-process/rewards_program.md) to encourage the reporters.|

`Security vulnerability issue`: When finding a security vulnerability, create an issue in the repository where the issue is found, select **Private**, and label the issue `Security`.

## Assessing Security Vulnerabilities

The OpenHarmony Security Issue Response Team organizes maintainers to verify the security vulnerabilities reported. The OpenHarmony community assesses security vulnerabilities based on the mainstream [CVSS] (https://www.first.org/cvss/calculator/3.1). The table below lists the severity levels and scores of the CVSS.

|Severity Rating|Score|
|--------------------------|-----------------|
|Critical|9.0-10.0|
|High|7.0-8.9|
|Medium|4.0-6.9|
|Low|0.1-3.9|

## Fixing Security Vulnerabilities

The maximum handling time is set based on the vulnerability severity level to ensure security vulnerabilities of higher severity levels to be handled in a timely manner.

|Severity Rating|Maximum Handling Time (Day)|
|--------------------------|-----------------|
|Critical|7|
|High|14|
|Medium|30|
|Low|30|

If a security vulnerability may generate public opinions or may be exploited, the handling time will be reduced to one to three days to minimize the impact. However, it cannot be guaranteed that all security vulnerabilities will be fixed within the specified time due to complexity in vulnerability fixing.

## Disclosing Security Vulnerabilities

The OpenHarmony community submits responsible disclosures. After security vulnerabilities are fixed, [security bulletins](/en/security-disclosure/README.md) are released. You can [subscribe to](https://lists.openatom.io/postorius/lists/security.openharmony.io/) security bulletins by email.
