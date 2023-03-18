# shirates-samples-job1

This is an example of scripting for running Android/iOS tests. (for Mac only)

## Script files

| Script file        | Description              |
|--------------------|--------------------------|
| runtest-all.sh     | executes all scripts     |
| runtest-android.sh | run test in Android mode |
| runtest-ios.sh     | run test in iOS mode     |

## Prerequisite

https://github.com/ldi-github/shirates-core/blob/main/doc/markdown/quick-start.md

## Specifying target test

Implement **tasks.test** in `build.gradle.kts` as follows.

```kotlin
    // Filter test methods
val envIncludeTestMatching = System.getenv("includeTestsMatching") ?: "*"
val list = envIncludeTestMatching.split(",").map { it.trim() }
filter {
    for (item in list) {
        println("includeTestMatching($item)")
        includeTestsMatching(item)
    }
}
```

Now you can specify the test that you want to run with environment variable `includeTestsMatching`.

#### Specific tests

```
export includeTestsMatching="product1.Test1,product1.Test2,product1.Test3"
```

#### All tests

```
export includeTestsMatching="*"
```

## runtest-android.sh

```shell
export SR_os="android"
export SR_testrunFile="testConfig/testrun.properties"
export SR_configFile="testConfig/androidSettingsConfig.json"
export SR_profile="Pixel 3a API 31(Android 12)"
export includeTestsMatching="product1.Test1"
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
echo "/// Starting test"
sh ./gradlew cleanTest test -x compileKotlin --info
```

## runtest-ios.sh

```shell
export SR_os="ios"
export SR_testrunFile="testConfig/testrun.properties"
export SR_configFile="testConfig/iOSSettingsConfig.json"
export SR_profile="iPhone 14(16.2)"
export includeTestsMatching="product1.Test1"
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
echo "/// Starting test"
sh ./gradlew cleanTest test -x compileKotlin --info
```

## SR_ prefix

