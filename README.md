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
tasks.test {
    useJUnitPlatform()
    jvmArgs = listOf(
        "--add-exports", "java.desktop/sun.awt.image=ALL-UNNAMED"
    )

    // Filter test methods
    val envIncludeTestMatching = System.getenv("includeTestsMatching") ?: ""
    val list = envIncludeTestMatching.split(",").map { it.trim() }
    filter {
        if (list.any()) {
            for (item in list) {
                println("includeTestMatching($item)")
                includeTestsMatching(item)
            }
        } else {
            includeTestsMatching("*")
        }
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
/bin/zsh /Users/wave1008/github/wave1008/shirates-samples-job1/runtest-all.sh   
wave1008@SNB-M1 shirates-samples-job1 % /bin/zsh /Users/wave1008/github/wave1008/shirates-samples-job1/runtest-all.sh
/// Starting test
Initialized native services in: /Users/wave1008/.gradle/native
Initialized jansi services in: /Users/wave1008/.gradle/native
The client will now receive all logging from the daemon (pid: 87859). The daemon log file: /Users/wave1008/.gradle/daemon/7.4.2/daemon-87859.out.log
Starting 25th build in daemon [uptime: 1 hrs 31 mins 0.099 secs, performance: 100%, non-heap usage: 44% of 256 MiB]
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
:cleanTest (Thread[Execution worker for ':',5,main]) completed. Took 0.009 secs.
destroyer locations for task group 0 (Thread[Execution worker for ':',5,main]) started.
destroyer locations for task group 0 (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:compileJava (Thread[Execution worker for ':',5,main]) started.

> Task :compileJava NO-SOURCE
Skipping task ':compileJava' as it has no source files and no previous output files.
:compileJava (Thread[Execution worker for ':',5,main]) completed. Took 0.003 secs.
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
:jar (Thread[Execution worker for ':',5,main]) completed. Took 0.003 secs.
:inspectClassesForKotlinIC (Thread[Execution worker for ':',5,main]) started.

> Task :inspectClassesForKotlinIC UP-TO-DATE
Caching disabled for task ':inspectClassesForKotlinIC' because:
  Build cache is disabled
Skipping task ':inspectClassesForKotlinIC' as it is up-to-date.
:inspectClassesForKotlinIC (Thread[Execution worker for ':',5,main]) completed. Took 0.001 secs.
:compileTestKotlin (Thread[Execution worker for ':',5,main]) started.

> Task :compileTestKotlin UP-TO-DATE
Caching disabled for task ':compileTestKotlin' because:
  Build cache is disabled
Skipping task ':compileTestKotlin' as it is up-to-date.
:compileTestKotlin (Thread[Execution worker for ':',5,main]) completed. Took 0.13 secs.
:compileTestJava (Thread[Execution worker for ':',5,main]) started.

> Task :compileTestJava NO-SOURCE
Skipping task ':compileTestJava' as it has no source files and no previous output files.
:compileTestJava (Thread[Execution worker for ':',5,main]) completed. Took 0.005 secs.
:processTestResources (Thread[Execution worker for ':',5,main]) started.

> Task :processTestResources NO-SOURCE
Skipping task ':processTestResources' as it has no source files and no previous output files.
:processTestResources (Thread[Execution worker for ':',5,main]) completed. Took 0.003 secs.
:testClasses (Thread[Execution worker for ':',5,main]) started.

> Task :testClasses UP-TO-DATE
Skipping task ':testClasses' as it has no actions.
:testClasses (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:test (Thread[Execution worker for ':',5,main]) started.
Gradle Test Executor 24 started executing tests.

> Task :test
Caching disabled for task ':test' because:
  Build cache is disabled
Task ':test' is not up-to-date because:
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin.idx has been removed.
file or directory '/Users/wave1008/github/wave1008/shirates-samples-job1/build/classes/java/test', not found
Starting process 'Gradle Test Executor 24'. Working directory: /Users/wave1008/github/wave1008/shirates-samples-job1 Command: /Users/wave1008/Library/Java/JavaVirtualMachines/corretto-17.0.4/Contents/Home/bin/java -Dorg.gradle.internal.worker.tmpdir=/Users/wave1008/github/wave1008/shirates-samples-job1/build/tmp/test/work -Dorg.gradle.native=false --add-exports java.desktop/sun.awt.image=ALL-UNNAMED @/Users/wave1008/.gradle/.tmp/gradle-worker-classpath15794339916418333725txt -Xmx512m -Dfile.encoding=UTF-8 -Duser.country=JP -Duser.language=ja -Duser.variant -ea worker.org.gradle.process.internal.worker.GradleWorkerMain 'Gradle Test Executor 24'
Successfully started process 'Gradle Test Executor 24'

Test1 STANDARD_OUT
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 11:02:38.190 {}      [info]  ()      Importing environment variables.
    2   2023/03/18 11:02:38.445 {}      [info]  ()      SR_profile=Pixel 3a API 31(Android 12)
    3   2023/03/18 11:02:38.445 {}      [info]  ()      SR_configFile=testConfig/androidSettingsConfig.json
    4   2023/03/18 11:02:38.445 {}      [info]  ()      SR_os=android
    5   2023/03/18 11:02:38.446 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 11:02:38.446 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    2   2023/03/18 11:02:38.446 {}      [-]     ()      ///
    3   2023/03/18 11:02:38.446 {}      [-]     ()      /// Shirates 3.1.1
    4   2023/03/18 11:02:38.447 {}      [-]     ()      ///
    5   2023/03/18 11:02:38.448 {}      [-]     ()      powered by Appium (io.appium:java-client:8.1.1)
    6   2023/03/18 11:02:38.448 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    7   2023/03/18 11:02:38.449 {}      [-]     (parameter)     testClass: product1.Test1
    8   2023/03/18 11:02:38.449 {}      [-]     (parameter)     sheetName: Test1
    9   2023/03/18 11:02:38.449 {}      [-]     (parameter)     logLanguage: 

Test1 > test1() STANDARD_OUT
    10  2023/03/18 11:02:38.458 {}      [info]  ()      ----------------------------------------------------------------------------------------------------
    11  2023/03/18 11:02:38.459 {}      [info]  ()      Test function: test1 [test1()]
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    12  2023/03/18 11:02:38.460 {}      [info]  ()      Importing environment variables.
    13  2023/03/18 11:02:38.460 {}      [info]  ()      SR_profile=Pixel 3a API 31(Android 12)
    14  2023/03/18 11:02:38.460 {}      [info]  ()      SR_configFile=testConfig/androidSettingsConfig.json
    15  2023/03/18 11:02:38.460 {}      [info]  ()      SR_os=android
    16  2023/03/18 11:02:38.460 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    17  2023/03/18 11:02:39.242 {}      [info]  ()      Initializing with testrun file.(testConfig/testrun.properties)
    18  2023/03/18 11:02:39.304 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_110238/Test1/

Test1 > test1() STANDARD_ERROR
    Cleaning up unclosed ZipFile for archive /Users/wave1008/Downloads/TestResults/androidSettingsConfig/TestList_androidSettingsConfig.xlsx

Test1 > test1() STANDARD_OUT
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_110238/Test1
    19  2023/03/18 11:02:39.363 {}      [info]  ()      Loading config.(configFile=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/androidSettingsConfig.json, profileName=Pixel 3a API 31(Android 12))
    20  2023/03/18 11:02:39.400 {}      [info]  ()      Loading screen files.(directory=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/screens)
    21  2023/03/18 11:02:39.411 {}      [info]  ()      Screen files loaded.(2 files)
    22  2023/03/18 11:02:39.422 {}      [info]  ()      Scanning macro under '/Users/wave1008/github/wave1008/shirates-samples-job1/src/test/kotlin'
    23  2023/03/18 11:02:39.424 {}      [info]  ()      Initializing TestDriver.(profileName=Pixel 3a API 31(Android 12))
    24  2023/03/18 11:02:39.425 {}      [info]  ()      noLoadRun: false
    25  2023/03/18 11:02:39.426 {}      [info]  ()      boundsToRectRatio: 1
    26  2023/03/18 11:02:39.426 {}      [info]  ()      reuseDriver: true
    27  2023/03/18 11:02:39.426 {}      [info]  ()      autoScreenshot: true
    28  2023/03/18 11:02:39.427 {}      [info]  ()      onChangedOnly: true
    29  2023/03/18 11:02:39.427 {}      [info]  ()      onCondition: true
    30  2023/03/18 11:02:39.428 {}      [info]  ()      onAction: true
    31  2023/03/18 11:02:39.428 {}      [info]  ()      onExpectation: true
    32  2023/03/18 11:02:39.429 {}      [info]  ()      onExecOperateCommand: true
    33  2023/03/18 11:02:39.429 {}      [info]  ()      onCheckCommand: true
    34  2023/03/18 11:02:39.429 {}      [info]  ()      onScrolling: true
    35  2023/03/18 11:02:39.430 {}      [info]  ()      manualScreenshot: true
    36  2023/03/18 11:02:39.430 {}      [info]  ()      retryMaxCount: 1
    37  2023/03/18 11:02:39.431 {}      [info]  ()      retryIntervalSeconds: 2.0
    38  2023/03/18 11:02:39.432 {}      [info]  ()      shortWaitSeconds: 1.5
    39  2023/03/18 11:02:39.432 {}      [info]  ()      waitSecondsOnIsScreen: 15.0
    40  2023/03/18 11:02:39.433 {}      [info]  ()      waitSecondsForLaunchAppComplete: 15.0
    41  2023/03/18 11:02:39.433 {}      [info]  ()      waitSecondsForAnimationComplete: 0.5
    42  2023/03/18 11:02:39.434 {}      [info]  ()      waitSecondsForConnectionEnabled: 8.0
    43  2023/03/18 11:02:39.434 {}      [info]  ()      swipeDurationSeconds: 3.0
    44  2023/03/18 11:02:39.434 {}      [info]  ()      flickDurationSeconds: 0.3
    45  2023/03/18 11:02:39.444 {}      [info]  ()      swipeMarginRatio: 0.1
    46  2023/03/18 11:02:39.445 {}      [info]  ()      scrollVerticalMarginRatio: 0.2
    47  2023/03/18 11:02:39.446 {}      [info]  ()      scrollHorizontalMarginRatio: 0.2
    48  2023/03/18 11:02:39.446 {}      [info]  ()      tapHoldSeconds: 0.2
    49  2023/03/18 11:02:39.447 {}      [info]  ()      tapAppIconMethod: auto
    50  2023/03/18 11:02:39.447 {}      [info]  ()      tapAppIconMacro: 
    51  2023/03/18 11:02:39.448 {}      [info]  ()      syncWaitSeconds: 1.8
    52  2023/03/18 11:02:39.448 {}      [info]  ()      Searching device for the profile. (profileName=Pixel 3a API 31(Android 12))
    53  2023/03/18 11:02:39.510 {}      [info]  ()      emulator @Pixel_3a_API_31_Android_12_ -no-boot-anim -no-snapshot
    54  2023/03/18 11:02:53.851 {}      [info]  ()      Connected device found. (Pixel_3a_API_31_Android_12_:5554, Android 12, emulator-5554)
    55  2023/03/18 11:02:53.894 {}      [info]  ()      appium --session-override --relaxed-security --log /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_110238/Test1/appium_2023-03-18_110253854.log --port 4720
    56  2023/03/18 11:02:58.045 {}      [info]  ()      Appium Server started. (pid=98572, port=4720)
    57  2023/03/18 11:02:59.054 {}      [info]  ()      Connecting to Appium Server.(http://127.0.0.1:4720/)
    58  2023/03/18 11:03:09.294 {}      [info]  ()      [Health check] start
    59  2023/03/18 11:03:09.298 {}      [info]  (syncCache)     Syncing (1)
    60  2023/03/18 11:03:10.695 {}      [info]  (syncCache)     elapsed=1.396, syncWaitSeconds=15.0
    61  2023/03/18 11:03:11.198 {}      [info]  (syncCache)     Syncing (2)
    62  2023/03/18 11:03:11.536 {}      [info]  (syncCache)     Synced. (elapsed=2.237, currentScreen=?)
    63  2023/03/18 11:03:11.547 {}      [info]  ()      tap<.label>
    64  2023/03/18 11:03:13.018 {}      [info]  (syncCache)     Syncing (1)
    65  2023/03/18 11:03:13.123 {}      [info]  (syncCache)     Synced. (elapsed=0.105, currentScreen=?)
    66  2023/03/18 11:03:13.369 {}      [info]  ()      [Health check] end
    67  2023/03/18 11:03:13.374 {}      [info]  ()      implicitlyWaitSeconds: 5.0
    68  2023/03/18 11:03:13.450 {}      [info]  ()      (settings) always_finish_activities: 0
    69  2023/03/18 11:03:13.477 {}      [info]  ()      Searching device for the profile. (profileName=Pixel 3a API 31(Android 12))
    70  2023/03/18 11:03:13.591 {}      [info]  ()      Connected device found. (Pixel_3a_API_31_Android_12_:5554, Android 12, emulator-5554)
    71  2023/03/18 11:03:13.591 {}      [info]  ()      AppiumDriver initialized.
    72  2023/03/18 11:03:13.592 {}      [-]     (parameter)     testrun: testConfig/testrun.properties
    73  2023/03/18 11:03:13.592 {}      [-]     (parameter)     testConfigName: androidSettingsConfig(/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/androidSettingsConfig.json)
    74  2023/03/18 11:03:13.592 {}      [-]     (parameter)     profileName: Pixel 3a API 31(Android 12)
    75  2023/03/18 11:03:13.593 {}      [-]     (parameter)     appIconName: Settings
    76  2023/03/18 11:03:13.593 {}      [-]     ()      (capabilities)
    77  2023/03/18 11:03:13.593 {}      [-]     (parameter)     appium:newCommandTimeout: 300
    78  2023/03/18 11:03:13.594 {}      [-]     (parameter)     appium:takesScreenshot: true
    79  2023/03/18 11:03:13.594 {}      [-]     (parameter)     appium:warnings: {}
    80  2023/03/18 11:03:13.594 {}      [-]     (parameter)     appium:deviceApiLevel: 31
    81  2023/03/18 11:03:13.594 {}      [-]     (parameter)     appium:automationName: UiAutomator2
    82  2023/03/18 11:03:13.595 {}      [-]     (parameter)     appium:locationContextEnabled: false
    83  2023/03/18 11:03:13.595 {}      [-]     (parameter)     appium:deviceScreenSize: 1080x2220
    84  2023/03/18 11:03:13.595 {}      [-]     (parameter)     appium:deviceManufacturer: Google
    85  2023/03/18 11:03:13.596 {}      [-]     (parameter)     appium:udid: emulator-5554
    86  2023/03/18 11:03:13.596 {}      [-]     (parameter)     appium:pixelRatio: 2.75
    87  2023/03/18 11:03:13.596 {}      [-]     (parameter)     platformName: ANDROID
    88  2023/03/18 11:03:13.597 {}      [-]     (parameter)     appium:networkConnectionEnabled: true
    89  2023/03/18 11:03:13.597 {}      [-]     (parameter)     appium:locale: US
    90  2023/03/18 11:03:13.597 {}      [-]     (parameter)     appium:deviceScreenDensity: 440
    91  2023/03/18 11:03:13.597 {}      [-]     (parameter)     appium:viewportRect: {left=0, top=66, width=1080, height=2022}
    92  2023/03/18 11:03:13.598 {}      [-]     (parameter)     appium:language: en
    93  2023/03/18 11:03:13.598 {}      [-]     (parameter)     appium:avd: Pixel_3a_API_31_Android_12_
    94  2023/03/18 11:03:13.598 {}      [-]     (parameter)     appium:deviceModel: sdk_gphone64_arm64
    95  2023/03/18 11:03:13.598 {}      [-]     (parameter)     appium:platformVersion: 12
    96  2023/03/18 11:03:13.599 {}      [-]     (parameter)     appium:databaseEnabled: false
    97  2023/03/18 11:03:13.599 {}      [-]     (parameter)     appium:deviceUDID: emulator-5554
    98  2023/03/18 11:03:13.599 {}      [-]     (parameter)     appium:statBarHeight: 66
    99  2023/03/18 11:03:13.600 {}      [-]     (parameter)     appium:webStorageEnabled: false
    100 2023/03/18 11:03:13.600 {}      [-]     (parameter)     appium:appActivity: com.android.settings.Settings
    101 2023/03/18 11:03:13.600 {}      [-]     (parameter)     appium:deviceName: emulator-5554
    102 2023/03/18 11:03:13.600 {}      [-]     (parameter)     appium:javascriptEnabled: true
    103 2023/03/18 11:03:13.600 {}      [-]     (parameter)     appium:appPackage: com.android.settings
    104 2023/03/18 11:03:13.601 {}      [-]     ()      settings
    105 2023/03/18 11:03:13.671 {}      [-]     (parameter)     always_finish_activities: 0
    106 2023/03/18 11:03:13.672 {}      [-]     ()      (others)
    107 2023/03/18 11:03:13.672 {}      [-]     (parameter)     isEmulator: true
    108 2023/03/18 11:03:13.672 {}      [-]     (parameter)     hasOsaihuKeitai: false
    109 2023/03/18 11:03:13.673 {}      [info]  ()      Setup executed. (duration: 35.0 sec)
    110 2023/03/18 11:03:13.677 {}      [info]  ()      Running scenario ..................................................
    111 2023/03/18 11:03:13.677 {}      [info]  ()      Startup package: com.android.settings
    112 2023/03/18 11:03:13.677 {test1} [SCENARIO]      (scenario)      test1()
    113 2023/03/18 11:03:14.178 {test1} [screenshot]    (screenshot)    screenshot
    114 2023/03/18 11:03:14.179 {test1} [operate]       (launchApp)     Launch app <Settings>
    115 2023/03/18 11:03:14.480 {test1} [info]  (syncCache)     Syncing (1)
    116 2023/03/18 11:03:15.122 {test1} [info]  (syncCache)     Synced. (elapsed=0.642, currentScreen=?)
    117 2023/03/18 11:03:15.124 {test1-1}       [CASE]  (case)  (1)
    118 2023/03/18 11:03:15.125 {test1-1}       [CONDITION]     (condition)     condition
    119 2023/03/18 11:03:15.126 {test1-1}       [info]  ()      Pixel 3a API 31(Android 12)
    120 2023/03/18 11:03:15.126 {test1-1}       [ACTION]        (action)        action
    121 2023/03/18 11:03:15.127 {test1-1}       [operate]       (pressHome)     Press OS home
    122 2023/03/18 11:03:15.155 {test1-1}       [info]  (syncCache)     Syncing (1)
    123 2023/03/18 11:03:16.269 {test1-1}       [info]  (syncCache)     elapsed=1.114, syncWaitSeconds=1.8
    124 2023/03/18 11:03:16.773 {test1-1}       [info]  (syncCache)     Syncing (2)
    125 2023/03/18 11:03:17.433 {test1-1}       [info]  (syncCache)     Synchronization timed out (elapsed=2.276 > syncWaitSeconds=1.8, currentScreen=[Android Home Screen])
    126 2023/03/18 11:03:19.763 {test1-1}       [screenshot]    (screenshot)    screenshot
    127 2023/03/18 11:03:19.765 {test1-1}       [EXPECTATION]   (expectation)   expectation
    128 2023/03/18 11:03:19.766 {test1-1}       [branch]        (os)    android {
    129 2023/03/18 11:03:19.768 {test1-1}       [OK]    (screenIs)      [Android Home Screen] is displayed
    130 2023/03/18 11:03:19.769 {test1-1}       [branch]        (os)    } android
    131 2023/03/18 11:03:19.770 {test1-1}       [info]  ()      Scenario executed. (duration: 6.1 sec)
    132 2023/03/18 11:03:19.771 {}      [info]  ()      Test function executed. (duration: 41.3 sec)
    133 2023/03/18 11:03:19.772 {}      [info]  ()      End of Test function: test1 [test1()]

Test1 STANDARD_OUT
    134 2023/03/18 11:03:19.776 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_110238/Test1/
    Copying jar content _ReportScript.js to /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_110238/Test1
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_110238/Test1
    Loading: /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_110238/Test1/TestLog(commandList)_20230318110238.log
    Saved: /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_110238/Test1/Test1@a.xlsx

    135 2023/03/18 11:03:20.299 {}      [info]  ()      Quitting TestDriver.
    136 2023/03/18 11:03:20.582 {}      [info]  ()      Test class executed. (duration: 42.4 sec)

Gradle Test Executor 24 finished executing tests.

> Task :test
Finished generating test XML results (0.001 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test
Generating HTML test report...
Finished generating test html results (0.003 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/reports/tests/test
:test (Thread[Execution worker for ':',5,main]) completed. Took 43.396 secs.
producer locations for task group 1 (Thread[Execution worker for ':',5,main]) started.
producer locations for task group 1 (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.

BUILD SUCCESSFUL in 44s
5 actionable tasks: 2 executed, 3 up-to-date
Watched directory hierarchies: [/Users/wave1008/github/wave1008/shirates-samples-job1, /Users/wave1008/Downloads/shirates-samples-job1]
/// Starting test
Initialized native services in: /Users/wave1008/.gradle/native
Initialized jansi services in: /Users/wave1008/.gradle/native
The client will now receive all logging from the daemon (pid: 87859). The daemon log file: /Users/wave1008/.gradle/daemon/7.4.2/daemon-87859.out.log
Starting 26th build in daemon [uptime: 1 hrs 31 mins 44.882 secs, performance: 100%, non-heap usage: 44% of 256 MiB]
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
:cleanTest (Thread[Execution worker for ':',5,main]) completed. Took 0.01 secs.
destroyer locations for task group 0 (Thread[Execution worker for ':',5,main]) started.
destroyer locations for task group 0 (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:compileJava (Thread[Execution worker for ':',5,main]) started.

> Task :compileJava NO-SOURCE
Skipping task ':compileJava' as it has no source files and no previous output files.
:compileJava (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.
:processResources (Thread[Execution worker for ':' Thread 3,5,main]) started.

> Task :processResources NO-SOURCE
Skipping task ':processResources' as it has no source files and no previous output files.
:processResources (Thread[Execution worker for ':' Thread 3,5,main]) completed. Took 0.0 secs.
:classes (Thread[Execution worker for ':' Thread 3,5,main]) started.

> Task :classes UP-TO-DATE
Skipping task ':classes' as it has no actions.
:classes (Thread[Execution worker for ':' Thread 3,5,main]) completed. Took 0.0 secs.
:jar (Thread[Execution worker for ':' Thread 3,5,main]) started.

> Task :jar UP-TO-DATE
Caching disabled for task ':jar' because:
  Build cache is disabled
Skipping task ':jar' as it is up-to-date.
:jar (Thread[Execution worker for ':' Thread 3,5,main]) completed. Took 0.001 secs.
:inspectClassesForKotlinIC (Thread[Execution worker for ':' Thread 3,5,main]) started.

> Task :inspectClassesForKotlinIC UP-TO-DATE
Caching disabled for task ':inspectClassesForKotlinIC' because:
  Build cache is disabled
Skipping task ':inspectClassesForKotlinIC' as it is up-to-date.
:inspectClassesForKotlinIC (Thread[Execution worker for ':' Thread 3,5,main]) completed. Took 0.0 secs.
:compileTestKotlin (Thread[Execution worker for ':' Thread 3,5,main]) started.

> Task :compileTestKotlin UP-TO-DATE
Caching disabled for task ':compileTestKotlin' because:
  Build cache is disabled
Skipping task ':compileTestKotlin' as it is up-to-date.
:compileTestKotlin (Thread[Execution worker for ':' Thread 3,5,main]) completed. Took 0.065 secs.
:compileTestJava (Thread[Execution worker for ':' Thread 3,5,main]) started.

> Task :compileTestJava NO-SOURCE
Skipping task ':compileTestJava' as it has no source files and no previous output files.
:compileTestJava (Thread[Execution worker for ':' Thread 3,5,main]) completed. Took 0.0 secs.
:processTestResources (Thread[Execution worker for ':' Thread 3,5,main]) started.

> Task :processTestResources NO-SOURCE
Skipping task ':processTestResources' as it has no source files and no previous output files.
:processTestResources (Thread[Execution worker for ':' Thread 3,5,main]) completed. Took 0.0 secs.
:testClasses (Thread[Execution worker for ':' Thread 3,5,main]) started.

> Task :testClasses UP-TO-DATE
Skipping task ':testClasses' as it has no actions.
:testClasses (Thread[Execution worker for ':' Thread 3,5,main]) completed. Took 0.0 secs.
:test (Thread[included builds,5,main]) started.
Gradle Test Executor 25 started executing tests.

> Task :test
Caching disabled for task ':test' because:
  Build cache is disabled
Task ':test' is not up-to-date because:
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin.idx has been removed.
file or directory '/Users/wave1008/github/wave1008/shirates-samples-job1/build/classes/java/test', not found
Starting process 'Gradle Test Executor 25'. Working directory: /Users/wave1008/github/wave1008/shirates-samples-job1 Command: /Users/wave1008/Library/Java/JavaVirtualMachines/corretto-17.0.4/Contents/Home/bin/java -Dorg.gradle.internal.worker.tmpdir=/Users/wave1008/github/wave1008/shirates-samples-job1/build/tmp/test/work -Dorg.gradle.native=false --add-exports java.desktop/sun.awt.image=ALL-UNNAMED @/Users/wave1008/.gradle/.tmp/gradle-worker-classpath1000409427404861932txt -Xmx512m -Dfile.encoding=UTF-8 -Duser.country=JP -Duser.language=ja -Duser.variant -ea worker.org.gradle.process.internal.worker.GradleWorkerMain 'Gradle Test Executor 25'
Successfully started process 'Gradle Test Executor 25'

Test1 STANDARD_OUT
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 11:03:22.680 {}      [info]  ()      Importing environment variables.
    2   2023/03/18 11:03:22.910 {}      [info]  ()      SR_profile=iPhone 14(16.2)
    3   2023/03/18 11:03:22.910 {}      [info]  ()      SR_configFile=testConfig/iOSSettingsConfig.json
    4   2023/03/18 11:03:22.910 {}      [info]  ()      SR_os=ios
    5   2023/03/18 11:03:22.910 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 11:03:22.911 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    2   2023/03/18 11:03:22.912 {}      [-]     ()      ///
    3   2023/03/18 11:03:22.912 {}      [-]     ()      /// Shirates 3.1.1
    4   2023/03/18 11:03:22.912 {}      [-]     ()      ///
    5   2023/03/18 11:03:22.914 {}      [-]     ()      powered by Appium (io.appium:java-client:8.1.1)
    6   2023/03/18 11:03:22.914 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    7   2023/03/18 11:03:22.914 {}      [-]     (parameter)     testClass: product1.Test1
    8   2023/03/18 11:03:22.914 {}      [-]     (parameter)     sheetName: Test1
    9   2023/03/18 11:03:22.915 {}      [-]     (parameter)     logLanguage: 

Test1 > test1() STANDARD_OUT
    10  2023/03/18 11:03:22.924 {}      [info]  ()      ----------------------------------------------------------------------------------------------------
    11  2023/03/18 11:03:22.925 {}      [info]  ()      Test function: test1 [test1()]
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    12  2023/03/18 11:03:22.925 {}      [info]  ()      Importing environment variables.
    13  2023/03/18 11:03:22.925 {}      [info]  ()      SR_profile=iPhone 14(16.2)
    14  2023/03/18 11:03:22.926 {}      [info]  ()      SR_configFile=testConfig/iOSSettingsConfig.json
    15  2023/03/18 11:03:22.926 {}      [info]  ()      SR_os=ios
    16  2023/03/18 11:03:22.926 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    17  2023/03/18 11:03:23.657 {}      [info]  ()      Initializing with testrun file.(testConfig/testrun.properties)
    18  2023/03/18 11:03:23.736 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_110322/Test1/
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_110322/Test1
    19  2023/03/18 11:03:23.767 {}      [info]  ()      Loading config.(configFile=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/iOSSettingsConfig.json, profileName=iPhone 14(16.2))
    20  2023/03/18 11:03:23.803 {}      [info]  ()      Loading screen files.(directory=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/screens)
    21  2023/03/18 11:03:23.812 {}      [info]  ()      Screen files loaded.(2 files)
    22  2023/03/18 11:03:23.823 {}      [info]  ()      Scanning macro under '/Users/wave1008/github/wave1008/shirates-samples-job1/src/test/kotlin'
    23  2023/03/18 11:03:23.824 {}      [info]  ()      Initializing TestDriver.(profileName=iPhone 14(16.2))
    24  2023/03/18 11:03:23.825 {}      [info]  ()      noLoadRun: false
    25  2023/03/18 11:03:23.825 {}      [info]  ()      boundsToRectRatio: 3
    26  2023/03/18 11:03:23.825 {}      [info]  ()      reuseDriver: true
    27  2023/03/18 11:03:23.825 {}      [info]  ()      autoScreenshot: true
    28  2023/03/18 11:03:23.826 {}      [info]  ()      onChangedOnly: true
    29  2023/03/18 11:03:23.826 {}      [info]  ()      onCondition: true
    30  2023/03/18 11:03:23.826 {}      [info]  ()      onAction: true
    31  2023/03/18 11:03:23.827 {}      [info]  ()      onExpectation: true
    32  2023/03/18 11:03:23.827 {}      [info]  ()      onExecOperateCommand: true
    33  2023/03/18 11:03:23.828 {}      [info]  ()      onCheckCommand: true
    34  2023/03/18 11:03:23.828 {}      [info]  ()      onScrolling: true
    35  2023/03/18 11:03:23.828 {}      [info]  ()      manualScreenshot: true
    36  2023/03/18 11:03:23.828 {}      [info]  ()      retryMaxCount: 1
    37  2023/03/18 11:03:23.829 {}      [info]  ()      retryIntervalSeconds: 2.0
    38  2023/03/18 11:03:23.830 {}      [info]  ()      shortWaitSeconds: 1.5
    39  2023/03/18 11:03:23.830 {}      [info]  ()      waitSecondsOnIsScreen: 15.0
    40  2023/03/18 11:03:23.830 {}      [info]  ()      waitSecondsForLaunchAppComplete: 15.0
    41  2023/03/18 11:03:23.831 {}      [info]  ()      waitSecondsForAnimationComplete: 0.5
    42  2023/03/18 11:03:23.831 {}      [info]  ()      swipeDurationSeconds: 3.0
    43  2023/03/18 11:03:23.831 {}      [info]  ()      flickDurationSeconds: 0.3
    44  2023/03/18 11:03:23.832 {}      [info]  ()      swipeMarginRatio: 0.1
    45  2023/03/18 11:03:23.833 {}      [info]  ()      scrollVerticalMarginRatio: 0.2
    46  2023/03/18 11:03:23.834 {}      [info]  ()      scrollHorizontalMarginRatio: 0.2
    47  2023/03/18 11:03:23.835 {}      [info]  ()      tapHoldSeconds: 0.2
    48  2023/03/18 11:03:23.836 {}      [info]  ()      tapAppIconMethod: auto
    49  2023/03/18 11:03:23.837 {}      [info]  ()      tapAppIconMacro: 
    50  2023/03/18 11:03:23.838 {}      [info]  ()      syncWaitSeconds: 1.8
    51  2023/03/18 11:03:23.839 {}      [info]  ()      Searching device for the profile. (profileName=iPhone 14(16.2))
    52  2023/03/18 11:03:26.186 {}      [info]  ()      Device found. (iPhone 14, iOS 16.2, A92DD7F7-7B50-4CA1-8060-72F46D777B94)
    53  2023/03/18 11:03:26.228 {}      [info]  ()      appium --session-override --relaxed-security --log /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_110322/Test1/appium_2023-03-18_110326191.log --port 4720
    54  2023/03/18 11:03:29.299 {}      [info]  ()      Appium Server started. (pid=98756, port=4720)
    55  2023/03/18 11:03:30.307 {}      [info]  ()      Connecting to Appium Server.(http://127.0.0.1:4720/)
    56  2023/03/18 11:03:30.308 {}      [info]  ()      Note: Initializing IOSDriver may take a few minutes to build and install WebDriverAgent.

Test1 > test1() STANDARD_ERROR
    Cleaning up unclosed ZipFile for archive /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/TestList_iOSSettingsConfig.xlsx

Test1 > test1() STANDARD_OUT
    57  2023/03/18 11:03:57.182 {}      [info]  ()      implicitlyWaitSeconds: 5.0
    58  2023/03/18 11:03:57.183 {}      [info]  ()      Searching device for the profile. (profileName=iPhone 14(16.2))
    59  2023/03/18 11:03:58.960 {}      [info]  ()      Device found. (iPhone 14, iOS 16.2, A92DD7F7-7B50-4CA1-8060-72F46D777B94)
    60  2023/03/18 11:03:58.961 {}      [info]  ()      AppiumDriver initialized.
    61  2023/03/18 11:03:58.961 {}      [-]     (parameter)     testrun: testConfig/testrun.properties
    62  2023/03/18 11:03:58.961 {}      [-]     (parameter)     testConfigName: iOSSettingsConfig(/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/iOSSettingsConfig.json)
    63  2023/03/18 11:03:58.962 {}      [-]     (parameter)     profileName: iPhone 14(16.2)
    64  2023/03/18 11:03:58.962 {}      [-]     (parameter)     appIconName: Settings
    65  2023/03/18 11:03:58.962 {}      [-]     ()      (capabilities)
    66  2023/03/18 11:03:58.963 {}      [-]     (parameter)     appium:networkConnectionEnabled: false
    67  2023/03/18 11:03:58.963 {}      [-]     (parameter)     appium:showXcodeLog: true
    68  2023/03/18 11:03:58.963 {}      [-]     (parameter)     appium:newCommandTimeout: 300
    69  2023/03/18 11:03:58.963 {}      [-]     (parameter)     appium:locale: US
    70  2023/03/18 11:03:58.963 {}      [-]     (parameter)     appium:takesScreenshot: true
    71  2023/03/18 11:03:58.963 {}      [-]     (parameter)     appium:bundleId: com.apple.Preferences
    72  2023/03/18 11:03:58.964 {}      [-]     (parameter)     appium:language: en
    73  2023/03/18 11:03:58.964 {}      [-]     (parameter)     appium:automationName: XCUITest
    74  2023/03/18 11:03:58.964 {}      [-]     (parameter)     appium:locationContextEnabled: false
    75  2023/03/18 11:03:58.964 {}      [-]     (parameter)     appium:platformVersion: 16.2
    76  2023/03/18 11:03:58.964 {}      [-]     (parameter)     appium:useJSONSource: true
    77  2023/03/18 11:03:58.965 {}      [-]     (parameter)     appium:databaseEnabled: false
    78  2023/03/18 11:03:58.965 {}      [-]     (parameter)     appium:udid: A92DD7F7-7B50-4CA1-8060-72F46D777B94
    79  2023/03/18 11:03:58.965 {}      [-]     (parameter)     appium:webStorageEnabled: false
    80  2023/03/18 11:03:58.965 {}      [-]     (parameter)     appium:deviceName: iPhone 14
    81  2023/03/18 11:03:58.965 {}      [-]     (parameter)     appium:javascriptEnabled: true
    82  2023/03/18 11:03:58.966 {}      [-]     (parameter)     platformName: IOS
    83  2023/03/18 11:03:58.966 {}      [-]     (parameter)     appium:appPackage: com.apple.Preferences
    84  2023/03/18 11:03:58.966 {}      [-]     ()      (others)
    85  2023/03/18 11:03:58.967 {}      [-]     (parameter)     isEmulator: true
    86  2023/03/18 11:03:58.967 {}      [-]     (parameter)     hasOsaihuKeitai: false
    87  2023/03/18 11:03:58.968 {}      [info]  ()      Setup executed. (duration: 36.0 sec)
    88  2023/03/18 11:03:58.974 {}      [info]  (syncCache)     Syncing (1)
    89  2023/03/18 11:03:59.865 {}      [info]  (syncCache)     elapsed=0.89, syncWaitSeconds=1.8
    90  2023/03/18 11:03:59.865 {}      [info]  (syncCache)     Syncing (2)
    91  2023/03/18 11:04:00.871 {}      [info]  (syncCache)     Synchronization timed out (elapsed=1.897 > syncWaitSeconds=1.8, currentScreen=?)
    92  2023/03/18 11:04:00.872 {}      [info]  ()      Running scenario ..................................................
    93  2023/03/18 11:04:00.872 {test1} [SCENARIO]      (scenario)      test1()
    94  2023/03/18 11:04:01.476 {test1} [screenshot]    (screenshot)    screenshot
    95  2023/03/18 11:04:01.477 {test1} [operate]       (launchApp)     Launch app <Settings>
    96  2023/03/18 11:04:02.543 {test1} [info]  (launchApp)     Launching app. (bundleId=com.apple.Preferences)
    97  2023/03/18 11:04:02.544 {test1} [info]  (execute)       xcrun simctl launch A92DD7F7-7B50-4CA1-8060-72F46D777B94 com.apple.Preferences
    98  2023/03/18 11:04:02.778 {test1} [info]  (launchApp)     doUntilTrue(1)
    99  2023/03/18 11:04:02.783 {test1} [info]  (syncCache)     Syncing (1)
    100 2023/03/18 11:04:04.498 {test1} [info]  (syncCache)     elapsed=1.715, syncWaitSeconds=1.8
    101 2023/03/18 11:04:04.499 {test1} [info]  (syncCache)     Syncing (2)
    102 2023/03/18 11:04:05.415 {test1} [info]  (syncCache)     Synchronization timed out (elapsed=2.632 > syncWaitSeconds=1.8, currentScreen=?)
    103 2023/03/18 11:04:07.417 {test1} [info]  (launchApp)     App launched. (com.apple.Preferences)
    104 2023/03/18 11:04:07.624 {test1} [screenshot]    (screenshot)    screenshot
    105 2023/03/18 11:04:07.625 {test1-1}       [CASE]  (case)  (1)
    106 2023/03/18 11:04:07.626 {test1-1}       [CONDITION]     (condition)     condition
    107 2023/03/18 11:04:07.626 {test1-1}       [info]  ()      iPhone 14(16.2)
    108 2023/03/18 11:04:07.627 {test1-1}       [ACTION]        (action)        action
    109 2023/03/18 11:04:07.628 {test1-1}       [operate]       (pressHome)     Press OS home
    110 2023/03/18 11:04:08.205 {test1-1}       [info]  (syncCache)     Syncing (1)
    111 2023/03/18 11:04:18.702 {test1-1}       [info]  (syncCache)     Synchronization timed out (elapsed=10.497 > syncWaitSeconds=1.8, currentScreen=[iOS Home Screen])
    112 2023/03/18 11:04:20.718 {test1-1}       [screenshot]    (screenshot)    screenshot
    113 2023/03/18 11:04:20.722 {test1-1}       [EXPECTATION]   (expectation)   expectation
    114 2023/03/18 11:04:20.724 {test1-1}       [branch]        (os)    ios {
    115 2023/03/18 11:04:20.727 {test1-1}       [OK]    (screenIs)      [iOS Home Screen] is displayed
    116 2023/03/18 11:04:20.728 {test1-1}       [branch]        (os)    } ios
    117 2023/03/18 11:04:20.728 {test1-1}       [info]  ()      Scenario executed. (duration: 21.8 sec)
    118 2023/03/18 11:04:20.730 {}      [info]  ()      Test function executed. (duration: 57.8 sec)
    119 2023/03/18 11:04:20.730 {}      [info]  ()      End of Test function: test1 [test1()]

Test1 STANDARD_OUT
    120 2023/03/18 11:04:20.732 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_110322/Test1/
    Copying jar content _ReportScript.js to /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_110322/Test1
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_110322/Test1
    Loading: /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_110322/Test1/TestLog(commandList)_20230318110322.log
    Saved: /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_110322/Test1/Test1@i.xlsx

    121 2023/03/18 11:04:21.154 {}      [info]  ()      Quitting TestDriver.
    122 2023/03/18 11:04:22.229 {}      [info]  ()      Test class executed. (duration: 59.6 sec)

Gradle Test Executor 25 finished executing tests.

> Task :test
Finished generating test XML results (0.001 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test
Generating HTML test report...
Finished generating test html results (0.002 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/reports/tests/test
:test (Thread[included builds,5,main]) completed. Took 1 mins 0.498 secs.
producer locations for task group 1 (Thread[included builds,5,main]) started.
producer locations for task group 1 (Thread[included builds,5,main]) completed. Took 0.0 secs.

BUILD SUCCESSFUL in 1m 1s
5 actionable tasks: 2 executed, 3 up-to-date
Watched directory hierarchies: [/Users/wave1008/github/wave1008/shirates-samples-job1, /Users/wave1008/Downloads/shirates-samples-job1]
wave1008@SNB-M1 shirates-samples-job1 % 
```