# SSTS 系统安全测试

SSTS（System Security Test Suite，系统安全测试套）用于对使用OpenHarmony系统的设备进行安全补丁测试，验证是否存在（来源于OpenHarmony安全公告的）已知系统安全漏洞。SSTS安全认证作为兼容性认证社区活动一部分，厂商需要通过SSTS测评，否则无法被授予OpenHarmony兼容性认证证书。

SSTS用例分为静态和动态两种格式：

- 静态指的是对系统中漏洞补丁涉及的特定文件进行静态扫描验证，保证其中补丁代码的存在。目前使用yara规则匹配工具作为补丁特征识别的引擎。
- 动态指的是在待测设备中运行PoC（Proof-of-Concept，漏洞验证程序），通过检查是否能触发某种状态验证漏洞是否修复。PoC可以是应用或二进制程序等形态。

下面针对SSTS用例的输出和提交进行说明。

# 1 SSTS用例输出

目前主要输出的是使用yara规则的静态SSTS用例，验证的目标有二进制可执行程序或动态链接库等。无论是验证的哪一种文件，最终一个漏洞对应的静态SSTS用包含**用例信息JSON文件**和用例包含的**yara规则文件**（一般一条SSTS用例只需要一条yara规则，部分特殊情况可能需要多个），命名格式如下：

```
TestCaseInfo-OpenHarmony-SA-2023-0101.json     # 用例信息JSON文件（唯一）
TestCaseRule-OpenHarmony-SA-2023-0101-1.yara   # yara规则文件1
TestCaseRule-OpenHarmony-SA-2023-0101-2.yara   # yara规则文件2
```

用例信息JSON文件以TestCaseInfo和漏洞编号（OpenHarmony-SA或CVE，有OpenHarmony-SA优先使用OpenHarmony-SA）命名。yara规则文件以TestCaseRule和漏洞编号命名。上面的例子漏洞编号为`OpenHarmony-SA-2023-0101`。

## 1.1 用例信息输出

以下是`TestCaseInfo-OpenHarmony-SA-2023-0101.json`用例信息文件模板：

```json
{
    "month": "2023-01",
    "release_time": "2023-01-01 14:53:08.541376",
    "vulnerabilities": [
        {
            "month": "2023-01",
            "vul_id": {
                "cve": "CVE-2023-0035",
                "openharmony-sa": "OpenHarmony-SA-2023-0101"
            },
            "severity": "medium",
            "vul_description": {
                "zh": "通信子系统软总线部件softbus_client_stub存在校验绕过漏洞，可发起SA中继攻击",
                "en": "softbus_client_stub in communication subsystem has an authentication bypass vulnerability which allows an 'SA relay attack'."
            },
            "vul_impact": {
                "zh": "攻击者可在本地内发起攻击，造成校验绕过，可进一步提权攻击其他SA",
                "en": "Local attackers can bypass authentication and attack other SAs with high privilege."
            },
            "disclosure": {
                "zh": "https://gitee.com/openharmony/security/blob/master/zh/security-disclosure/2023/2023-01.md",
                "en": "https://gitee.com/openharmony/security/blob/master/en/security-disclosure/2023/2023-01.md"
            },
            "patch_info": {
                "3.0.x": {
                    "patch_url": [
                        "https://gitee.com/openharmony/communication_dsoftbus/pulls/2140"
                    ],
                    "patch_file": [
                        "https://gitee.com/openharmony/communication_dsoftbus/pulls/2140.patch"
                    ],
                    "diff_file": [
                        "https://gitee.com/openharmony/communication_dsoftbus/pulls/2140.diff"
                    ]
                }
            },
            "affected_projects": "communication_dsoftbus",
            "object_type": "kernel_linux",
            "affected_versions": [
                "3.0.0-3.0.5"
            ],
            "affected_device": {
                "mini": {
                    "liteos": {
                        "rics-v": {
                            "scan_strategy": {
                                "ssts": {
                                    "enable": false
                                },
                                "ists": {
                                    "enable": false
                                }
                            }
                        }
                    }
                },
                "small": {
                    "liteos": {
                        "rics-v": {
                            "scan_strategy": {
                                "ssts": {
                                    "enable": false
                                },
                                "ists": {
                                    "enable": false
                                }
                            }
                        }
                    },
                    "linux": {
                        "arm": {
                            "scan_strategy": {
                                "ssts": {
                                    "enable": false
                                },
                                "ists": {
                                    "enable": false
                                }
                            }
                        }
                    }
                },
                "standard": {
                    "linux": {
                        "arm": {
                            "scan_strategy": {
                                "ssts": {
                                    "enable": false
                                },
                                "ists": {
                                    "enable": true,
                                    "yara": {
                                        "affected_files": [
                                            "/system/lib/libsoftbus_server.z.so",
                                            "/system/lib64/libsoftbus_server.z.so"
                                        ],
                                        "yara_rules": [
                                            "TestCaseRule-OpenHarmony-SA-2023-0101-1.yara",
                                            "TestCaseRule-OpenHarmony-SA-2023-0101-2.yara"
                                        ]
                                    }
                                }
                            }
                        },
                        "arm64": {
                            "scan_strategy": {
                                "ssts": {
                                    "enable": false
                                },
                                "ists": {
                                    "enable": false
                                }
                            }
                        }
                    }
                }
            }
        }
    ]
}
```