Environment variables with `SR_` prefix are routed to Shirates parameters.
See also
[running_with_gradle](https://github.com/ldi-github/shirates-core/blob/main/doc/markdown/in_action/running_test_on_ci_server/running_with_gradle.md)

## runtest-all.sh

```shell
sh ./runtest-android.sh
sh ./runtest-ios.sh
```

## Run all tests

1. Open this project in IntelliJ IDEA.
2. Right-click on the script file(`runtest-all.sh`) and select `Run`.

You can see like this.

```
wave1008@SNB-M1 shirates-samples-job1 % /bin/zsh /Users/wave1008/github/wave1008/shirates-samples-job1/runtest-all.sh
/// Starting test
Initialized native services in: /Users/wave1008/.gradle/native
Initialized jansi services in: /Users/wave1008/.gradle/native
Found daemon DaemonInfo{pid=13483, address=[7fab0fd4-dbb5-43cd-b6d4-1dfab7cf4b54 port:59314, addresses:[/127.0.0.1]], state=Idle, lastBusy=1679146708316, context=DefaultDaemonContext[uid=53663b64-db53-4db7-9a12-073828b9e9bf,javaHome=/Users/wave1008/Library/Java/JavaVirtualMachines/azul-17.0.3/Contents/Home,daemonRegistryDir=/Users/wave1008/.gradle/daemon,pid=13483,idleTimeout=10800000,priority=NORMAL,daemonOpts=--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.base/java.lang=ALL-UNNAMED,--add-opens,java.base/java.lang.invoke=ALL-UNNAMED,--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.base/java.nio.charset=ALL-UNNAMED,--add-opens,java.base/java.net=ALL-UNNAMED,--add-opens,java.base/java.util.concurrent.atomic=ALL-UNNAMED,-XX:MaxMetaspaceSize=256m,-XX:+HeapDumpOnOutOfMemoryError,-Xms256m,-Xmx512m,-Dfile.encoding=UTF-8,-Duser.country=JP,-Duser.language=ja,-Duser.variant]} however its context does not match the desired criteria.
Java home is different.
Wanted: DefaultDaemonContext[uid=null,javaHome=/Users/wave1008/Library/Java/JavaVirtualMachines/corretto-17.0.4/Contents/Home,daemonRegistryDir=/Users/wave1008/.gradle/daemon,pid=13510,idleTimeout=null,priority=NORMAL,daemonOpts=--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.base/java.lang=ALL-UNNAMED,--add-opens,java.base/java.lang.invoke=ALL-UNNAMED,--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.base/java.nio.charset=ALL-UNNAMED,--add-opens,java.base/java.net=ALL-UNNAMED,--add-opens,java.base/java.util.concurrent.atomic=ALL-UNNAMED,-XX:MaxMetaspaceSize=256m,-XX:+HeapDumpOnOutOfMemoryError,-Xms256m,-Xmx512m,-Dfile.encoding=UTF-8,-Duser.country=JP,-Duser.language=ja,-Duser.variant]
Actual: DefaultDaemonContext[uid=53663b64-db53-4db7-9a12-073828b9e9bf,javaHome=/Users/wave1008/Library/Java/JavaVirtualMachines/azul-17.0.3/Contents/Home,daemonRegistryDir=/Users/wave1008/.gradle/daemon,pid=13483,idleTimeout=10800000,priority=NORMAL,daemonOpts=--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.base/java.lang=ALL-UNNAMED,--add-opens,java.base/java.lang.invoke=ALL-UNNAMED,--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.base/java.nio.charset=ALL-UNNAMED,--add-opens,java.base/java.net=ALL-UNNAMED,--add-opens,java.base/java.util.concurrent.atomic=ALL-UNNAMED,-XX:MaxMetaspaceSize=256m,-XX:+HeapDumpOnOutOfMemoryError,-Xms256m,-Xmx512m,-Dfile.encoding=UTF-8,-Duser.country=JP,-Duser.language=ja,-Duser.variant]

  Looking for a different daemon...
The client will now receive all logging from the daemon (pid: 12653). The daemon log file: /Users/wave1008/.gradle/daemon/7.4.2/daemon-12653.out.log
Starting 4th build in daemon [uptime: 9 mins 36.423 secs, performance: 100%, non-heap usage: 39% of 256 MiB]
Using 10 worker leases.
Now considering [/Users/wave1008/github/wave1008/shirates-samples-job1, /Users/wave1008/Downloads/shirates-samples-job1] as hierarchies to watch
Watching the file system is configured to be enabled if available
File system watching is active
Invalidating in-memory cache of /Users/wave1008/github/wave1008/shirates-samples-job1/.gradle/7.4.2/fileHashes/fileHashes.bin
Invalidating in-memory cache of /Users/wave1008/github/wave1008/shirates-samples-job1/.gradle/7.4.2/fileHashes/resourceHashesCache.bin
Starting Build
Settings evaluated using settings file '/Users/wave1008/github/wave1008/shirates-samples-job1/settings.gradle.kts'.
Projects loaded. Root project using build file '/Users/wave1008/github/wave1008/shirates-samples-job1/build.gradle.kts'.
Included projects: [root project 'shirates-samples-job1']

> Configure project :
Evaluating root project 'shirates-samples-job1' using build file '/Users/wave1008/github/wave1008/shirates-samples-job1/build.gradle.kts'.
Invalidating in-memory cache of /Users/wave1008/github/wave1008/shirates-samples-job1/.gradle/buildOutputCleanup/outputFiles.bin
Invalidating in-memory cache of /Users/wave1008/.gradle/caches/journal-1/file-access.bin
Invalidating in-memory cache of /Users/wave1008/.gradle/caches/7.4.2/fileHashes/fileHashes.bin
Invalidating in-memory cache of /Users/wave1008/.gradle/caches/7.4.2/fileHashes/resourceHashesCache.bin
Using Kotlin Gradle Plugin gradle71 variant
kotlin scripting plugin: created the scripting discovery configuration: kotlinScriptDef
kotlin scripting plugin: created the scripting discovery configuration: testKotlinScriptDef
Invalidating in-memory cache of /Users/wave1008/.gradle/caches/7.4.2/kotlin-dsl/executionHistory.bin
Caching disabled for Kotlin DSL accessors for root project 'shirates-samples-job1' because:
  Build cache is disabled
Skipping Kotlin DSL accessors for root project 'shirates-samples-job1' as it is up-to-date.
All projects evaluated.
includeTestMatching(product1.Test1)
Selected primary task 'cleanTest' from project :
Selected primary task 'test' from project :
Tasks to be executed: [task ':cleanTest', task ':compileJava', task ':processResources', task ':classes', task ':jar', task ':inspectClassesForKotlinIC', task ':compileTestKotlin', task ':compileTestJava', task ':processTestResources', task ':testClasses', task ':test']
Tasks that were excluded: [task ':compileKotlin']
:cleanTest (Thread[Execution worker for ':',5,main]) started.
Invalidating in-memory cache of /Users/wave1008/github/wave1008/shirates-samples-job1/.gradle/7.4.2/executionHistory/executionHistory.bin

> Task :cleanTest
Caching disabled for task ':cleanTest' because:
  Build cache is disabled
Task ':cleanTest' is not up-to-date because:
  Task has not declared any outputs despite executing actions.
:cleanTest (Thread[Execution worker for ':',5,main]) completed. Took 0.006 secs.
destroyer locations for task group 0 (Thread[Execution worker for ':',5,main]) started.
destroyer locations for task group 0 (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:compileJava (Thread[Execution worker for ':',5,main]) started.

> Task :compileJava NO-SOURCE
Skipping task ':compileJava' as it has no source files and no previous output files.
:compileJava (Thread[Execution worker for ':',5,main]) completed. Took 0.001 secs.
:processResources (Thread[Execution worker for ':',5,main]) started.

> Task :processResources NO-SOURCE
Skipping task ':processResources' as it has no source files and no previous output files.
:processResources (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:classes (Thread[Execution worker for ':',5,main]) started.

> Task :classes UP-TO-DATE
Skipping task ':classes' as it has no actions.
:classes (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:jar (Thread[Execution worker for ':',5,main]) started.

> Task :jar UP-TO-DATE
Caching disabled for task ':jar' because:
  Build cache is disabled
Skipping task ':jar' as it is up-to-date.
:jar (Thread[Execution worker for ':',5,main]) completed. Took 0.001 secs.
:inspectClassesForKotlinIC (Thread[Execution worker for ':',5,main]) started.

> Task :inspectClassesForKotlinIC UP-TO-DATE
Caching disabled for task ':inspectClassesForKotlinIC' because:
  Build cache is disabled
Skipping task ':inspectClassesForKotlinIC' as it is up-to-date.
:inspectClassesForKotlinIC (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:compileTestKotlin (Thread[Execution worker for ':',5,main]) started.

> Task :compileTestKotlin UP-TO-DATE
Caching disabled for task ':compileTestKotlin' because:
  Build cache is disabled
Skipping task ':compileTestKotlin' as it is up-to-date.
:compileTestKotlin (Thread[Execution worker for ':',5,main]) completed. Took 0.041 secs.
:compileTestJava (Thread[Execution worker for ':',5,main]) started.

> Task :compileTestJava NO-SOURCE
Skipping task ':compileTestJava' as it has no source files and no previous output files.
:compileTestJava (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:processTestResources (Thread[Execution worker for ':',5,main]) started.

> Task :processTestResources NO-SOURCE
Skipping task ':processTestResources' as it has no source files and no previous output files.
:processTestResources (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:testClasses (Thread[Execution worker for ':',5,main]) started.

> Task :testClasses UP-TO-DATE
Skipping task ':testClasses' as it has no actions.
:testClasses (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:test (Thread[Execution worker for ':',5,main]) started.
Gradle Test Executor 4 started executing tests.

> Task :test
Caching disabled for task ':test' because:
  Build cache is disabled
Task ':test' is not up-to-date because:
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin.idx has been removed.
file or directory '/Users/wave1008/github/wave1008/shirates-samples-job1/build/classes/java/test', not found
Starting process 'Gradle Test Executor 4'. Working directory: /Users/wave1008/github/wave1008/shirates-samples-job1 Command: /Users/wave1008/Library/Java/JavaVirtualMachines/corretto-17.0.4/Contents/Home/bin/java -Dorg.gradle.internal.worker.tmpdir=/Users/wave1008/github/wave1008/shirates-samples-job1/build/tmp/test/work -Dorg.gradle.native=false --add-exports java.desktop/sun.awt.image=ALL-UNNAMED @/Users/wave1008/.gradle/.tmp/gradle-worker-classpath8117995844171373059txt -Xmx512m -Dfile.encoding=UTF-8 -Duser.country=JP -Duser.language=ja -Duser.variant -ea worker.org.gradle.process.internal.worker.GradleWorkerMain 'Gradle Test Executor 4'
Successfully started process 'Gradle Test Executor 4'

Test1 STANDARD_OUT
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 22:38:34.564 {}      [info]  ()      Importing environment variables.
    2   2023/03/18 22:38:34.722 {}      [info]  ()      SR_profile=Pixel 3a API 31(Android 12)
    3   2023/03/18 22:38:34.722 {}      [info]  ()      SR_configFile=testConfig/androidSettingsConfig.json
    4   2023/03/18 22:38:34.723 {}      [info]  ()      SR_os=android
    5   2023/03/18 22:38:34.723 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 22:38:34.723 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    2   2023/03/18 22:38:34.724 {}      [-]     ()      ///
    3   2023/03/18 22:38:34.724 {}      [-]     ()      /// Shirates 3.1.1
    4   2023/03/18 22:38:34.724 {}      [-]     ()      ///
    5   2023/03/18 22:38:34.725 {}      [-]     ()      powered by Appium (io.appium:java-client:8.1.1)
    6   2023/03/18 22:38:34.725 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    7   2023/03/18 22:38:34.725 {}      [-]     (parameter)     testClass: product1.Test1
    8   2023/03/18 22:38:34.726 {}      [-]     (parameter)     sheetName: Test1
    9   2023/03/18 22:38:34.726 {}      [-]     (parameter)     logLanguage: 

Test1 > test1() STANDARD_OUT
    10  2023/03/18 22:38:34.733 {}      [info]  ()      ----------------------------------------------------------------------------------------------------
    11  2023/03/18 22:38:34.734 {}      [info]  ()      Test function: test1 [test1()]
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    12  2023/03/18 22:38:34.734 {}      [info]  ()      Importing environment variables.
    13  2023/03/18 22:38:34.734 {}      [info]  ()      SR_profile=Pixel 3a API 31(Android 12)
    14  2023/03/18 22:38:34.734 {}      [info]  ()      SR_configFile=testConfig/androidSettingsConfig.json
    15  2023/03/18 22:38:34.735 {}      [info]  ()      SR_os=android
    16  2023/03/18 22:38:34.735 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    17  2023/03/18 22:38:35.368 {}      [info]  ()      Initializing with testrun file.(testConfig/testrun.properties)
    18  2023/03/18 22:38:35.423 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_223834/Test1/
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_223834/Test1
    19  2023/03/18 22:38:35.452 {}      [info]  ()      Loading config.(configFile=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/androidSettingsConfig.json, profileName=Pixel 3a API 31(Android 12))
    20  2023/03/18 22:38:35.480 {}      [info]  ()      Loading screen files.(directory=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/screens)
    21  2023/03/18 22:38:35.490 {}      [info]  ()      Screen files loaded.(2 files)
    22  2023/03/18 22:38:35.506 {}      [info]  ()      Scanning macro under '/Users/wave1008/github/wave1008/shirates-samples-job1/src/test/kotlin'
    23  2023/03/18 22:38:35.507 {}      [info]  ()      Initializing TestDriver.(profileName=Pixel 3a API 31(Android 12))
    24  2023/03/18 22:38:35.508 {}      [info]  ()      noLoadRun: false
    25  2023/03/18 22:38:35.508 {}      [info]  ()      boundsToRectRatio: 1
    26  2023/03/18 22:38:35.508 {}      [info]  ()      reuseDriver: true
    27  2023/03/18 22:38:35.509 {}      [info]  ()      autoScreenshot: true
    28  2023/03/18 22:38:35.509 {}      [info]  ()      onChangedOnly: true
    29  2023/03/18 22:38:35.509 {}      [info]  ()      onCondition: true
    30  2023/03/18 22:38:35.510 {}      [info]  ()      onAction: true
    31  2023/03/18 22:38:35.510 {}      [info]  ()      onExpectation: true
    32  2023/03/18 22:38:35.510 {}      [info]  ()      onExecOperateCommand: true
    33  2023/03/18 22:38:35.511 {}      [info]  ()      onCheckCommand: true
    34  2023/03/18 22:38:35.511 {}      [info]  ()      onScrolling: true
    35  2023/03/18 22:38:35.511 {}      [info]  ()      manualScreenshot: true
    36  2023/03/18 22:38:35.511 {}      [info]  ()      retryMaxCount: 1
    37  2023/03/18 22:38:35.512 {}      [info]  ()      retryIntervalSeconds: 2.0
    38  2023/03/18 22:38:35.512 {}      [info]  ()      shortWaitSeconds: 1.5
    39  2023/03/18 22:38:35.512 {}      [info]  ()      waitSecondsOnIsScreen: 15.0
    40  2023/03/18 22:38:35.513 {}      [info]  ()      waitSecondsForLaunchAppComplete: 15.0
    41  2023/03/18 22:38:35.513 {}      [info]  ()      waitSecondsForAnimationComplete: 0.5
    42  2023/03/18 22:38:35.513 {}      [info]  ()      waitSecondsForConnectionEnabled: 8.0
    43  2023/03/18 22:38:35.514 {}      [info]  ()      swipeDurationSeconds: 3.0
    44  2023/03/18 22:38:35.514 {}      [info]  ()      flickDurationSeconds: 0.3
    45  2023/03/18 22:38:35.514 {}      [info]  ()      swipeMarginRatio: 0.1
    46  2023/03/18 22:38:35.514 {}      [info]  ()      scrollVerticalMarginRatio: 0.2
    47  2023/03/18 22:38:35.515 {}      [info]  ()      scrollHorizontalMarginRatio: 0.2
    48  2023/03/18 22:38:35.515 {}      [info]  ()      tapHoldSeconds: 0.2
    49  2023/03/18 22:38:35.515 {}      [info]  ()      tapAppIconMethod: auto
    50  2023/03/18 22:38:35.515 {}      [info]  ()      tapAppIconMacro: 
    51  2023/03/18 22:38:35.516 {}      [info]  ()      syncWaitSeconds: 1.8
    52  2023/03/18 22:38:35.516 {}      [info]  ()      Searching device for the profile. (profileName=Pixel 3a API 31(Android 12))
    53  2023/03/18 22:38:35.601 {}      [info]  ()      Connected device found. (Pixel_3a_API_31_Android_12_:5554, Android 12, emulator-5554)
    54  2023/03/18 22:38:35.646 {}      [info]  ()      appium --session-override --relaxed-security --log /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_223834/Test1/appium_2023-03-18_223835605.log --port 4720
    55  2023/03/18 22:38:38.730 {}      [info]  ()      Appium Server started. (pid=13530, port=4720)
    56  2023/03/18 22:38:39.736 {}      [info]  ()      Connecting to Appium Server.(http://127.0.0.1:4720/)

Test1 > test1() STANDARD_ERROR
    Cleaning up unclosed ZipFile for archive /Users/wave1008/Downloads/TestResults/androidSettingsConfig/TestList_androidSettingsConfig.xlsx

Test1 > test1() STANDARD_OUT
    57  2023/03/18 22:38:45.337 {}      [info]  ()      [Health check] start
    58  2023/03/18 22:38:45.340 {}      [info]  (syncCache)     Syncing (1)
    59  2023/03/18 22:38:46.199 {}      [info]  (syncCache)     elapsed=0.858, syncWaitSeconds=15.0
    60  2023/03/18 22:38:46.701 {}      [info]  (syncCache)     Syncing (2)
    61  2023/03/18 22:38:46.807 {}      [info]  (syncCache)     Synced. (elapsed=1.466, currentScreen=?)
    62  2023/03/18 22:38:46.813 {}      [info]  ()      tap<.label>
    63  2023/03/18 22:38:48.240 {}      [info]  (syncCache)     Syncing (1)
    64  2023/03/18 22:38:48.323 {}      [info]  (syncCache)     Synced. (elapsed=0.083, currentScreen=?)
    65  2023/03/18 22:38:48.496 {}      [info]  ()      [Health check] end
    66  2023/03/18 22:38:48.501 {}      [info]  ()      implicitlyWaitSeconds: 5.0
    67  2023/03/18 22:38:48.574 {}      [info]  ()      (settings) always_finish_activities: 0
    68  2023/03/18 22:38:48.598 {}      [info]  ()      Searching device for the profile. (profileName=Pixel 3a API 31(Android 12))
    69  2023/03/18 22:38:48.678 {}      [info]  ()      Connected device found. (Pixel_3a_API_31_Android_12_:5554, Android 12, emulator-5554)
    70  2023/03/18 22:38:48.679 {}      [info]  ()      AppiumDriver initialized.
    71  2023/03/18 22:38:48.679 {}      [-]     (parameter)     testrun: testConfig/testrun.properties
    72  2023/03/18 22:38:48.680 {}      [-]     (parameter)     testConfigName: androidSettingsConfig(/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/androidSettingsConfig.json)
    73  2023/03/18 22:38:48.680 {}      [-]     (parameter)     profileName: Pixel 3a API 31(Android 12)
    74  2023/03/18 22:38:48.680 {}      [-]     (parameter)     appIconName: Settings
    75  2023/03/18 22:38:48.681 {}      [-]     ()      (capabilities)
    76  2023/03/18 22:38:48.681 {}      [-]     (parameter)     appium:newCommandTimeout: 300
    77  2023/03/18 22:38:48.681 {}      [-]     (parameter)     appium:takesScreenshot: true
    78  2023/03/18 22:38:48.682 {}      [-]     (parameter)     appium:warnings: {}
    79  2023/03/18 22:38:48.682 {}      [-]     (parameter)     appium:deviceApiLevel: 31
    80  2023/03/18 22:38:48.682 {}      [-]     (parameter)     appium:automationName: UiAutomator2
    81  2023/03/18 22:38:48.683 {}      [-]     (parameter)     appium:locationContextEnabled: false
    82  2023/03/18 22:38:48.683 {}      [-]     (parameter)     appium:deviceScreenSize: 1080x2220
    83  2023/03/18 22:38:48.683 {}      [-]     (parameter)     appium:deviceManufacturer: Google
    84  2023/03/18 22:38:48.683 {}      [-]     (parameter)     appium:udid: emulator-5554
    85  2023/03/18 22:38:48.684 {}      [-]     (parameter)     appium:pixelRatio: 2.75
    86  2023/03/18 22:38:48.684 {}      [-]     (parameter)     platformName: ANDROID
    87  2023/03/18 22:38:48.684 {}      [-]     (parameter)     appium:networkConnectionEnabled: true
    88  2023/03/18 22:38:48.684 {}      [-]     (parameter)     appium:locale: US
    89  2023/03/18 22:38:48.685 {}      [-]     (parameter)     appium:deviceScreenDensity: 440
    90  2023/03/18 22:38:48.685 {}      [-]     (parameter)     appium:viewportRect: {left=0, top=66, width=1080, height=2022}
    91  2023/03/18 22:38:48.685 {}      [-]     (parameter)     appium:language: en
    92  2023/03/18 22:38:48.685 {}      [-]     (parameter)     appium:avd: Pixel_3a_API_31_Android_12_
    93  2023/03/18 22:38:48.686 {}      [-]     (parameter)     appium:deviceModel: sdk_gphone64_arm64
    94  2023/03/18 22:38:48.686 {}      [-]     (parameter)     appium:platformVersion: 12
    95  2023/03/18 22:38:48.686 {}      [-]     (parameter)     appium:databaseEnabled: false
    96  2023/03/18 22:38:48.686 {}      [-]     (parameter)     appium:deviceUDID: emulator-5554
    97  2023/03/18 22:38:48.687 {}      [-]     (parameter)     appium:statBarHeight: 66
    98  2023/03/18 22:38:48.687 {}      [-]     (parameter)     appium:webStorageEnabled: false
    99  2023/03/18 22:38:48.687 {}      [-]     (parameter)     appium:appActivity: com.android.settings.Settings
    100 2023/03/18 22:38:48.687 {}      [-]     (parameter)     appium:deviceName: emulator-5554
    101 2023/03/18 22:38:48.687 {}      [-]     (parameter)     appium:javascriptEnabled: true
    102 2023/03/18 22:38:48.688 {}      [-]     (parameter)     appium:appPackage: com.android.settings
    103 2023/03/18 22:38:48.688 {}      [-]     ()      settings
    104 2023/03/18 22:38:48.765 {}      [-]     (parameter)     always_finish_activities: 0
    105 2023/03/18 22:38:48.765 {}      [-]     ()      (others)
    106 2023/03/18 22:38:48.766 {}      [-]     (parameter)     isEmulator: true
    107 2023/03/18 22:38:48.766 {}      [-]     (parameter)     hasOsaihuKeitai: false
    108 2023/03/18 22:38:48.767 {}      [info]  ()      Setup executed. (duration: 14.0 sec)
    109 2023/03/18 22:38:48.770 {}      [info]  ()      Running scenario ..................................................
    110 2023/03/18 22:38:48.771 {}      [info]  ()      Startup package: com.android.settings
    111 2023/03/18 22:38:48.771 {test1} [SCENARIO]      (scenario)      test1()
    112 2023/03/18 22:38:49.245 {test1} [screenshot]    (screenshot)    screenshot
    113 2023/03/18 22:38:49.246 {test1} [operate]       (launchApp)     Launch app <Settings>
    114 2023/03/18 22:38:49.435 {test1} [info]  (syncCache)     Syncing (1)
    115 2023/03/18 22:38:50.091 {test1} [info]  (syncCache)     Synced. (elapsed=0.656, currentScreen=?)
    116 2023/03/18 22:38:50.093 {test1-1}       [CASE]  (case)  (1)
    117 2023/03/18 22:38:50.094 {test1-1}       [CONDITION]     (condition)     condition
    118 2023/03/18 22:38:50.094 {test1-1}       [info]  ()      Pixel 3a API 31(Android 12)
    119 2023/03/18 22:38:50.095 {test1-1}       [ACTION]        (action)        action
    120 2023/03/18 22:38:50.095 {test1-1}       [operate]       (pressHome)     Press OS home
    121 2023/03/18 22:38:50.131 {test1-1}       [info]  (syncCache)     Syncing (1)
    122 2023/03/18 22:38:51.119 {test1-1}       [info]  (syncCache)     elapsed=0.988, syncWaitSeconds=1.8
    123 2023/03/18 22:38:51.621 {test1-1}       [info]  (syncCache)     Syncing (2)
    124 2023/03/18 22:38:51.662 {test1-1}       [info]  (syncCache)     Synced. (elapsed=1.531, currentScreen=[Android Home Screen])
    125 2023/03/18 22:38:53.572 {test1-1}       [screenshot]    (screenshot)    screenshot
    126 2023/03/18 22:38:53.573 {test1-1}       [EXPECTATION]   (expectation)   expectation
    127 2023/03/18 22:38:53.575 {test1-1}       [branch]        (os)    android {
    128 2023/03/18 22:38:53.578 {test1-1}       [OK]    (screenIs)      [Android Home Screen] is displayed
    129 2023/03/18 22:38:53.578 {test1-1}       [branch]        (os)    } android
    130 2023/03/18 22:38:53.579 {test1-1}       [info]  ()      Scenario executed. (duration: 4.8 sec)
    131 2023/03/18 22:38:53.580 {}      [info]  ()      Test function executed. (duration: 18.8 sec)
    132 2023/03/18 22:38:53.580 {}      [info]  ()      End of Test function: test1 [test1()]

Test1 STANDARD_OUT
    133 2023/03/18 22:38:53.583 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_223834/Test1/
    Copying jar content _ReportScript.js to /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_223834/Test1
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_223834/Test1
    Loading: /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_223834/Test1/TestLog(commandList)_20230318223834.log
    Saved: /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_223834/Test1/Test1@a.xlsx

    134 2023/03/18 22:38:53.949 {}      [info]  ()      Quitting TestDriver.
    135 2023/03/18 22:38:54.051 {}      [info]  ()      Test class executed. (duration: 19.5 sec)

Gradle Test Executor 4 finished executing tests.

> Task :test
Finished generating test XML results (0.001 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test
Generating HTML test report...
Finished generating test html results (0.002 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/reports/tests/test
:test (Thread[Execution worker for ':',5,main]) completed. Took 20.204 secs.
producer locations for task group 1 (Thread[Execution worker for ':',5,main]) started.
producer locations for task group 1 (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.

BUILD SUCCESSFUL in 20s
5 actionable tasks: 2 executed, 3 up-to-date
Watched directory hierarchies: [/Users/wave1008/github/wave1008/shirates-samples-job1, /Users/wave1008/Downloads/shirates-samples-job1]
/// Starting test
Initialized native services in: /Users/wave1008/.gradle/native
Initialized jansi services in: /Users/wave1008/.gradle/native
Found daemon DaemonInfo{pid=13483, address=[7fab0fd4-dbb5-43cd-b6d4-1dfab7cf4b54 port:59314, addresses:[/127.0.0.1]], state=Idle, lastBusy=1679146708316, context=DefaultDaemonContext[uid=53663b64-db53-4db7-9a12-073828b9e9bf,javaHome=/Users/wave1008/Library/Java/JavaVirtualMachines/azul-17.0.3/Contents/Home,daemonRegistryDir=/Users/wave1008/.gradle/daemon,pid=13483,idleTimeout=10800000,priority=NORMAL,daemonOpts=--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.base/java.lang=ALL-UNNAMED,--add-opens,java.base/java.lang.invoke=ALL-UNNAMED,--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.base/java.nio.charset=ALL-UNNAMED,--add-opens,java.base/java.net=ALL-UNNAMED,--add-opens,java.base/java.util.concurrent.atomic=ALL-UNNAMED,-XX:MaxMetaspaceSize=256m,-XX:+HeapDumpOnOutOfMemoryError,-Xms256m,-Xmx512m,-Dfile.encoding=UTF-8,-Duser.country=JP,-Duser.language=ja,-Duser.variant]} however its context does not match the desired criteria.
Java home is different.
Wanted: DefaultDaemonContext[uid=null,javaHome=/Users/wave1008/Library/Java/JavaVirtualMachines/corretto-17.0.4/Contents/Home,daemonRegistryDir=/Users/wave1008/.gradle/daemon,pid=13641,idleTimeout=null,priority=NORMAL,daemonOpts=--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.base/java.lang=ALL-UNNAMED,--add-opens,java.base/java.lang.invoke=ALL-UNNAMED,--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.base/java.nio.charset=ALL-UNNAMED,--add-opens,java.base/java.net=ALL-UNNAMED,--add-opens,java.base/java.util.concurrent.atomic=ALL-UNNAMED,-XX:MaxMetaspaceSize=256m,-XX:+HeapDumpOnOutOfMemoryError,-Xms256m,-Xmx512m,-Dfile.encoding=UTF-8,-Duser.country=JP,-Duser.language=ja,-Duser.variant]
Actual: DefaultDaemonContext[uid=53663b64-db53-4db7-9a12-073828b9e9bf,javaHome=/Users/wave1008/Library/Java/JavaVirtualMachines/azul-17.0.3/Contents/Home,daemonRegistryDir=/Users/wave1008/.gradle/daemon,pid=13483,idleTimeout=10800000,priority=NORMAL,daemonOpts=--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.base/java.lang=ALL-UNNAMED,--add-opens,java.base/java.lang.invoke=ALL-UNNAMED,--add-opens,java.base/java.util=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.prefs/java.util.prefs=ALL-UNNAMED,--add-opens,java.base/java.nio.charset=ALL-UNNAMED,--add-opens,java.base/java.net=ALL-UNNAMED,--add-opens,java.base/java.util.concurrent.atomic=ALL-UNNAMED,-XX:MaxMetaspaceSize=256m,-XX:+HeapDumpOnOutOfMemoryError,-Xms256m,-Xmx512m,-Dfile.encoding=UTF-8,-Duser.country=JP,-Duser.language=ja,-Duser.variant]

  Looking for a different daemon...
The client will now receive all logging from the daemon (pid: 12653). The daemon log file: /Users/wave1008/.gradle/daemon/7.4.2/daemon-12653.out.log
Starting 5th build in daemon [uptime: 9 mins 57.527 secs, performance: 100%, non-heap usage: 39% of 256 MiB]
Using 10 worker leases.
Now considering [/Users/wave1008/github/wave1008/shirates-samples-job1, /Users/wave1008/Downloads/shirates-samples-job1] as hierarchies to watch
Watching the file system is configured to be enabled if available
File system watching is active
Starting Build
Settings evaluated using settings file '/Users/wave1008/github/wave1008/shirates-samples-job1/settings.gradle.kts'.
Projects loaded. Root project using build file '/Users/wave1008/github/wave1008/shirates-samples-job1/build.gradle.kts'.
Included projects: [root project 'shirates-samples-job1']

> Configure project :
Evaluating root project 'shirates-samples-job1' using build file '/Users/wave1008/github/wave1008/shirates-samples-job1/build.gradle.kts'.
Using Kotlin Gradle Plugin gradle71 variant
kotlin scripting plugin: created the scripting discovery configuration: kotlinScriptDef
kotlin scripting plugin: created the scripting discovery configuration: testKotlinScriptDef
Caching disabled for Kotlin DSL accessors for root project 'shirates-samples-job1' because:
  Build cache is disabled
Skipping Kotlin DSL accessors for root project 'shirates-samples-job1' as it is up-to-date.
All projects evaluated.
includeTestMatching(product1.Test1)
Selected primary task 'cleanTest' from project :
Selected primary task 'test' from project :
Tasks to be executed: [task ':cleanTest', task ':compileJava', task ':processResources', task ':classes', task ':jar', task ':inspectClassesForKotlinIC', task ':compileTestKotlin', task ':compileTestJava', task ':processTestResources', task ':testClasses', task ':test']
Tasks that were excluded: [task ':compileKotlin']
:cleanTest (Thread[Execution worker for ':',5,main]) started.

> Task :cleanTest
Caching disabled for task ':cleanTest' because:
  Build cache is disabled
Task ':cleanTest' is not up-to-date because:
  Task has not declared any outputs despite executing actions.
:cleanTest (Thread[Execution worker for ':',5,main]) completed. Took 0.006 secs.
destroyer locations for task group 0 (Thread[Execution worker for ':',5,main]) started.
destroyer locations for task group 0 (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:compileJava (Thread[Execution worker for ':',5,main]) started.

> Task :compileJava NO-SOURCE
Skipping task ':compileJava' as it has no source files and no previous output files.
:compileJava (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:processResources (Thread[Execution worker for ':',5,main]) started.

> Task :processResources NO-SOURCE
Skipping task ':processResources' as it has no source files and no previous output files.
:processResources (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:classes (Thread[Execution worker for ':',5,main]) started.

> Task :classes UP-TO-DATE
Skipping task ':classes' as it has no actions.
:classes (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:jar (Thread[Execution worker for ':',5,main]) started.

> Task :jar UP-TO-DATE
Caching disabled for task ':jar' because:
  Build cache is disabled
Skipping task ':jar' as it is up-to-date.
:jar (Thread[Execution worker for ':',5,main]) completed. Took 0.001 secs.
:inspectClassesForKotlinIC (Thread[Execution worker for ':',5,main]) started.

> Task :inspectClassesForKotlinIC UP-TO-DATE
Caching disabled for task ':inspectClassesForKotlinIC' because:
  Build cache is disabled
Skipping task ':inspectClassesForKotlinIC' as it is up-to-date.
:inspectClassesForKotlinIC (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:compileTestKotlin (Thread[Execution worker for ':',5,main]) started.

> Task :compileTestKotlin UP-TO-DATE
Caching disabled for task ':compileTestKotlin' because:
  Build cache is disabled
Skipping task ':compileTestKotlin' as it is up-to-date.
:compileTestKotlin (Thread[Execution worker for ':',5,main]) completed. Took 0.038 secs.
:compileTestJava (Thread[Execution worker for ':',5,main]) started.

> Task :compileTestJava NO-SOURCE
Skipping task ':compileTestJava' as it has no source files and no previous output files.
:compileTestJava (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:processTestResources (Thread[Execution worker for ':',5,main]) started.

> Task :processTestResources NO-SOURCE
Skipping task ':processTestResources' as it has no source files and no previous output files.
:processTestResources (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:testClasses (Thread[Execution worker for ':',5,main]) started.

> Task :testClasses UP-TO-DATE
Skipping task ':testClasses' as it has no actions.
:testClasses (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:test (Thread[Execution worker for ':',5,main]) started.
Gradle Test Executor 5 started executing tests.

> Task :test
Caching disabled for task ':test' because:
  Build cache is disabled
Task ':test' is not up-to-date because:
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin.idx has been removed.
file or directory '/Users/wave1008/github/wave1008/shirates-samples-job1/build/classes/java/test', not found
Starting process 'Gradle Test Executor 5'. Working directory: /Users/wave1008/github/wave1008/shirates-samples-job1 Command: /Users/wave1008/Library/Java/JavaVirtualMachines/corretto-17.0.4/Contents/Home/bin/java -Dorg.gradle.internal.worker.tmpdir=/Users/wave1008/github/wave1008/shirates-samples-job1/build/tmp/test/work -Dorg.gradle.native=false --add-exports java.desktop/sun.awt.image=ALL-UNNAMED @/Users/wave1008/.gradle/.tmp/gradle-worker-classpath11856233312441846091txt -Xmx512m -Dfile.encoding=UTF-8 -Duser.country=JP -Duser.language=ja -Duser.variant -ea worker.org.gradle.process.internal.worker.GradleWorkerMain 'Gradle Test Executor 5'
Successfully started process 'Gradle Test Executor 5'

Test1 STANDARD_OUT
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 22:38:55.719 {}      [info]  ()      Importing environment variables.
    2   2023/03/18 22:38:55.876 {}      [info]  ()      SR_profile=iPhone 14(16.2)
    3   2023/03/18 22:38:55.876 {}      [info]  ()      SR_configFile=testConfig/iOSSettingsConfig.json
    4   2023/03/18 22:38:55.876 {}      [info]  ()      SR_os=ios
    5   2023/03/18 22:38:55.877 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 22:38:55.877 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    2   2023/03/18 22:38:55.877 {}      [-]     ()      ///
    3   2023/03/18 22:38:55.877 {}      [-]     ()      /// Shirates 3.1.1
    4   2023/03/18 22:38:55.878 {}      [-]     ()      ///
    5   2023/03/18 22:38:55.878 {}      [-]     ()      powered by Appium (io.appium:java-client:8.1.1)
    6   2023/03/18 22:38:55.879 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    7   2023/03/18 22:38:55.879 {}      [-]     (parameter)     testClass: product1.Test1
    8   2023/03/18 22:38:55.879 {}      [-]     (parameter)     sheetName: Test1
    9   2023/03/18 22:38:55.879 {}      [-]     (parameter)     logLanguage: 

Test1 > test1() STANDARD_OUT
    10  2023/03/18 22:38:55.887 {}      [info]  ()      ----------------------------------------------------------------------------------------------------
    11  2023/03/18 22:38:55.888 {}      [info]  ()      Test function: test1 [test1()]
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    12  2023/03/18 22:38:55.888 {}      [info]  ()      Importing environment variables.
    13  2023/03/18 22:38:55.889 {}      [info]  ()      SR_profile=iPhone 14(16.2)
    14  2023/03/18 22:38:55.889 {}      [info]  ()      SR_configFile=testConfig/iOSSettingsConfig.json
    15  2023/03/18 22:38:55.889 {}      [info]  ()      SR_os=ios
    16  2023/03/18 22:38:55.889 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    17  2023/03/18 22:38:56.381 {}      [info]  ()      Initializing with testrun file.(testConfig/testrun.properties)
    18  2023/03/18 22:38:56.429 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_223855/Test1/
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_223855/Test1
    19  2023/03/18 22:38:56.457 {}      [info]  ()      Loading config.(configFile=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/iOSSettingsConfig.json, profileName=iPhone 14(16.2))
    20  2023/03/18 22:38:56.485 {}      [info]  ()      Loading screen files.(directory=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/screens)
    21  2023/03/18 22:38:56.494 {}      [info]  ()      Screen files loaded.(2 files)
    22  2023/03/18 22:38:56.503 {}      [info]  ()      Scanning macro under '/Users/wave1008/github/wave1008/shirates-samples-job1/src/test/kotlin'
    23  2023/03/18 22:38:56.504 {}      [info]  ()      Initializing TestDriver.(profileName=iPhone 14(16.2))
    24  2023/03/18 22:38:56.505 {}      [info]  ()      noLoadRun: false
    25  2023/03/18 22:38:56.505 {}      [info]  ()      boundsToRectRatio: 3
    26  2023/03/18 22:38:56.506 {}      [info]  ()      reuseDriver: true
    27  2023/03/18 22:38:56.506 {}      [info]  ()      autoScreenshot: true
    28  2023/03/18 22:38:56.507 {}      [info]  ()      onChangedOnly: true
    29  2023/03/18 22:38:56.507 {}      [info]  ()      onCondition: true
    30  2023/03/18 22:38:56.507 {}      [info]  ()      onAction: true
    31  2023/03/18 22:38:56.508 {}      [info]  ()      onExpectation: true
    32  2023/03/18 22:38:56.508 {}      [info]  ()      onExecOperateCommand: true
    33  2023/03/18 22:38:56.508 {}      [info]  ()      onCheckCommand: true
    34  2023/03/18 22:38:56.509 {}      [info]  ()      onScrolling: true
    35  2023/03/18 22:38:56.509 {}      [info]  ()      manualScreenshot: true
    36  2023/03/18 22:38:56.509 {}      [info]  ()      retryMaxCount: 1
    37  2023/03/18 22:38:56.510 {}      [info]  ()      retryIntervalSeconds: 2.0
    38  2023/03/18 22:38:56.510 {}      [info]  ()      shortWaitSeconds: 1.5
    39  2023/03/18 22:38:56.511 {}      [info]  ()      waitSecondsOnIsScreen: 15.0
    40  2023/03/18 22:38:56.511 {}      [info]  ()      waitSecondsForLaunchAppComplete: 15.0
    41  2023/03/18 22:38:56.511 {}      [info]  ()      waitSecondsForAnimationComplete: 0.5
    42  2023/03/18 22:38:56.511 {}      [info]  ()      swipeDurationSeconds: 3.0
    43  2023/03/18 22:38:56.512 {}      [info]  ()      flickDurationSeconds: 0.3
    44  2023/03/18 22:38:56.512 {}      [info]  ()      swipeMarginRatio: 0.1
    45  2023/03/18 22:38:56.512 {}      [info]  ()      scrollVerticalMarginRatio: 0.2
    46  2023/03/18 22:38:56.513 {}      [info]  ()      scrollHorizontalMarginRatio: 0.2
    47  2023/03/18 22:38:56.513 {}      [info]  ()      tapHoldSeconds: 0.2
    48  2023/03/18 22:38:56.513 {}      [info]  ()      tapAppIconMethod: auto
    49  2023/03/18 22:38:56.514 {}      [info]  ()      tapAppIconMacro: 
    50  2023/03/18 22:38:56.514 {}      [info]  ()      syncWaitSeconds: 1.8
    51  2023/03/18 22:38:56.515 {}      [info]  ()      Searching device for the profile. (profileName=iPhone 14(16.2))
    52  2023/03/18 22:38:59.422 {}      [info]  ()      Device found. (iPhone 14, iOS 16.2, A92DD7F7-7B50-4CA1-8060-72F46D777B94)
    53  2023/03/18 22:38:59.469 {}      [info]  ()      appium --session-override --relaxed-security --log /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_223855/Test1/appium_2023-03-18_223859426.log --port 4720
    54  2023/03/18 22:39:02.563 {}      [info]  ()      Appium Server started. (pid=13667, port=4720)
    55  2023/03/18 22:39:03.572 {}      [info]  ()      Connecting to Appium Server.(http://127.0.0.1:4720/)
    56  2023/03/18 22:39:03.573 {}      [info]  ()      Note: Initializing IOSDriver may take a few minutes to build and install WebDriverAgent.

Test1 > test1() STANDARD_ERROR
    Cleaning up unclosed ZipFile for archive /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/TestList_iOSSettingsConfig.xlsx

Test1 > test1() STANDARD_OUT
    57  2023/03/18 22:39:07.556 {}      [info]  ()      implicitlyWaitSeconds: 5.0
    58  2023/03/18 22:39:07.557 {}      [info]  ()      Searching device for the profile. (profileName=iPhone 14(16.2))
    59  2023/03/18 22:39:09.277 {}      [info]  ()      Device found. (iPhone 14, iOS 16.2, A92DD7F7-7B50-4CA1-8060-72F46D777B94)
    60  2023/03/18 22:39:09.278 {}      [info]  ()      AppiumDriver initialized.
    61  2023/03/18 22:39:09.278 {}      [-]     (parameter)     testrun: testConfig/testrun.properties
    62  2023/03/18 22:39:09.278 {}      [-]     (parameter)     testConfigName: iOSSettingsConfig(/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/iOSSettingsConfig.json)
    63  2023/03/18 22:39:09.279 {}      [-]     (parameter)     profileName: iPhone 14(16.2)
    64  2023/03/18 22:39:09.279 {}      [-]     (parameter)     appIconName: Settings
    65  2023/03/18 22:39:09.279 {}      [-]     ()      (capabilities)
    66  2023/03/18 22:39:09.280 {}      [-]     (parameter)     appium:networkConnectionEnabled: false
    67  2023/03/18 22:39:09.280 {}      [-]     (parameter)     appium:showXcodeLog: true
    68  2023/03/18 22:39:09.280 {}      [-]     (parameter)     appium:newCommandTimeout: 300
    69  2023/03/18 22:39:09.280 {}      [-]     (parameter)     appium:locale: US
    70  2023/03/18 22:39:09.281 {}      [-]     (parameter)     appium:takesScreenshot: true
    71  2023/03/18 22:39:09.281 {}      [-]     (parameter)     appium:bundleId: com.apple.Preferences
    72  2023/03/18 22:39:09.281 {}      [-]     (parameter)     appium:language: en
    73  2023/03/18 22:39:09.281 {}      [-]     (parameter)     appium:automationName: XCUITest
    74  2023/03/18 22:39:09.282 {}      [-]     (parameter)     appium:locationContextEnabled: false
    75  2023/03/18 22:39:09.282 {}      [-]     (parameter)     appium:platformVersion: 16.2
    76  2023/03/18 22:39:09.282 {}      [-]     (parameter)     appium:useJSONSource: true
    77  2023/03/18 22:39:09.282 {}      [-]     (parameter)     appium:databaseEnabled: false
    78  2023/03/18 22:39:09.283 {}      [-]     (parameter)     appium:udid: A92DD7F7-7B50-4CA1-8060-72F46D777B94
    79  2023/03/18 22:39:09.283 {}      [-]     (parameter)     appium:webStorageEnabled: false
    80  2023/03/18 22:39:09.283 {}      [-]     (parameter)     appium:deviceName: iPhone 14
    81  2023/03/18 22:39:09.283 {}      [-]     (parameter)     appium:javascriptEnabled: true
    82  2023/03/18 22:39:09.283 {}      [-]     (parameter)     platformName: IOS
    83  2023/03/18 22:39:09.284 {}      [-]     (parameter)     appium:appPackage: com.apple.Preferences
    84  2023/03/18 22:39:09.284 {}      [-]     ()      (others)
    85  2023/03/18 22:39:09.285 {}      [-]     (parameter)     isEmulator: true
    86  2023/03/18 22:39:09.285 {}      [-]     (parameter)     hasOsaihuKeitai: false
    87  2023/03/18 22:39:09.286 {}      [info]  ()      Setup executed. (duration: 13.0 sec)
    88  2023/03/18 22:39:09.292 {}      [info]  (syncCache)     Syncing (1)
    89  2023/03/18 22:39:10.109 {}      [info]  (syncCache)     elapsed=0.816, syncWaitSeconds=1.8
    90  2023/03/18 22:39:10.109 {}      [info]  (syncCache)     Syncing (2)
    91  2023/03/18 22:39:11.019 {}      [info]  (syncCache)     elapsed=1.727, syncWaitSeconds=1.8
    92  2023/03/18 22:39:11.020 {}      [info]  (syncCache)     Syncing (3)
    93  2023/03/18 22:39:11.934 {}      [info]  (syncCache)     Synced. (elapsed=2.641, currentScreen=?)
    94  2023/03/18 22:39:11.935 {}      [info]  ()      Running scenario ..................................................
    95  2023/03/18 22:39:11.935 {test1} [SCENARIO]      (scenario)      test1()
    96  2023/03/18 22:39:12.545 {test1} [screenshot]    (screenshot)    screenshot
    97  2023/03/18 22:39:12.546 {test1} [operate]       (launchApp)     Launch app <Settings>
    98  2023/03/18 22:39:13.606 {test1} [info]  (launchApp)     Launching app. (bundleId=com.apple.Preferences)
    99  2023/03/18 22:39:13.608 {test1} [info]  (execute)       xcrun simctl launch A92DD7F7-7B50-4CA1-8060-72F46D777B94 com.apple.Preferences
    100 2023/03/18 22:39:13.822 {test1} [info]  (launchApp)     doUntilTrue(1)
    101 2023/03/18 22:39:13.824 {test1} [info]  (syncCache)     Syncing (1)
    102 2023/03/18 22:39:15.438 {test1} [info]  (syncCache)     elapsed=1.614, syncWaitSeconds=1.8
    103 2023/03/18 22:39:15.439 {test1} [info]  (syncCache)     Syncing (2)
    104 2023/03/18 22:39:16.274 {test1} [info]  (syncCache)     Synchronization timed out (elapsed=2.449 > syncWaitSeconds=1.8, currentScreen=?)
    105 2023/03/18 22:39:18.276 {test1} [info]  (launchApp)     App launched. (com.apple.Preferences)
    106 2023/03/18 22:39:18.481 {test1} [screenshot]    (screenshot)    screenshot
    107 2023/03/18 22:39:18.482 {test1-1}       [CASE]  (case)  (1)
    108 2023/03/18 22:39:18.482 {test1-1}       [CONDITION]     (condition)     condition
    109 2023/03/18 22:39:18.483 {test1-1}       [info]  ()      iPhone 14(16.2)
    110 2023/03/18 22:39:18.483 {test1-1}       [ACTION]        (action)        action
    111 2023/03/18 22:39:18.484 {test1-1}       [operate]       (pressHome)     Press OS home
    112 2023/03/18 22:39:18.958 {test1-1}       [info]  (syncCache)     Syncing (1)
    113 2023/03/18 22:39:29.284 {test1-1}       [info]  (syncCache)     Synchronization timed out (elapsed=10.326 > syncWaitSeconds=1.8, currentScreen=[iOS Home Screen])
    114 2023/03/18 22:39:31.287 {test1-1}       [screenshot]    (screenshot)    screenshot
    115 2023/03/18 22:39:31.289 {test1-1}       [EXPECTATION]   (expectation)   expectation
    116 2023/03/18 22:39:31.291 {test1-1}       [branch]        (os)    ios {
    117 2023/03/18 22:39:31.294 {test1-1}       [OK]    (screenIs)      [iOS Home Screen] is displayed
    118 2023/03/18 22:39:31.294 {test1-1}       [branch]        (os)    } ios
    119 2023/03/18 22:39:31.295 {test1-1}       [info]  ()      Scenario executed. (duration: 22.0 sec)
    120 2023/03/18 22:39:31.296 {}      [info]  ()      Test function executed. (duration: 35.4 sec)
    121 2023/03/18 22:39:31.296 {}      [info]  ()      End of Test function: test1 [test1()]

Test1 STANDARD_OUT
    122 2023/03/18 22:39:31.299 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_223855/Test1/
    Copying jar content _ReportScript.js to /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_223855/Test1
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_223855/Test1
    Loading: /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_223855/Test1/TestLog(commandList)_20230318223855.log
    Saved: /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_223855/Test1/Test1@i.xlsx

    123 2023/03/18 22:39:31.655 {}      [info]  ()      Quitting TestDriver.
    124 2023/03/18 22:39:32.711 {}      [info]  ()      Test class executed. (duration: 37.0 sec)

Gradle Test Executor 5 finished executing tests.

> Task :test
Finished generating test XML results (0.001 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test
Generating HTML test report...
Finished generating test html results (0.002 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/reports/tests/test
:test (Thread[Execution worker for ':',5,main]) completed. Took 37.795 secs.
producer locations for task group 1 (Thread[Execution worker for ':',5,main]) started.
producer locations for task group 1 (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.

BUILD SUCCESSFUL in 38s
5 actionable tasks: 2 executed, 3 up-to-date
Watched directory hierarchies: [/Users/wave1008/github/wave1008/shirates-samples-job1, /Users/wave1008/Downloads/shirates-samples-job1]
wave1008@SNB-M1 shirates-samples-job1 % 
```