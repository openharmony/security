# OpenHarmony Security Bounty Program

## Overview

The OpenHarmony community attaches great importance to the security of community software versions. The security issues include issues found during the routine security issue scans and internal security research, as well as security issues reported by users. The OpenHarmony Security Bounty Program (referred to as the "Program" hereinafter) aims to encourage feedback of security vulnerabilities found in the OpenHarmony community to scy@openharmony.io via emails, which should be encrypted by the [PGP public key](/publicKey/Scy-OpenHarmony_publickey.asc). The OpenHarmony Security Issue Response Team will try to address all feedback on a case-by-case basis as soon as possible.

## Program Scope
|Category|Description|
|--------|-------------------|
|Software version|OpenHarmony V3.1 LTS|
|Code repository|Bundle management:<br>https://gitee.com/openharmony/appexecfwk_standard<br>Distributed scheduler:<br>https://gitee.com/openharmony/distributedschedule_dms_fwk_lite<br>https://gitee.com/openharmony/distributedschedule_dms_fwk<br>Startup:<br>https://gitee.com/openharmony/startup_init_lite<br>https://gitee.com/openharmony/startup_appspawn<br>https://gitee.com/openharmony/startup_syspara_lite|

## Security Vulnerability Scoring Criteria

The Common Vulnerability Scoring System (CVSS) is used to rate and score the vulnerabilities reported.

|Severity Rating|Score|
|--------------------------|-----------------|
|Critical|9.0-10.0|
|High|7.0-8.9|
|Medium|4.0-6.9|
|Low|0.1-3.9|

CVSS calculator:
https://www.first.org/cvss/calculator/3.1

## Bounty Program

The reward amount varies depending on the severity level of the security vulnerability and the quality of the report. An effective and high-quality report will receive an additional bonus. The final reward is determined by the OpenHarmony Security Response Team.

| Security Vulnerability Level | Critical | High | Medium | Low |
| ---------------------------- | -------- | ---- | ------ | --- |
|Maximum Payout Amount         | CNY 20,000|CNY 6,000|CNY 3,000|CNY 1,000|

## Security Report Format

The report should contain detailed description of the vulnerability and complete proof-of-concept (PoC). It is better if the report provides complete PoC exploit or code to fix the vulnerability.

**Requirements on the Detailed Vulnerability Description**

The vulnerability description should contain the following:
- Detailed version information about the affected components.
- Description of the issue or symptom found in the component or module.
- Detailed explanation of the code logic in the component or module, which can be composed of decompiled code, disassembled code, or open-source code together with necessary explanation.
- Procedure to reproduce the issue. If multiple steps are required or a specific environment must be used, describe the procedure from an environment where factory settings are restored.

**Requirements on the Complete PoC or Exploit**

- The PoC or exploit contains complete and compilable code, including all source code, dependent libraries, and compilation configuration files.
-  The PoC or exploit contains how to build the compilation and running environment, including the standard compilation environment or a special environment, such as the special compilation or running environment and compilation options.
-  The result of the PoC or exploit is consistent with that described in the report.
- If the PoC or exploit contains structure definitions, describe the structure and how to construct the structure and explain the composition and meaning of the field that triggers the security vulnerability.
-  The PoC and exploit should not infringe any third-party intellectual property rights. For example, the PoC and exploit do not contain unauthorized intellectual material, such as icons, that is owned by a third party.
- The PoC and exploit do not contain religious taboos or content prohibited by law.

**Code to Fix or Mitigate the Vulnerability (Optional)**

- The report contains the detailed solution to fix the vulnerability and the patch code that can be used.

## Vulnerabilities Not Eligible for Reward

The vulnerabilities that are not eligible for reward include but are not limited to:

- Bugs that do not affect security, including but not limited to product function defects, garbled characters on web pages, inconsistent styles, static file directory traversal, and app compatibility issues.
-  Security vulnerabilities that cannot be exploited.
- Other issues that cannot directly reflect the existence of security vulnerabilities, including but not limited to pure conjecture of users.
- Vulnerabilities that cause disclosure of any non-sensitive information.
- Security vulnerabilities in the dependency components of the project.

## **Forbidden Behaviors During Testing**

- Do not access, download, modify, or delete data that does not belong to you without permission. Only PoC is allowed to prove the existence of the vulnerability.
- Phishing or social engineering attacks are prohibited.
- Do not use security vulnerabilities and related information for any illegal purpose. The following activities are prohibited:
1. Access the computer information network or using resources in the computer information network without permission.
2. Delete, modify, or add the functions of the computer information network without permission.
3. Delete, modify, or add data or applications stored, processed, or transmitted in the computer information network without permission.
4. Intentionally produce and spread destructive programs, such as computer viruses.
5. Access the computer information network to obtain data stored in related website systems and platforms without permission.
6. Other behaviors that jeopardize the security of the computer information network.

You should assume all compensation liabilities for any loss caused to OpenHarmony due to the above behavior. If your behavior violates laws and regulations, you should bear the corresponding legal consequences.

## Participant Restriction

Members of the OpenHarmony Security Issue Response Team and related project maintainers and committers cannot participate in this Program.

## Statement

- We hope that you do not disclose or spread security vulnerabilities before they are fixed. We promise that every issue you reported will be tracked, analyzed, handled, and replied to by dedicated personnel in a timely manner.
- Security vulnerabilities should be tested in compliance with laws and regulations. The OpenHarmony community reserves the right to take legal actions against activities that violate laws, administrative regulations, management regulations of the OpenHarmony community, and website agreements, such as exploiting security vulnerabilities to ruin user interests, affecting service provisioning, stealing user data, and maliciously spreading security vulnerabilities or data.

## Special Notes

The preceding terms will take effect as of the date of release. The OpenHarmony Security Issue Response Team may modify the content as required. You will find the latest version on the OpenHarmony official website. Unless otherwise specified, the updated terms will take effect on the date of release. 

If you have any comments or suggestions, please contact scy@openharmony.io.
