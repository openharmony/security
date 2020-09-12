# Security Issue Handling and Release Processes

OpenHarmony has adopted the security disclosure and response policies described in this document to ensure that we handle security issues in a timely manner.

Contents

+ [Security Issue Response Team](# "Security Issue Response Team")
+ [Responsibilities](# "Responsibilities")
+ [Security Issue Handling and Disclosure Processes](# "Security Issue Handling and Disclosure Processes")
     + [Collecting Security Issues](# "Collecting Security Issues")
     + [Confirming Security Issues](# "Confirming Security Issues")
     + [Setting up a Fixing Team](# "Setting up a Fixing Team")
      + [Formulating a Fixing Plan](# "Formulating a Fixing Plan")
             + [Evaluating Security Issue Impact](# "Evaluating Security Issue Impact")
        + [Responding to Security Issues](# "Responding to Security Issues")
     + [Organizing Patch Development](# "Organizing Patch Development")
     + [Disclosing the Fixing Progress](# "Disclosing the Fixing Progress")
  + [Reviewing the Fixing Process](# "Reviewing the Fixing Process")


## Security Issue Response Team

This team is responsible for responding to and handling security issues in the community, including internal communication and external disclosure. However, the entire process needs to be completed with the assistance of relevant development engineers and release managers.

### Responsibilities

For details, see [README](https://gitee.com/openharmony/security/blob/master/README.md)


**Fixing Owner**

Track and coordinate each security issue from the time it is reported to the time it is successfully handled.

**Issue Distributor**

- Ensure that all personnel who should handle the issues have been notified.

- Respond to issues that have not been confirmed as security issues.

- Assist in confirming the scoring of security issues in OpenHarmony products.

- Escalate security issues to the issue distributor if there is any disagreement on handling the issues.

- All members of the online security issue response team are responsible for this work and will respond to security issues in the order they are reported.


**Discloser**

- Collect issues to disclose according to rules.
- Submit disclosure applications to the security issue response team, including security notices and security issues.
- Publish public information in compliance with the disclosure principles, including disclosure information, upgrade documents, log changes, explaining the severity to the public, sending security issue notifications to emails, and requesting vulnerability IDs.



**Security Liaison**

This role is not a member of the security issue response team and should be taken by the members who want to join the security issue response team. Each SIG team should designate a SIG member to participate in security activities. They will be responsible for:

+ Preferentially handle security issues distributed to the SIG team.
+ Provide the disclosed security issues in the SIG project.
+ Assist in security process improvement, incentive management, code review, and other security activities that are not disclosed.



## Security Issue Handling and Disclosure Processes

### 1. Collecting Security Issues

####  Routinely Scanning Security Issues

- The OpenHarmony community uses the XXX vulnerability scanning tool to routinely scan and synchronize vulnerabilities disclosed by upstream community software packages.
- The scanned vulnerabilities will be marked as "security issues" and pushed to the corresponding SIG.



#### Internal Reporting

If a bug in the SIG is confirmed as a security vulnerability, the team member changes the corresponding issue to a private issue, adds a security issue label, and adds a priority label as needed. The security issue distributor will periodically check the updates of such issues. The security issue distributor will periodically check the updates of such issues.


####  External Reporting

If a security vulnerability is not on the list of public security vulnerabilities that the OpenHarmony security team has handled, you can handle it as follows:

`Email notification: ` Please immediately send an email to scy@openharmony.io to notify the security issue response team so that the team can start the patch, release, and announcement processes. After receiving the email, the security issue distributor creates a security issue in the community.

`Community issue: ` You can create an issue in the community where the issue is found and mark the issue as a `security issue`. When creating the issue, select the private issue type.

If necessary, the security issue response team will ask whether you can disclose this issue secretly through the person in charge. If you object, we will adopt the public disclosure method.

The vulnerability rewards of the community are being planned and will be available in the future.


### 2. Confirming Security Issues

The security issue distributor will confirm new issues, including:

- For security issues reported externally, determine the affected projects and software packages.
- (Including externally reported issues and security issues) Contact technical support (they will be preferentially selected from the maintainers and committers of the project) to check whether the issue is a new one. After confirmation, distribute the private issue to the corresponding repository.
- For security issues reported externally, notify the issue reporter after confirmation.

Record the confirmation result in the issue progress, and change the issue status to resolving.


### 3. Setting up a Fixing Team

The fixing owner sets up a fixing team, which contains:

- Version or patch release manager

- SIG members of the affected projects, preferentially those who have participated in the issue distribution (defined in the corresponding OWNERS document).



### 4. Formulating a Fixing Plan

For each vulnerability, the fixing owner coordinates with the fixing team and release manager, and sends emails to relevant community members. The fixing owner develops a fixing plan based on his/her best judgment, severity of the issues, the time required for development, and the version plan provided by the release manager.


#### Evaluating Security Issue Impact

The fixing owner and fixing team will use the [CVSS calculator ](https://www.first.org/cvss/calculator/3.1)o create a CVSS. They will use“[severity assessment - how we score the vulnerabilities](https://www.first.org/cvss/user-guide)”to determine the impact and severity of the issues. The fixing owner makes a final evaluation of the risk.

- If the evaluation score is lower than 4.0 (low severity) or the evaluation risk is low, the fixing owner can choose semi-public fixing. This means that the PR is conducted directly on the public OpenHarmony repository and can be discussed on public channels. At the same time, the fixing team can slow down the release process under certain circumstances, such as during holidays. These decisions must be discussed at security meetings.

- If the evaluation score is higher than 4.0 and lower than 7.0 (medium severity), the fixing owner can also choose semi-public fixing. The fixing owner will determine whether public fixing will harm the users and whether to limit the discussion of the security aspects of the issue to private channels.

Note: The fixing owner has the right to classify vulnerabilities by severity.


#### Responding to Security Issues

- If you are handling security issues of OpenHarmony community development projects, all the schedules will be available as soon as possible.
- If not, the fixing process depends on the disclosure schedule of the upstream community. The fixing owner will cooperate with the upstream community to protect users in the community to the largest extent while adapting to the schedule of the upstream community.



### 5. Organizing Patch Development

+ The fixing owner will submit security issues to the OpenHarmony community.
+ The release manager organizes patch development based on the release plan.
+ Fixing files on the private repository have been submitted to the software package library of the corresponding version, or the publicly fixed software packages have been submitted to the corresponding software package library. The release manager will notify the fixing owner of the fixing completion.


### 6. Disclosing the Fixing Progress

As the fix progresses, the fixing owner needs to submit an overall communication plan for the wider community. The overall communication should be started after the fixing team has developed the fixing or mitigation measures so that an achievable plan can be delivered to users.

**Fix Release Date**
The fixing owner provides the new version number, security issue ID (if necessary), severity and impact, and location of binary files to the disclosure owner on the fixing release date within 1 to 21 days after the issue is confirmed to support wider distribution and user operations. The disclosure owner places a notice in the community as soon as possible and should include mitigation measures that users can take before upgrading to the fixed version. Notices will be placed on the
  + [community vulnerability notice page](https://gitee.com/openharmony/security/blob/master/en/security-disclosure/README.md)
  

### 7. Reviewing the Fixing Process

These steps should be completed one to three days after the release date. The review process is aimed at making improvement.

+ The fixing owner sends the issue review process to scy@openharmony.io, including detailed information about each person, execution of the process schedule, PR links related to the introduction of the issue, and handling or suggestions for response and release.
+ The release manager and fixing team are encouraged to send their feedback to scy-priv@openharmony.io. Honest criticism is the only way we can improve our community.
