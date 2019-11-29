# HMS PushKit Bindings for Xamarin.Android Projects

## Before You Start / 前言

**This project (and me) is not affiliated with Huawei. This is not an official SDK or official port. Bindings do not change any behavior or logic of the original SDK (unless the usage is incompatible with C#), so please direct all SDK-related issues to Huawei.**

**此项目并非官方项目，我也不是华为技术人员。请将所有 SDK 相关问题提交给华为开发者联盟技术支持部门，此项目不接受 SDK Issues。Xamarin bindings 并不改变原 SDK 使用方式和工作原理，所以 bindings 项目几乎不会引入新问题（除个别极端情况外）。**

## Intro / 简介

The solution contains Xamarin.Android bindings targeting Android 9.0 (API level 28) for the following Java packages:

Solution 文件包含以下运行目标为安卓 9.0 (API level 28) 的 Xamarin bindings 项目：

- com.huawei.hmf:tasks:1.3.1.301
- com.huawei.agconnect:agconnect-core:1.0.0.300
- com.huawei.hms:network-common:1.0.9.302
- com.huawei.hms:network-grs:1.0.9.302
- com.huawei.hms:base:3.0.2.300
- com.huawei.hms:opendevice:3.0.2.300
- **com.huawei.hms:push:3.0.2.300**

Packages not bolded are referenced by PushKit during Gradle build, and are included here only as dependencies.

其中，粗体之上的包是 Java SDK 在 Gradle 构建时引用的。这些包在此项目中也只作为依赖编译。

Their bindings DO NOT expose Java classes or methods to C# side. However, this can be changed by uncommenting `<remove-node>` lines in the **Transform\Metadata.xml** file under each project folder. Due to subtle differences between Java and C#, if you decided to continue down this path, you may need to familiarize yourself with [the syntax of Metadata file](https://docs.microsoft.com/en-us/xamarin/android/platform/binding-java-library/customizing-bindings/java-bindings-metadata), and customize your bindings until you see no warning or error in the build log. Do note that some warnings, although not errors, are feature-breaking and CAN cause runtime malfunction/crash if left checked.

意味着非粗体的 bindings 并不暴露任何可在 Xamarin/C# 中调用的类和函数。如果需要构建这些包的完整 bindings，打开每个项目文件夹下的 **Transform\Metadata.xml** 文件并删除所有以 `<remove-node>` 开头的行即可。某些 bindings 可能需要自定义暴露的接口以修正所有警告和编译错误，开发者需要补充[有关 Metadata 文件的知识](https://docs.microsoft.com/en-us/xamarin/android/platform/binding-java-library/customizing-bindings/java-bindings-metadata)才能正确构建完整 bindings。注意，虽然警告并不影响编译，部分警告会导致运行时问题或崩溃；尽量确认构建时没有有关 bindings 的警告和错误。

## Namespace/Class Names Mapping / 命名规则

By convention, namespaces (`package`s in Java talk) are changed to be .NET-friendly. Some class names are also changed for consistency.

根据 Xamarin 命名规则并为了保持一致，部分 Java 包和类的名称已调整。请参见下表。

| Java Names | C# Names |
|-------------------------|--------------------|
| `com.huawei.hms.*` | `Huawei.HMS.*` |
| `com.huawei.hms.push.HmsMessageService` | `Huawei.HMS.Push.HMSMessageService` |
| `com.huawei.hms.push.HmsMessaging` | `Huawei.HMS.Push.HMSMessaging` |
| `com.huawei.hms.support.api.push.service.HmsMsgService` | `Huawei.HMS.Support.API.Push.Service.HMSMessageService` |

## Consumption & NuGet / 使用

A Batch script is included to build and package all projects into NuGet packages (*.nupkg*). You must have `nuget.exe` available on path, and have Xamarin.Android/C# build tools installed (preferably from Visual Studio), to use the script.

开发者可以使用根目录的批处理脚本构建并封装所有项目为 NuGet 包，以便在 Android App 项目中引用。批处理需要 `%PATH%` 环境变量中包含 `nuget.exe` 的路径，并且已安装 Xamarin 和 C# 相关构建环境，通常安装 Visual Studio 时已一同安装。

You can also import all projects into your Android app solution and reference `HMS.Push` project.

另外，开发者可以在 Android App Solution 中导入这里的所有项目并引用其中的 `HMS.Push`。

For further development instructions, check the [official docs (link is in Chinese)](https://developer.huawei.com/consumer/cn/service/hms/catalog/huaweipush_v3.html?page=hmssdk_huaweipush_devguide_client_v3).

有关 PushKit 的使用帮助，请查阅[华为官方文档](https://developer.huawei.com/consumer/cn/service/hms/catalog/huaweipush_v3.html?page=hmssdk_huaweipush_devguide_client_v3)。
