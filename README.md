# shirates-samples-job1

How to run test job

## Script files

| Script file        | Description              |
|--------------------|--------------------------|
| runtest-all.sh     | executes all scripts     |
| runtest-android.sh | run test in Android mode |
| runtest-ios.sh     | run test in iOS mode     |

## Prerequisite

https://github.com/ldi-github/shirates-core/blob/main/doc/markdown/quick-start.md

## Run all tests

1. Open this project in IntelliJ IDEA.
2. Right click on the script file(`runtest-all.sh`) and select `Run`.

You can see like this.

```
wave1008@SNB-M1 shirates-samples-job1 % /bin/zsh /Users/wave1008/github/wave1008/shirates-samples-job1/runtest-all.sh
/// Starting test
Initialized native services in: /Users/wave1008/.gradle/native
Initialized jansi services in: /Users/wave1008/.gradle/native
The client will now receive all logging from the daemon (pid: 87859). The daemon log file: /Users/wave1008/.gradle/daemon/7.4.2/daemon-87859.out.log
Starting 12th build in daemon [uptime: 44 mins 55.88 secs, performance: 100%, non-heap usage: 26% of 256 MiB]
Using 10 worker leases.
Now considering [/Users/wave1008/github/wave1008/shirates-samples-job1] as hierarchies to watch
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
destroyer locations for task group 0 (Thread[included builds,5,main]) started.
destroyer locations for task group 0 (Thread[included builds,5,main]) completed. Took 0.0 secs.
:compileJava (Thread[included builds,5,main]) started.

> Task :compileJava NO-SOURCE
Skipping task ':compileJava' as it has no source files and no previous output files.
:compileJava (Thread[included builds,5,main]) completed. Took 0.0 secs.
:processResources (Thread[included builds,5,main]) started.

> Task :processResources NO-SOURCE
Skipping task ':processResources' as it has no source files and no previous output files.
:processResources (Thread[included builds,5,main]) completed. Took 0.0 secs.
:classes (Thread[included builds,5,main]) started.

> Task :classes UP-TO-DATE
Skipping task ':classes' as it has no actions.
:classes (Thread[included builds,5,main]) completed. Took 0.0 secs.
:jar (Thread[included builds,5,main]) started.

> Task :jar UP-TO-DATE
Caching disabled for task ':jar' because:
  Build cache is disabled
Skipping task ':jar' as it is up-to-date.
:jar (Thread[included builds,5,main]) completed. Took 0.001 secs.
:inspectClassesForKotlinIC (Thread[included builds,5,main]) started.

> Task :inspectClassesForKotlinIC UP-TO-DATE
Caching disabled for task ':inspectClassesForKotlinIC' because:
  Build cache is disabled
Skipping task ':inspectClassesForKotlinIC' as it is up-to-date.
:inspectClassesForKotlinIC (Thread[included builds,5,main]) completed. Took 0.0 secs.
:compileTestKotlin (Thread[included builds,5,main]) started.

> Task :compileTestKotlin UP-TO-DATE
Caching disabled for task ':compileTestKotlin' because:
  Build cache is disabled
Skipping task ':compileTestKotlin' as it is up-to-date.
:compileTestKotlin (Thread[included builds,5,main]) completed. Took 0.037 secs.
:compileTestJava (Thread[included builds,5,main]) started.

> Task :compileTestJava NO-SOURCE
Skipping task ':compileTestJava' as it has no source files and no previous output files.
:compileTestJava (Thread[included builds,5,main]) completed. Took 0.0 secs.
:processTestResources (Thread[included builds,5,main]) started.

> Task :processTestResources NO-SOURCE
Skipping task ':processTestResources' as it has no source files and no previous output files.
:processTestResources (Thread[included builds,5,main]) completed. Took 0.0 secs.
:testClasses (Thread[included builds,5,main]) started.

> Task :testClasses UP-TO-DATE
Skipping task ':testClasses' as it has no actions.
:testClasses (Thread[included builds,5,main]) completed. Took 0.0 secs.
:test (Thread[included builds,5,main]) started.
Gradle Test Executor 12 started executing tests.

> Task :test
Caching disabled for task ':test' because:
  Build cache is disabled
Task ':test' is not up-to-date because:
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin.idx has been removed.
file or directory '/Users/wave1008/github/wave1008/shirates-samples-job1/build/classes/java/test', not found
Starting process 'Gradle Test Executor 12'. Working directory: /Users/wave1008/github/wave1008/shirates-samples-job1 Command: /Users/wave1008/Library/Java/JavaVirtualMachines/corretto-17.0.4/Contents/Home/bin/java -Dorg.gradle.internal.worker.tmpdir=/Users/wave1008/github/wave1008/shirates-samples-job1/build/tmp/test/work -Dorg.gradle.native=false @/Users/wave1008/.gradle/.tmp/gradle-worker-classpath9486631234716441568txt -Xmx512m -Dfile.encoding=UTF-8 -Duser.country=JP -Duser.language=ja -Duser.variant -ea worker.org.gradle.process.internal.worker.GradleWorkerMain 'Gradle Test Executor 12'
Successfully started process 'Gradle Test Executor 12'

Test1 STANDARD_OUT
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 10:16:33.526 {}      [info]  ()      Importing environment variables.
    2   2023/03/18 10:16:33.701 {}      [info]  ()      SR_profile=Pixel 3a API 31(Android 12)
    3   2023/03/18 10:16:33.701 {}      [info]  ()      SR_configFile=testConfig/androidSettingsConfig.json
    4   2023/03/18 10:16:33.702 {}      [info]  ()      SR_os=android
    5   2023/03/18 10:16:33.702 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 10:16:33.703 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    2   2023/03/18 10:16:33.704 {}      [-]     ()      ///
    3   2023/03/18 10:16:33.705 {}      [-]     ()      /// Shirates 3.1.1
    4   2023/03/18 10:16:33.705 {}      [-]     ()      ///
    5   2023/03/18 10:16:33.707 {}      [-]     ()      powered by Appium (io.appium:java-client:8.1.1)
    6   2023/03/18 10:16:33.707 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    7   2023/03/18 10:16:33.707 {}      [-]     (parameter)     testClass: product1.Test1
    8   2023/03/18 10:16:33.707 {}      [-]     (parameter)     sheetName: Test1
    9   2023/03/18 10:16:33.707 {}      [-]     (parameter)     logLanguage: 

Test1 > test1() STANDARD_OUT
    10  2023/03/18 10:16:33.715 {}      [info]  ()      ----------------------------------------------------------------------------------------------------
    11  2023/03/18 10:16:33.715 {}      [info]  ()      Test function: test1 [test1()]
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    12  2023/03/18 10:16:33.716 {}      [info]  ()      Importing environment variables.
    13  2023/03/18 10:16:33.717 {}      [info]  ()      SR_profile=Pixel 3a API 31(Android 12)
    14  2023/03/18 10:16:33.717 {}      [info]  ()      SR_configFile=testConfig/androidSettingsConfig.json
    15  2023/03/18 10:16:33.717 {}      [info]  ()      SR_os=android
    16  2023/03/18 10:16:33.717 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    17  2023/03/18 10:16:34.425 {}      [info]  ()      Initializing with testrun file.(testConfig/testrun.properties)
    18  2023/03/18 10:16:34.497 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_101633/Test1/
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_101633/Test1
    19  2023/03/18 10:16:34.539 {}      [info]  ()      Loading config.(configFile=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/androidSettingsConfig.json, profileName=Pixel 3a API 31(Android 12))
    20  2023/03/18 10:16:34.574 {}      [info]  ()      Loading screen files.(directory=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/screens)
    21  2023/03/18 10:16:34.589 {}      [info]  ()      Screen files loaded.(2 files)
    22  2023/03/18 10:16:34.622 {}      [info]  ()      Scanning macro under '/Users/wave1008/github/wave1008/shirates-samples-job1/src/test/kotlin'
    23  2023/03/18 10:16:34.624 {}      [info]  ()      Initializing TestDriver.(profileName=Pixel 3a API 31(Android 12))
    24  2023/03/18 10:16:34.624 {}      [info]  ()      noLoadRun: false
    25  2023/03/18 10:16:34.624 {}      [info]  ()      boundsToRectRatio: 1
    26  2023/03/18 10:16:34.625 {}      [info]  ()      reuseDriver: true
    27  2023/03/18 10:16:34.625 {}      [info]  ()      autoScreenshot: true
    28  2023/03/18 10:16:34.625 {}      [info]  ()      onChangedOnly: true
    29  2023/03/18 10:16:34.626 {}      [info]  ()      onCondition: true
    30  2023/03/18 10:16:34.626 {}      [info]  ()      onAction: true
    31  2023/03/18 10:16:34.627 {}      [info]  ()      onExpectation: true
    32  2023/03/18 10:16:34.627 {}      [info]  ()      onExecOperateCommand: true
    33  2023/03/18 10:16:34.627 {}      [info]  ()      onCheckCommand: true
    34  2023/03/18 10:16:34.628 {}      [info]  ()      onScrolling: true
    35  2023/03/18 10:16:34.628 {}      [info]  ()      manualScreenshot: true
    36  2023/03/18 10:16:34.629 {}      [info]  ()      retryMaxCount: 1
    37  2023/03/18 10:16:34.629 {}      [info]  ()      retryIntervalSeconds: 2.0
    38  2023/03/18 10:16:34.629 {}      [info]  ()      shortWaitSeconds: 1.5
    39  2023/03/18 10:16:34.630 {}      [info]  ()      waitSecondsOnIsScreen: 15.0
    40  2023/03/18 10:16:34.630 {}      [info]  ()      waitSecondsForLaunchAppComplete: 15.0
    41  2023/03/18 10:16:34.630 {}      [info]  ()      waitSecondsForAnimationComplete: 0.5
    42  2023/03/18 10:16:34.631 {}      [info]  ()      waitSecondsForConnectionEnabled: 8.0
    43  2023/03/18 10:16:34.631 {}      [info]  ()      swipeDurationSeconds: 3.0
    44  2023/03/18 10:16:34.631 {}      [info]  ()      flickDurationSeconds: 0.3
    45  2023/03/18 10:16:34.631 {}      [info]  ()      swipeMarginRatio: 0.1
    46  2023/03/18 10:16:34.632 {}      [info]  ()      scrollVerticalMarginRatio: 0.2
    47  2023/03/18 10:16:34.633 {}      [info]  ()      scrollHorizontalMarginRatio: 0.2
    48  2023/03/18 10:16:34.633 {}      [info]  ()      tapHoldSeconds: 0.2
    49  2023/03/18 10:16:34.634 {}      [info]  ()      tapAppIconMethod: auto
    50  2023/03/18 10:16:34.635 {}      [info]  ()      tapAppIconMacro: 
    51  2023/03/18 10:16:34.635 {}      [info]  ()      syncWaitSeconds: 1.8
    52  2023/03/18 10:16:34.636 {}      [info]  ()      Searching device for the profile. (profileName=Pixel 3a API 31(Android 12))
    53  2023/03/18 10:16:34.834 {}      [info]  ()      Connected device found. (Pixel_3a_API_31_Android_12_:5556, Android 12, emulator-5556)
    54  2023/03/18 10:16:34.891 {}      [info]  ()      appium --session-override --relaxed-security --log /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_101633/Test1/appium_2023-03-18_101634837.log --port 4720
    55  2023/03/18 10:16:37.995 {}      [info]  ()      Appium Server started. (pid=93076, port=4720)
    56  2023/03/18 10:16:39.003 {}      [info]  ()      Connecting to Appium Server.(http://127.0.0.1:4720/)

Test1 > test1() STANDARD_ERROR
    Cleaning up unclosed ZipFile for archive /Users/wave1008/Downloads/TestResults/androidSettingsConfig/TestList_androidSettingsConfig.xlsx

Test1 > test1() STANDARD_OUT
    57  2023/03/18 10:16:44.703 {}      [info]  ()      [Health check] start
    58  2023/03/18 10:16:44.708 {}      [info]  (syncCache)     Syncing (1)
    59  2023/03/18 10:16:45.466 {}      [info]  (syncCache)     elapsed=0.757, syncWaitSeconds=15.0
    60  2023/03/18 10:16:45.970 {}      [info]  (syncCache)     Syncing (2)
    61  2023/03/18 10:16:46.095 {}      [info]  (syncCache)     Synced. (elapsed=1.386, currentScreen=?)
    62  2023/03/18 10:16:46.102 {}      [info]  ()      tap<.label>
    63  2023/03/18 10:16:47.532 {}      [info]  (syncCache)     Syncing (1)
    64  2023/03/18 10:16:47.628 {}      [info]  (syncCache)     Synced. (elapsed=0.096, currentScreen=?)
    65  2023/03/18 10:16:47.823 {}      [info]  ()      [Health check] end
    66  2023/03/18 10:16:47.827 {}      [info]  ()      implicitlyWaitSeconds: 5.0
    67  2023/03/18 10:16:47.902 {}      [info]  ()      (settings) always_finish_activities: 0
    68  2023/03/18 10:16:47.927 {}      [info]  ()      Searching device for the profile. (profileName=Pixel 3a API 31(Android 12))
    69  2023/03/18 10:16:48.113 {}      [info]  ()      Connected device found. (Pixel_3a_API_31_Android_12_:5556, Android 12, emulator-5556)
    70  2023/03/18 10:16:48.113 {}      [info]  ()      AppiumDriver initialized.
    71  2023/03/18 10:16:48.114 {}      [-]     (parameter)     testrun: testConfig/testrun.properties
    72  2023/03/18 10:16:48.114 {}      [-]     (parameter)     testConfigName: androidSettingsConfig(/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/androidSettingsConfig.json)
    73  2023/03/18 10:16:48.115 {}      [-]     (parameter)     profileName: Pixel 3a API 31(Android 12)
    74  2023/03/18 10:16:48.115 {}      [-]     (parameter)     appIconName: Settings
    75  2023/03/18 10:16:48.115 {}      [-]     ()      (capabilities)
    76  2023/03/18 10:16:48.116 {}      [-]     (parameter)     appium:newCommandTimeout: 300
    77  2023/03/18 10:16:48.116 {}      [-]     (parameter)     appium:takesScreenshot: true
    78  2023/03/18 10:16:48.116 {}      [-]     (parameter)     appium:warnings: {}
    79  2023/03/18 10:16:48.116 {}      [-]     (parameter)     appium:deviceApiLevel: 31
    80  2023/03/18 10:16:48.117 {}      [-]     (parameter)     appium:automationName: UiAutomator2
    81  2023/03/18 10:16:48.117 {}      [-]     (parameter)     appium:locationContextEnabled: false
    82  2023/03/18 10:16:48.117 {}      [-]     (parameter)     appium:deviceScreenSize: 1080x2220
    83  2023/03/18 10:16:48.118 {}      [-]     (parameter)     appium:deviceManufacturer: Google
    84  2023/03/18 10:16:48.118 {}      [-]     (parameter)     appium:udid: emulator-5556
    85  2023/03/18 10:16:48.118 {}      [-]     (parameter)     appium:pixelRatio: 2.75
    86  2023/03/18 10:16:48.119 {}      [-]     (parameter)     platformName: ANDROID
    87  2023/03/18 10:16:48.119 {}      [-]     (parameter)     appium:networkConnectionEnabled: true
    88  2023/03/18 10:16:48.119 {}      [-]     (parameter)     appium:locale: US
    89  2023/03/18 10:16:48.119 {}      [-]     (parameter)     appium:deviceScreenDensity: 440
    90  2023/03/18 10:16:48.120 {}      [-]     (parameter)     appium:viewportRect: {left=0, top=66, width=1080, height=2022}
    91  2023/03/18 10:16:48.120 {}      [-]     (parameter)     appium:language: en
    92  2023/03/18 10:16:48.120 {}      [-]     (parameter)     appium:avd: Pixel_3a_API_31_Android_12_
    93  2023/03/18 10:16:48.120 {}      [-]     (parameter)     appium:deviceModel: sdk_gphone64_arm64
    94  2023/03/18 10:16:48.121 {}      [-]     (parameter)     appium:platformVersion: 12
    95  2023/03/18 10:16:48.121 {}      [-]     (parameter)     appium:databaseEnabled: false
    96  2023/03/18 10:16:48.121 {}      [-]     (parameter)     appium:deviceUDID: emulator-5556
    97  2023/03/18 10:16:48.121 {}      [-]     (parameter)     appium:statBarHeight: 66
    98  2023/03/18 10:16:48.122 {}      [-]     (parameter)     appium:webStorageEnabled: false
    99  2023/03/18 10:16:48.122 {}      [-]     (parameter)     appium:appActivity: com.android.settings.Settings
    100 2023/03/18 10:16:48.122 {}      [-]     (parameter)     appium:deviceName: emulator-5556
    101 2023/03/18 10:16:48.123 {}      [-]     (parameter)     appium:javascriptEnabled: true
    102 2023/03/18 10:16:48.123 {}      [-]     (parameter)     appium:appPackage: com.android.settings
    103 2023/03/18 10:16:48.123 {}      [-]     ()      settings
    104 2023/03/18 10:16:48.192 {}      [-]     (parameter)     always_finish_activities: 0
    105 2023/03/18 10:16:48.193 {}      [-]     ()      (others)
    106 2023/03/18 10:16:48.193 {}      [-]     (parameter)     isEmulator: true
    107 2023/03/18 10:16:48.193 {}      [-]     (parameter)     hasOsaihuKeitai: false
    108 2023/03/18 10:16:48.194 {}      [info]  ()      Setup executed. (duration: 14.0 sec)
    109 2023/03/18 10:16:48.197 {}      [info]  ()      Running scenario ..................................................
    110 2023/03/18 10:16:48.197 {}      [info]  ()      Startup package: com.android.settings
    111 2023/03/18 10:16:48.198 {test1} [SCENARIO]      (scenario)      test1()
    112 2023/03/18 10:16:48.663 {test1} [screenshot]    (screenshot)    screenshot
    113 2023/03/18 10:16:48.667 {test1} [operate]       (launchApp)     Launch app <Settings>
    114 2023/03/18 10:16:48.895 {test1} [info]  (syncCache)     Syncing (1)
    115 2023/03/18 10:16:49.557 {test1} [info]  (syncCache)     Synced. (elapsed=0.662, currentScreen=?)
    116 2023/03/18 10:16:49.560 {test1-1}       [CASE]  (case)  (1)
    117 2023/03/18 10:16:49.560 {test1-1}       [CONDITION]     (condition)     condition
    118 2023/03/18 10:16:49.560 {test1-1}       [info]  ()      Pixel 3a API 31(Android 12)
    119 2023/03/18 10:16:49.561 {test1-1}       [ACTION]        (action)        action
    120 2023/03/18 10:16:49.562 {test1-1}       [operate]       (pressHome)     Press OS home
    121 2023/03/18 10:16:49.591 {test1-1}       [info]  (syncCache)     Syncing (1)
    122 2023/03/18 10:16:50.579 {test1-1}       [info]  (syncCache)     elapsed=0.988, syncWaitSeconds=1.8
    123 2023/03/18 10:16:51.082 {test1-1}       [info]  (syncCache)     Syncing (2)
    124 2023/03/18 10:16:51.119 {test1-1}       [info]  (syncCache)     Synced. (elapsed=1.528, currentScreen=[Android Home Screen])
    125 2023/03/18 10:16:53.029 {test1-1}       [screenshot]    (screenshot)    screenshot
    126 2023/03/18 10:16:53.030 {test1-1}       [EXPECTATION]   (expectation)   expectation
    127 2023/03/18 10:16:53.032 {test1-1}       [branch]        (os)    android {
    128 2023/03/18 10:16:53.034 {test1-1}       [OK]    (screenIs)      [Android Home Screen] is displayed
    129 2023/03/18 10:16:53.035 {test1-1}       [branch]        (os)    } android
    130 2023/03/18 10:16:53.035 {test1-1}       [info]  ()      Scenario executed. (duration: 4.8 sec)
    131 2023/03/18 10:16:53.036 {}      [info]  ()      Test function executed. (duration: 19.3 sec)
    132 2023/03/18 10:16:53.037 {}      [info]  ()      End of Test function: test1 [test1()]

Test1 STANDARD_OUT
    133 2023/03/18 10:16:53.039 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_101633/Test1/
    Copying jar content _ReportScript.js to /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_101633/Test1
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_101633/Test1
    Loading: /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_101633/Test1/TestLog(commandList)_20230318101633.log
    Saved: /Users/wave1008/Downloads/TestResults/androidSettingsConfig/2023-03-18_101633/Test1/Test1@a.xlsx

    134 2023/03/18 10:16:53.445 {}      [info]  ()      Quitting TestDriver.
    135 2023/03/18 10:16:53.537 {}      [info]  ()      Test class executed. (duration: 20.0 sec)

Gradle Test Executor 12 finished executing tests.

> Task :test
Finished generating test XML results (0.008 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test
Generating HTML test report...
Finished generating test html results (0.003 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/reports/tests/test
:test (Thread[included builds,5,main]) completed. Took 20.871 secs.
producer locations for task group 1 (Thread[included builds,5,main]) started.
producer locations for task group 1 (Thread[included builds,5,main]) completed. Took 0.0 secs.

BUILD SUCCESSFUL in 21s
5 actionable tasks: 2 executed, 3 up-to-date
Watched directory hierarchies: [/Users/wave1008/github/wave1008/shirates-samples-job1]
/// Starting test
Initialized native services in: /Users/wave1008/.gradle/native
Initialized jansi services in: /Users/wave1008/.gradle/native
The client will now receive all logging from the daemon (pid: 87859). The daemon log file: /Users/wave1008/.gradle/daemon/7.4.2/daemon-87859.out.log
Starting 13th build in daemon [uptime: 45 mins 17.814 secs, performance: 100%, non-heap usage: 26% of 256 MiB]
Using 10 worker leases.
Now considering [/Users/wave1008/github/wave1008/shirates-samples-job1] as hierarchies to watch
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
:cleanTest (Thread[Execution worker for ':',5,main]) completed. Took 0.007 secs.
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
:jar (Thread[Execution worker for ':',5,main]) completed. Took 0.002 secs.
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
:compileTestKotlin (Thread[Execution worker for ':',5,main]) completed. Took 0.077 secs.
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
Gradle Test Executor 13 started executing tests.

> Task :test
Caching disabled for task ':test' because:
  Build cache is disabled
Task ':test' is not up-to-date because:
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin has been removed.
  Output property 'binaryResultsDirectory' file /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test/binary/output.bin.idx has been removed.
file or directory '/Users/wave1008/github/wave1008/shirates-samples-job1/build/classes/java/test', not found
Starting process 'Gradle Test Executor 13'. Working directory: /Users/wave1008/github/wave1008/shirates-samples-job1 Command: /Users/wave1008/Library/Java/JavaVirtualMachines/corretto-17.0.4/Contents/Home/bin/java -Dorg.gradle.internal.worker.tmpdir=/Users/wave1008/github/wave1008/shirates-samples-job1/build/tmp/test/work -Dorg.gradle.native=false @/Users/wave1008/.gradle/.tmp/gradle-worker-classpath6615183616085727727txt -Xmx512m -Dfile.encoding=UTF-8 -Duser.country=JP -Duser.language=ja -Duser.variant -ea worker.org.gradle.process.internal.worker.GradleWorkerMain 'Gradle Test Executor 13'
Successfully started process 'Gradle Test Executor 13'

Test1 STANDARD_OUT
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 10:16:55.560 {}      [info]  ()      Importing environment variables.
    2   2023/03/18 10:16:55.731 {}      [info]  ()      SR_profile=iPhone 14(16.2)
    3   2023/03/18 10:16:55.731 {}      [info]  ()      SR_configFile=testConfig/iOSSettingsConfig.json
    4   2023/03/18 10:16:55.732 {}      [info]  ()      SR_os=ios
    5   2023/03/18 10:16:55.732 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    lineNo      logDateTime     testCaseId      logType group   message
    1   2023/03/18 10:16:55.733 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    2   2023/03/18 10:16:55.734 {}      [-]     ()      ///
    3   2023/03/18 10:16:55.734 {}      [-]     ()      /// Shirates 3.1.1
    4   2023/03/18 10:16:55.734 {}      [-]     ()      ///
    5   2023/03/18 10:16:55.736 {}      [-]     ()      powered by Appium (io.appium:java-client:8.1.1)
    6   2023/03/18 10:16:55.736 {}      [-]     ()      ----------------------------------------------------------------------------------------------------
    7   2023/03/18 10:16:55.736 {}      [-]     (parameter)     testClass: product1.Test1
    8   2023/03/18 10:16:55.737 {}      [-]     (parameter)     sheetName: Test1
    9   2023/03/18 10:16:55.737 {}      [-]     (parameter)     logLanguage: 

Test1 > test1() STANDARD_OUT
    10  2023/03/18 10:16:55.746 {}      [info]  ()      ----------------------------------------------------------------------------------------------------
    11  2023/03/18 10:16:55.747 {}      [info]  ()      Test function: test1 [test1()]
    Importing environment variable. SR_testrunFile=testConfig/testrun.properties
    12  2023/03/18 10:16:55.747 {}      [info]  ()      Importing environment variables.
    13  2023/03/18 10:16:55.748 {}      [info]  ()      SR_profile=iPhone 14(16.2)
    14  2023/03/18 10:16:55.748 {}      [info]  ()      SR_configFile=testConfig/iOSSettingsConfig.json
    15  2023/03/18 10:16:55.748 {}      [info]  ()      SR_os=ios
    16  2023/03/18 10:16:55.748 {}      [info]  ()      SR_testrunFile=testConfig/testrun.properties
    17  2023/03/18 10:16:56.321 {}      [info]  ()      Initializing with testrun file.(testConfig/testrun.properties)
    18  2023/03/18 10:16:56.378 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_101655/Test1/

Test1 > test1() STANDARD_ERROR
    Cleaning up unclosed ZipFile for archive /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/TestList_iOSSettingsConfig.xlsx

Test1 > test1() STANDARD_OUT
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_101655/Test1
    19  2023/03/18 10:16:56.425 {}      [info]  ()      Loading config.(configFile=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/iOSSettingsConfig.json, profileName=iPhone 14(16.2))
    20  2023/03/18 10:16:56.458 {}      [info]  ()      Loading screen files.(directory=/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/screens)
    21  2023/03/18 10:16:56.468 {}      [info]  ()      Screen files loaded.(2 files)
    22  2023/03/18 10:16:56.480 {}      [info]  ()      Scanning macro under '/Users/wave1008/github/wave1008/shirates-samples-job1/src/test/kotlin'
    23  2023/03/18 10:16:56.481 {}      [info]  ()      Initializing TestDriver.(profileName=iPhone 14(16.2))
    24  2023/03/18 10:16:56.482 {}      [info]  ()      noLoadRun: false
    25  2023/03/18 10:16:56.482 {}      [info]  ()      boundsToRectRatio: 3
    26  2023/03/18 10:16:56.483 {}      [info]  ()      reuseDriver: true
    27  2023/03/18 10:16:56.483 {}      [info]  ()      autoScreenshot: true
    28  2023/03/18 10:16:56.484 {}      [info]  ()      onChangedOnly: true
    29  2023/03/18 10:16:56.485 {}      [info]  ()      onCondition: true
    30  2023/03/18 10:16:56.485 {}      [info]  ()      onAction: true
    31  2023/03/18 10:16:56.485 {}      [info]  ()      onExpectation: true
    32  2023/03/18 10:16:56.486 {}      [info]  ()      onExecOperateCommand: true
    33  2023/03/18 10:16:56.487 {}      [info]  ()      onCheckCommand: true
    34  2023/03/18 10:16:56.487 {}      [info]  ()      onScrolling: true
    35  2023/03/18 10:16:56.488 {}      [info]  ()      manualScreenshot: true
    36  2023/03/18 10:16:56.489 {}      [info]  ()      retryMaxCount: 1
    37  2023/03/18 10:16:56.490 {}      [info]  ()      retryIntervalSeconds: 2.0
    38  2023/03/18 10:16:56.491 {}      [info]  ()      shortWaitSeconds: 1.5
    39  2023/03/18 10:16:56.492 {}      [info]  ()      waitSecondsOnIsScreen: 15.0
    40  2023/03/18 10:16:56.492 {}      [info]  ()      waitSecondsForLaunchAppComplete: 15.0
    41  2023/03/18 10:16:56.492 {}      [info]  ()      waitSecondsForAnimationComplete: 0.5
    42  2023/03/18 10:16:56.493 {}      [info]  ()      swipeDurationSeconds: 3.0
    43  2023/03/18 10:16:56.493 {}      [info]  ()      flickDurationSeconds: 0.3
    44  2023/03/18 10:16:56.493 {}      [info]  ()      swipeMarginRatio: 0.1
    45  2023/03/18 10:16:56.494 {}      [info]  ()      scrollVerticalMarginRatio: 0.2
    46  2023/03/18 10:16:56.495 {}      [info]  ()      scrollHorizontalMarginRatio: 0.2
    47  2023/03/18 10:16:56.495 {}      [info]  ()      tapHoldSeconds: 0.2
    48  2023/03/18 10:16:56.496 {}      [info]  ()      tapAppIconMethod: auto
    49  2023/03/18 10:16:56.496 {}      [info]  ()      tapAppIconMacro: 
    50  2023/03/18 10:16:56.496 {}      [info]  ()      syncWaitSeconds: 1.8
    51  2023/03/18 10:16:56.497 {}      [info]  ()      Searching device for the profile. (profileName=iPhone 14(16.2))
    52  2023/03/18 10:16:59.071 {}      [info]  ()      Device found. (iPhone 14, iOS 16.2, A92DD7F7-7B50-4CA1-8060-72F46D777B94)
    53  2023/03/18 10:16:59.127 {}      [info]  ()      appium --session-override --relaxed-security --log /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_101655/Test1/appium_2023-03-18_101659076.log --port 4720
    54  2023/03/18 10:17:02.230 {}      [info]  ()      Appium Server started. (pid=93231, port=4720)
    55  2023/03/18 10:17:03.235 {}      [info]  ()      Connecting to Appium Server.(http://127.0.0.1:4720/)
    56  2023/03/18 10:17:03.237 {}      [info]  ()      Note: Initializing IOSDriver may take a few minutes to build and install WebDriverAgent.
    57  2023/03/18 10:17:07.502 {}      [info]  ()      implicitlyWaitSeconds: 5.0
    58  2023/03/18 10:17:07.503 {}      [info]  ()      Searching device for the profile. (profileName=iPhone 14(16.2))
    59  2023/03/18 10:17:10.010 {}      [info]  ()      Device found. (iPhone 14, iOS 16.2, A92DD7F7-7B50-4CA1-8060-72F46D777B94)
    60  2023/03/18 10:17:10.011 {}      [info]  ()      AppiumDriver initialized.
    61  2023/03/18 10:17:10.011 {}      [-]     (parameter)     testrun: testConfig/testrun.properties
    62  2023/03/18 10:17:10.012 {}      [-]     (parameter)     testConfigName: iOSSettingsConfig(/Users/wave1008/github/wave1008/shirates-samples-job1/testConfig/iOSSettingsConfig.json)
    63  2023/03/18 10:17:10.012 {}      [-]     (parameter)     profileName: iPhone 14(16.2)
    64  2023/03/18 10:17:10.012 {}      [-]     (parameter)     appIconName: Settings
    65  2023/03/18 10:17:10.012 {}      [-]     ()      (capabilities)
    66  2023/03/18 10:17:10.013 {}      [-]     (parameter)     appium:networkConnectionEnabled: false
    67  2023/03/18 10:17:10.013 {}      [-]     (parameter)     appium:showXcodeLog: true
    68  2023/03/18 10:17:10.013 {}      [-]     (parameter)     appium:newCommandTimeout: 300
    69  2023/03/18 10:17:10.013 {}      [-]     (parameter)     appium:locale: US
    70  2023/03/18 10:17:10.013 {}      [-]     (parameter)     appium:takesScreenshot: true
    71  2023/03/18 10:17:10.014 {}      [-]     (parameter)     appium:bundleId: com.apple.Preferences
    72  2023/03/18 10:17:10.014 {}      [-]     (parameter)     appium:language: en
    73  2023/03/18 10:17:10.014 {}      [-]     (parameter)     appium:automationName: XCUITest
    74  2023/03/18 10:17:10.014 {}      [-]     (parameter)     appium:locationContextEnabled: false
    75  2023/03/18 10:17:10.014 {}      [-]     (parameter)     appium:platformVersion: 16.2
    76  2023/03/18 10:17:10.015 {}      [-]     (parameter)     appium:useJSONSource: true
    77  2023/03/18 10:17:10.015 {}      [-]     (parameter)     appium:databaseEnabled: false
    78  2023/03/18 10:17:10.015 {}      [-]     (parameter)     appium:udid: A92DD7F7-7B50-4CA1-8060-72F46D777B94
    79  2023/03/18 10:17:10.015 {}      [-]     (parameter)     appium:webStorageEnabled: false
    80  2023/03/18 10:17:10.016 {}      [-]     (parameter)     appium:deviceName: iPhone 14
    81  2023/03/18 10:17:10.016 {}      [-]     (parameter)     appium:javascriptEnabled: true
    82  2023/03/18 10:17:10.016 {}      [-]     (parameter)     platformName: IOS
    83  2023/03/18 10:17:10.016 {}      [-]     (parameter)     appium:appPackage: com.apple.Preferences
    84  2023/03/18 10:17:10.017 {}      [-]     ()      (others)
    85  2023/03/18 10:17:10.017 {}      [-]     (parameter)     isEmulator: true
    86  2023/03/18 10:17:10.018 {}      [-]     (parameter)     hasOsaihuKeitai: false
    87  2023/03/18 10:17:10.019 {}      [info]  ()      Setup executed. (duration: 14.0 sec)
    88  2023/03/18 10:17:10.025 {}      [info]  (syncCache)     Syncing (1)
    89  2023/03/18 10:17:11.010 {}      [info]  (syncCache)     elapsed=0.984, syncWaitSeconds=1.8
    90  2023/03/18 10:17:11.011 {}      [info]  (syncCache)     Syncing (2)
    91  2023/03/18 10:17:12.030 {}      [info]  (syncCache)     Synchronization timed out (elapsed=2.005 > syncWaitSeconds=1.8, currentScreen=?)
    92  2023/03/18 10:17:12.031 {}      [info]  ()      Running scenario ..................................................
    93  2023/03/18 10:17:12.031 {test1} [SCENARIO]      (scenario)      test1()
    94  2023/03/18 10:17:12.688 {test1} [screenshot]    (screenshot)    screenshot
    95  2023/03/18 10:17:12.690 {test1} [operate]       (launchApp)     Launch app <Settings>
    96  2023/03/18 10:17:13.716 {test1} [info]  (launchApp)     Launching app. (bundleId=com.apple.Preferences)
    97  2023/03/18 10:17:13.718 {test1} [info]  (execute)       xcrun simctl launch A92DD7F7-7B50-4CA1-8060-72F46D777B94 com.apple.Preferences
    98  2023/03/18 10:17:13.957 {test1} [info]  (launchApp)     doUntilTrue(1)
    99  2023/03/18 10:17:13.959 {test1} [info]  (syncCache)     Syncing (1)
    100 2023/03/18 10:17:15.725 {test1} [info]  (syncCache)     elapsed=1.766, syncWaitSeconds=1.8
    101 2023/03/18 10:17:15.726 {test1} [info]  (syncCache)     Syncing (2)
    102 2023/03/18 10:17:16.659 {test1} [info]  (syncCache)     Synchronization timed out (elapsed=2.7 > syncWaitSeconds=1.8, currentScreen=?)
    103 2023/03/18 10:17:18.663 {test1} [info]  (launchApp)     App launched. (com.apple.Preferences)
    104 2023/03/18 10:17:18.883 {test1} [screenshot]    (screenshot)    screenshot
    105 2023/03/18 10:17:18.884 {test1-1}       [CASE]  (case)  (1)
    106 2023/03/18 10:17:18.885 {test1-1}       [CONDITION]     (condition)     condition
    107 2023/03/18 10:17:18.885 {test1-1}       [info]  ()      iPhone 14(16.2)
    108 2023/03/18 10:17:18.886 {test1-1}       [ACTION]        (action)        action
    109 2023/03/18 10:17:18.887 {test1-1}       [operate]       (pressHome)     Press OS home
    110 2023/03/18 10:17:19.366 {test1-1}       [info]  (syncCache)     Syncing (1)
    111 2023/03/18 10:17:29.898 {test1-1}       [info]  (syncCache)     Synchronization timed out (elapsed=10.532 > syncWaitSeconds=1.8, currentScreen=[iOS Home Screen])
    112 2023/03/18 10:17:31.915 {test1-1}       [screenshot]    (screenshot)    screenshot
    113 2023/03/18 10:17:31.917 {test1-1}       [EXPECTATION]   (expectation)   expectation
    114 2023/03/18 10:17:31.918 {test1-1}       [branch]        (os)    ios {
    115 2023/03/18 10:17:31.922 {test1-1}       [OK]    (screenIs)      [iOS Home Screen] is displayed
    116 2023/03/18 10:17:31.922 {test1-1}       [branch]        (os)    } ios
    117 2023/03/18 10:17:31.924 {test1-1}       [info]  ()      Scenario executed. (duration: 21.9 sec)
    118 2023/03/18 10:17:31.925 {}      [info]  ()      Test function executed. (duration: 36.2 sec)
    119 2023/03/18 10:17:31.925 {}      [info]  ()      End of Test function: test1 [test1()]

Test1 STANDARD_OUT
    120 2023/03/18 10:17:31.929 {}      [info]  ()      Logging to file:////Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_101655/Test1/
    Copying jar content _ReportScript.js to /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_101655/Test1
    Copying jar content _ReportStyle.css to /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_101655/Test1
    Loading: /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_101655/Test1/TestLog(commandList)_20230318101655.log
    Saved: /Users/wave1008/Downloads/TestResults/iOSSettingsConfig/2023-03-18_101655/Test1/Test1@i.xlsx

    121 2023/03/18 10:17:32.316 {}      [info]  ()      Quitting TestDriver.
    122 2023/03/18 10:17:33.400 {}      [info]  ()      Test class executed. (duration: 37.9 sec)

Gradle Test Executor 13 finished executing tests.

> Task :test
Finished generating test XML results (0.002 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/test-results/test
Generating HTML test report...
Finished generating test html results (0.002 secs) into: /Users/wave1008/github/wave1008/shirates-samples-job1/build/reports/tests/test
:test (Thread[Execution worker for ':',5,main]) completed. Took 38.74 secs.
producer locations for task group 1 (Thread[Execution worker for ':',5,main]) started.
producer locations for task group 1 (Thread[Execution worker for ':',5,main]) completed. Took 0.0 secs.

BUILD SUCCESSFUL in 39s
5 actionable tasks: 2 executed, 3 up-to-date
Watched directory hierarchies: [/Users/wave1008/github/wave1008/shirates-samples-job1]
wave1008@SNB-M1 shirates-samples-job1 % 
```