字段含义：

第一部分是漏洞信息：

- month 漏洞公告月份
- vul_id  漏洞编号
- severity  漏洞严重级别
- vul_description  漏洞描述
- vul_impact  漏洞影响
- disclosure  漏洞披露网址
- patch_info  漏洞补丁链接
- affected_projects  影响子系统
- object_type  影响的目标文件类型，当为Linux内核类型时，此字段必填，且值为“kernel_linux”
- affected_versions  影响版本

第二部分是用例信息：

- affected_device  影响设备类型。这里面会注明针对哪些设备执行SSTS/ISTS用例。由于目前OpenHarmony当前只涉及标准设备和ARM32架构，针对standard->linux->arm->scan_strategy->ists->yara中的affected_files和yara_rules字段进行修改即可。其中affected_files表示漏洞影响的二进制文件，规则会针对这里面的文件进行扫描。yara_rules表示yara规则文件名。注意文件和规则列表是一一对应的，比如第一个文件对应第一条规则。多个文件和规则间为or（或）关系，只要有一条规则通过即可。

## 1.2 yara规则输出

以下是`TestCaseRule-OpenHarmony-SA-2023-0101.yara`文件模板：

```
import "console"

rule TestCaseRule_OpenHarmony_SA_2023_0101
{
    meta:
        date = "2023-01-01"
        file = ""

    strings:
        $fix = "xxxxx"

    condition:
        $fix and console.log("OpenHarmony-SA-2023-0101 testcase pass")
}
```

注意：

- 规则名为TestCaseRule和漏洞编号拼接而成
- meta中信息仅为提示作用，不对规则运行产生影响
- 每条yara规则最后一定要加上`testcase pass`，否则引擎无法收集验证成功的信息

### 1.2.1 字符串特征

例如修改后的代码增加了一段写入InterfaceToken的代码，其中会在写入失败时输出日志`write InterfaceToken failed!`：

```c++
int32_t BusCenterClientProxy::OnLeaveLNNResult(const char *networkId, int retCode)
{
    sptr<IRemoteObject> remote = Remote();
    if (remote == nullptr) {
        SoftBusLog(SOFTBUS_LOG_LNN, SOFTBUS_LOG_ERROR, "remote is nullptr");
        return SOFTBUS_ERR;
    }
    if (networkId == nullptr) {
        SoftBusLog(SOFTBUS_LOG_LNN, SOFTBUS_LOG_ERROR, "invalid parameters");
        return SOFTBUS_ERR;
    }
    MessageParcel data;
    // 下面4行为新增的代码
    if (!data.WriteInterfaceToken(GetDescriptor())) {
        SoftBusLog(SOFTBUS_LOG_LNN, SOFTBUS_LOG_ERROR, "write InterfaceToken failed!");
        return SOFTBUS_ERR;
    }
    if (!data.WriteCString(networkId)) {
        SoftBusLog(SOFTBUS_LOG_LNN, SOFTBUS_LOG_ERROR, "write networkId failed");
        return SOFTBUS_ERR;
    }
    if (!data.WriteInt32(retCode)) {
        SoftBusLog(SOFTBUS_LOG_LNN, SOFTBUS_LOG_ERROR, "write retCode failed");
        return SOFTBUS_ERR;
    }
    MessageParcel reply;
    MessageOption option;
    if (remote->SendRequest(CLIENT_ON_LEAVE_RESULT, data, reply, option) != 0) {
        SoftBusLog(SOFTBUS_LOG_LNN, SOFTBUS_LOG_ERROR, "OnLeaveLNNResult send request failed");
        return SOFTBUS_ERR;
    }
    int32_t serverRet;
    if (!reply.ReadInt32(serverRet)) {
        SoftBusLog(SOFTBUS_LOG_LNN, SOFTBUS_LOG_ERROR, "OnLeaveLNNResult read serverRet failed");
        return SOFTBUS_ERR;
    }
    return serverRet;
}
```

这个`write InterfaceToken failed!`字符串如果在代码中唯一，则可以作为特征字符串。

假设编译得到的文件是`/system/lib/libsoftbus_server.z.so`，用`strings`命令验证`/system/lib/libsoftbus_server.z.so`中存在`write InterfaceToken failed!`后，yara规则输出为：

```
import "console"

rule TestCaseRule_OpenHarmony_SA_2023_0101
{
    meta:
        date = "2023-01-13"
        file = "/system/lib/libsoftbus_client.z.so"

    strings:
        $fix_string = "write InterfaceToken failed!"

    condition:
        $fix and console.log("OpenHarmony-SA-2023-0101 testcase pass")
}
```

### 1.2.2 指令特征

例如修改前的源代码为：

```c++
WifiScanParams params;
params.ssid = data.ReadCString();
params.bssid = data.ReadCString();
```

