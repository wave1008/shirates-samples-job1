export SR_os="ios"
export SR_testrunFile="testConfig/testrun.properties"
export SR_configFile="testConfig/iOSSettingsConfig.json"
export SR_profile="iPhone 14(16.2)"
export includeTestsMatching="product1.Test1"
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
echo "/// Starting test"
sh ./gradlew cleanTest test -x compileKotlin --info
