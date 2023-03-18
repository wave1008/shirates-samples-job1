export SR_os="android"
export SR_testrunFile="testConfig/testrun.properties"
export SR_configFile="testConfig/androidSettingsConfig.json"
export SR_profile="Pixel 3a API 31(Android 12)"
export includeTestsMatching="product1.Test1"
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
echo "/// Starting test"
sh ./gradlew cleanTest test -x compileKotlin --info