修改后的源代码为：

```c++
WifiScanParams params;
readStr = data.ReadCString();
params.ssid = (readStr != nullptr) ? readStr : "";
readStr = data.ReadCString();
params.bssid = (readStr != nullptr) ? readStr : "";
```

这里没有直接的字符串特征，因此需要寻找指令特征。

假设这里设备中的文件对应的是`/system/lib/libwifi_scan_ability.z.so`，从两个分别刷了含漏洞补丁和不含漏洞补丁版本的设备中取出此二进制文件，导入反汇编和反编译编译软件分析，或借助二进制对比工具对比，在相似度（Similarity）较低的函数中寻找代码修改的部分。

定位到修改前的指令十六进制为：

```
0001b0cc 00 f0 28 ef    blx        <EXTERNAL>::OHOS::Parcel::ReadCString
0001b0d0 01 46          mov        param_2,param_1
0001b0d2 20 46          mov        param_1,r4
0001b0d4 00 f0 2c ef    blx        <EXTERNAL>::std::__h::basic_string<>::assign
0001b0d8 58 46          mov        param_1,r11
0001b0da 00 f0 22 ef    blx        <EXTERNAL>::OHOS::Parcel::ReadCString
0001b0de 01 46          mov        param_2,param_1
```

定位到修改后的指令十六进制为：

```
0001b0ce 00 f0 30 ef    blx        <EXTERNAL>::OHOS::Parcel::ReadCString
0001b0d2 58 4d          ldr        r5,[DAT_0001b234]
0001b0d4 01 46          mov        param_2,param_1
0001b0d6 00 28          cmp        param_2,#0x0
0001b0d8 20 46          mov        param_1,r4
0001b0da 7d 44          add        r5,pc
0001b0dc 08 bf          it         eq
0001b0de 29 46          mov.eq     param_2,r5
0001b0e0 00 f0 2e ef    blx        <EXTERNAL>::std::__h::basic_string<>::assign
0001b0e4 58 46          mov        param_1,r11
0001b0e6 00 f0 24 ef    blx        <EXTERNAL>::OHOS::Parcel::ReadCString
0001b0ea 00 28          cmp        param_1,#0x0
0001b0ec 18 bf          it         ne
```

在确保选取的指令特征的长度足够长能保证唯一、没有重复的特征，但同时长度也不能太长，要尽可能不受其他代码修改的影响的情况下，最终得到yara规则输出为：

```
import "console"

rule TestCaseRule_OpenHarmony_SA_2023_0301
{
    meta:
        date = "2023-03-08"
        file = "/system/lib/libwifi_scan_ability.z.so"

    strings:
        $vul = {00 f0 ?? ef 01 46 20 46 00 f0 ?? ef}
        $fix = {00 f0 ?? ef ?? 4d 01 46 00 28 20 46 7d 44 08 bf 29 46}

    condition:
        ((not $vul) or $fix) and console.log("OpenHarmony-SA-2023-0301 testcase pass")
}
```

# 2 SSTS用例验证

这里说明单SSTS用例的验证方式。需要使用SSTS引擎。

下载引擎后，将SSTS用例放入引擎目录中的`testcases`目录（注意不是仓库的`testcases`目录）：

```
testcases
├─TestCaseInfo-OpenHarmony-SA-2023-0101.json
├─TestCaseRule-OpenHarmony-SA-2023-0101.yara
└─TestSuite.json
```

然后编辑`TestSuite.json`文件中的`vul-info-file`字段填写为要验证的SSTS用例信息文件名，如`TestCaseInfo-OpenHarmony-SA-2023-0101.json`，其他字段固定不变即可：

```json
{
    "description": "Configuration for yara demo Tests",
    "driver": {
        "type": "OHYaraTest",
        "yara-bin": "yara64.exe",
        "version-mapping-file": "openHarmony_version_mapping.json",
        "vul-info-file": "TestCaseInfo-OpenHarmony-SA-2023-0101.json",
        "tools-hap-info": {
            "hap-file": "sststool.hap",
            "bundle-name": "com.example.sststool"
        }
    },
    "kits": [
    ]
}
```

回到上层目录，连接待测设备后，运行`run.bat`。运行成功后在打开的命令行窗口中输入`run ssts`。最终会在`reports`目录中产生运行结果报告。

当报告为以下情况时表示用例可用：
- 对于未修复的版本，验证结果为failed
- 对于已修复的版本，验证结果为passed

# 3 SSTS用例提交

SSTS用例自验证通过后，将例如下面的漏洞信息文件和yara规则文件提交到本仓库的`zh/security-vulntest/testcases`下对应的年月目录中，文件夹以漏洞编号命名，例如：

```
testcases
└─2023
  ├─01
  | └─OpenHarmony-SA-2023-0101
  |   ├─TestCaseInfo-OpenHarmony-SA-2023-0101.json
  |   └─TestCaseRule-OpenHarmony-SA-2023-0101.yara
  ├─02
  └─03
```

需要使用标准fork和pull request流程提交。