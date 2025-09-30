# OpenHarmony社区漏洞治理

漏洞是指系统设计、部署、运营和管理中，可被利用于违反系统安全策略的缺陷或弱点（RFC4949）。

目录
+ [OpenHarmony社区安全漏洞治理主张及理念](#OpenHarmony社区安全漏洞治理主张及理念)
+ [OpenHarmony社区安全漏洞处理策略](#OpenHarmony社区安全漏洞处理策略)
+ [OpenHarmony社区安全漏洞处理流程](#OpenHarmony社区安全漏洞处理流程)
 + [安全漏洞感知](#安全漏洞感知)
 + [验证&评估](#验证&评估)
 + [安全漏洞修复](#安全漏洞修复)
 + [安全漏洞披露](#安全漏洞披露)

## OpenHarmony社区安全漏洞治理主张及理念

OpenHarmony社区非常重视社区版本的安全性，尽管业界共识安全漏洞是不可避免的，但OpenHarmony社区仍将秉承如下原则，积极的消减安全漏洞的潜在风险。

1. 主动管理：采取措施减少产品和服务中的安全漏洞；
2. 开放协同：与社区上下游通力合作，对发现的产品和服务中的安全漏洞，及时向客户提供风险消减方案；

## OpenHarmony社区安全漏洞处理策略

OpenHarmony社区对不同应用类型软件包采用差异化的安全漏洞处理策略，请结合您的具体应用场景选择合适的软件包类型，以降低安全漏洞潜在被利用风险。

|软件包类型|安全漏洞感知|安全漏洞修复|安全漏洞披露|
|----------|-----------|-----------|-----------|
|LTS版本&Release版本|支持|在主动维护期内修复全量安全漏洞<br/>在被动维护期内修复CVSS评分7.0及以上的安全漏洞|发布SA和CVE|

版本生命周期请参考：[OpenHarmony生命周期发布公告](https://gitcode.com/openharmony/release-management/blob/master/OpenHarmony%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F%E5%8F%91%E5%B8%83%E5%85%AC%E5%91%8A.md)

## OpenHarmony社区安全漏洞处理流程
OpenHarmony社区遵循ISO/IEC 30111、ISO/IEC 29147等标准建立完整的安全漏洞处理流程，以确保社区安全漏洞得到及时响应和风险消减。

### 安全漏洞感知

OpenHarmony社区针对上游开源软件以及社区内原创开源软件，建立了多种安全漏洞感知和接收渠道，包括社区贡献者主动提交安全漏洞issue、cve-manager获取已公开的上游软件安全漏洞、通过安全响应工作组邮箱和安全漏洞奖励计划获取社区相关的安全漏洞等。


|开源仓库类型|感知渠道|上报方式|详细介绍|
| -------- |-------- | -------- | -------- |
|上游开源软件|cve-manager|安全漏洞issue*|每天同步上游开源软件安全漏洞，通过OpenHarmony ci bot账号自动提交cve issue。|
|上游开源软件|社区贡献者|安全漏洞issue|识别上游开源软件安全漏洞并提交一个安全漏洞issue。|
|上游开源软件|安全漏洞扫描工具|安全漏洞issue|每月对LTS版本进行安全漏洞扫描，并提交安全漏洞issue。|
|原创开源软件|奖励计划/安全研究者|安全响应工作组邮箱scy@openharmony.io|请将邮件加密后上报 [(公钥)](/publicKey/Scy-OpenHarmony_publickey.asc)，为鼓励安全漏洞上报，OpenHarmony开展了[安全漏洞奖励计划项目](/zh/security-process/rewards_program.md)。|

`安全漏洞issue:` 你可以在发现问题的社区中创建问题issue，并标记成`安全问题`，创建问题的时候请选择“私有”issue。

### 验证&评估

对OpenHarmony社区感知到的疑似安全漏洞，社区安全响应工作组会组织maintainer对问题有效性进行验证。OpenHarmony社区采用业界普遍使用[CVSS标准](https://www.first.org/cvss/calculator/3.1)开展安全漏洞评估，基于安全漏洞的CVSS评分将安全漏洞分为4个严重等级。

|严重等级（Severity Rating）|CVSS评分（Score）|
|--------------------------|-----------------|
|致命（Critical）|9.0 - 10.0|
|高（High）|7.0 - 8.9|
|中（Medium）|4.0 - 6.9|
|低（Low）|0.1 - 3.9|

### 安全漏洞修复

对于确认有效的安全漏洞，安全响应工作组会组织尽快完成修复。如果该安全漏洞可能会产生舆情，或者可能被外部利用，为降低此类安全漏洞造成的影响，社区将会提升处理优先级。  

### 安全漏洞披露

OpenHarmony社区遵循负责任的披露原则，安全漏洞修复后发布[安全公告](/zh/security-disclosure/README.md)，安全公告支持邮件订阅，您可以通过[“Security-bulletin”链接](https://lists.openatom.io/postorius/lists/security.openharmony.io/)订阅OpenHarmony社区的安全公告。

