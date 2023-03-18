package product1

import org.junit.jupiter.api.Test
import shirates.core.driver.branchextension.android
import shirates.core.driver.branchextension.ios
import shirates.core.driver.commandextension.pressHome
import shirates.core.driver.commandextension.screenIs
import shirates.core.driver.testProfile
import shirates.core.logging.printInfo
import shirates.core.testcode.UITest

class Test1 : UITest() {

    @Test
    fun test1() {

        scenario {
            case(1) {
                condition {
                    printInfo(testProfile.profileName)
                }.action {
                    it.pressHome()
                }.expectation {
                    android {
                        it.screenIs("[Android Home Screen]")
                    }
                    ios {
                        it.screenIs("[iOS Home Screen]")
                    }
                }
            }
        }
    }
}