# OpenHarmony Security Bounty Program

Release date: September 23, 2023

## Overview

The OpenHarmony community attaches great importance to the security of community software versions. The security issues include issues found during the routine security issue scans and internal security research, as well as security issues reported by users. The OpenHarmony Security Bounty Program (referred to as the "**Program**" hereinafter) aims to encourage feedback of security vulnerabilities found in OpenHarmony to bugbounty@mail.openharmony.io via emails encrypted by the [PGP public key](https://gitee.com/openharmony/security/blob/master/publicKey/Scy-OpenHarmony_publickey.asc). The OpenHarmony Security Issue Response Team will try to address all feedback on a case-by-case basis as soon as possible.

## **Program Scope**

The **Program** applies to the latest OpenHarmony Release version and OpenHarmony LTS versions for standard-, small-, and mini-system devices.

## Security Vulnerability Scoring Criteria

In the OpenHarmony single-device scenario, vulnerabilities are classified into four levels: critical, high, medium, and low, based on their impact.

## Bounty Program

|Vulnerability Level|Vulnerability Example|Maximum Bonus (CNY)|
|-----------|----|----|
| Critical    | 1. Remote execution of arbitrary code in a Trusted Computing Base (TCB).<br>2. Local execution of arbitrary code in a privileged process or TCB (able to bypass kernel mitigations)<br>3. Remote PDoS attack to cause DoS on a device or a condition where the system can be recovered only after being flashed.<br>4. Remote bypass of application installation and some user interaction requirements.<br>5. Remote access to protected data (i.e., data accessible only to privileged processes) without authentication.<br>6. Remote execution of code across devices without authorization in distributed device scenarios. | 1,000,000       |
| High      | 1. Local execution of arbitrary code in a TCB.<br>2. Remote execution of arbitrary code in a common process.<br>3. Bypassing the security mechanism that isolates data between applications.<br>4. Bypassing the security mechanism that isolates users or users' personal data.<br>5. Remote access to protected data (i.e., data accessible to common applications) without authentication.<br>6. Local PDoS attack that causes device unavailability, or a condition where the system can be recovered only after being flashed or reset to factory settings.<br>7. Remote temporary DoS attack that causes remote suspension or restart of the device.<br>8. Remotely enabling or disabling functions that can be initiated only by users or that are available only with user consent without requiring user interactions.<br>9. Bypassing the screen lock.<br>10. Locally bypassing user interactions to implement silent installation.<br>11. Remote execution of code in a large-system device by controlling a mini-, small-, or standard-system device in the distributed device scenario. |500,000|
|Medium|1. Remote execution of arbitrary code in a constrained process.<br>2. Local execution of arbitrary code in a common process.<br>3. Bypassing the mitigation technologies in a privileged process or TCB (If the issue existing in some vulnerability mitigation technologies can directly lead to arbitrary code execution or critical data leakage, the vulnerability severity level can be escalated).<br>4. Local access to protected data (i.e., data accessible to locally installed apps with certain permissions, or data accessible only to privileged processes) without authentication.<br>5. Locally enabling or disabling functions that can be initiated only by users or that are available only with user consent without requiring user interactions.<br>6. Insecure storage of cryptographic algorithms and keys, which causes leakage of sensitive information (the severity level of this vulnerability may vary with its impact).|200,000|
|Low|1. Local execution of arbitrary code in a constrained process.<br>2. Local temporary DoS attack that causes device suspension or restart, affecting system availability.<br>3. Leakage of low-risk information.|10,000|

The bonus amount varies depending on the severity level of the security vulnerability and the quality of the report. The OpenHarmony Security Response Team determines the final bonus based on the factors including but not limited to the following:

- Details in the vulnerability report. The report must comply with the [Report Requirements](#report-requirements) in this **Program** and contain at least the description of the vulnerability and exploit methods, and attack code.

- Initial attack path, which can be remote (zero-click, one-click) or local.

- Whether the attack code is closely related to a specific device or software version, or whether the attack code can be executed on all devices or software versions.

- User perception of the attack process.
- Stability of the attack code.
- Whether the attack code can be executed in the latest stable LTS version.
- System type, security hardening solution, and mitigation measures.

> **NOTE**
>
> The **Program** does not apply to the vulnerabilities that bypass the screen lock using synthetic biometric data (including but are not limited to fingerprints and counterfeit masks).

## **Vulnerabilities Not Eligible for Reward**

- Software functional errors that do not affect security.
- Exploits that reply on tricking users, such as phishing or clickjacking.
- Vulnerabilities that affect not only the OpenHarmony (including but not limited to protocols and third-party open-source software). You are advised to submit them to the corresponding channels. However, the vulnerabilities that have great impact on OpenHarmony can be treated as an exception.
- Vulnerabilities whose technical details (e.g. PoC) have been disclosed by means of websites, we-media, email groups, public speeches, and instant chat groups, before being reported to the OpenHarmony community.
- Vulnerabilities that are not reported for the first time. For a vulnerability repeatedly reported by one or more persons, only the first report is eligible for reward.
- Vulnerabilities which can be exploited and exert impact only under certain permissions, while an attacker can use the permissions to produce the same impact without exploiting the vulnerabilities.
- Vulnerabilities that can only be triggered locally, causing temporary DoS of the application.
- Other invalid vulnerabilities.

## Report Requirements

The security vulnerability report should contain detailed description of the vulnerability and a complete PoC. It will be better if the report provides complete exploit or fix code.

**Vulnerability Description**

The vulnerability description should include:

- Detailed version information about the affected components.
- Description of the issue or symptom found in the component or module.
- Detailed explanation of the code logic in the component or module, which can be composed of decompiled code, disassembled code, or open-source code with necessary explanation.
- Complete procedure to reproduce the issue. If multiple steps are required or a specific environment must be used, describe the procedure in the environment after factory settings are restored.

**PoC or Exploit**

- The PoC or exploit contains complete and compilable code, including all source code, dependent libraries, and compilation files.
- The PoC or exploit contains how to build the compilation and running environment, including the standard compilation environment or a special environment, such as the special compilation or running environment and compilation options.
- The result of the PoC or exploit is consistent with that described in the report.
- If the PoC or exploit contains struct definitions, describe the structs and how to construct the structs and explain the composition and meaning of the field that triggers the security vulnerability.
- The PoC and exploit should not infringe any third-party intellectual property rights. For example, the PoC and exploit do not contain unauthorized intellectual material, such as icons, that is owned by a third party.
- The PoC and exploit do not contain religious taboos or content prohibited by law.

 **(Optional) Code to Fix or Mitigate the Vulnerability**

The report contains the detailed solution to fix the vulnerability and the patch code that can be used.

## Terminology

| Term                       | Description                                                  |
| -------------------------- | ------------------------------------------------------------ |
| Remote                     | The attacker can exploit a vulnerability to launch attacks without installing apps or physically accessing the target device, for example, by browsing web pages, reading SMS or MMS messages, sending and receiving emails, downloading files, and communicating over wireless networks. |
| Local                      | The attacker needs to install apps in or physically access the target device, in order to exploit a vulnerability to launch attacks. |
| TCB                        | A Trusted Computing Base (TCB) is everything in a computing system that provides a secure environment for operations. It includes the hardware, firmware, software, and components executing security policies. It establishes a basic protection environment and provides additional user services required by a trusted computer system, including but not limited to some kernels and drivers, or user services equivalent to kernels, such as init and vold. |
| Privileged process         | An application or process running in the system_app domain of SELinux, including processes running with system-level and root permissions. |
| Common application process | Third-party application processes or built-in application processes without system-level permissions. |
| Constrained process        | A process that is significantly more limited than a common application process. |



## **Forbidden Behaviors During Testing**

- Do not access, download, modify, or delete data that does not belong to you without permission. Only PoC is allowed to prove the existence of the vulnerability.

- Phishing or social engineering attacks are prohibited.

- Do not use security vulnerabilities and related information for any illegal purpose. The following activities are prohibited:

  1) Access the computer information network or using resources in the computer information network without permission.

  2) Delete, modify, or add the functions of the computer information network without permission.

  3) Delete, modify, or add data or applications stored, processed, or transmitted in the computer information network without permission.

  4) Intentionally produce and spread destructive programs, such as computer viruses.

  5) Access the computer information network to obtain data stored in related website systems and platforms without permission.

  6) Other behaviors that jeopardize the security of the computer information network.

You shall be fully liable for any loss caused to the OpenHarmony community due to the above behaviors. If your behavior violates laws and regulations, you should bear the corresponding legal consequences.

## Participant Restriction

Members of the OpenHarmony Security Issue Response Team and related project maintainers and committers cannot participate in this **Program**.

## Statement

1. We hope that you do not disclose or spread security vulnerabilities before they are fixed. We promise that every issue you reported will be tracked, analyzed, handled, and replied to by dedicated personnel in a timely manner, and your contribution will be awarded according to the [Bounty Program](#bounty-program).

2. Security vulnerabilities should be tested in compliance with laws and regulations. The OpenHarmony community reserves the right to take legal actions against activities that violate laws, administrative regulations, management regulations of the OpenHarmony community, and website agreements, such as exploiting security vulnerabilities to ruin user interests, affecting service provisioning, stealing user data, and maliciously spreading security vulnerabilities or data.

## Effectiveness and Modification

The **Program** takes effect as of the date of release. The OpenHarmony Security Issue Response Team may modify the **Program** as required. You will find the latest version on the OpenHarmony official website. Unless otherwise specified, the updated version takes effect as of the date of release.

If you have any comments or suggestions, please contact bugbounty@mail.openharmony.io.

