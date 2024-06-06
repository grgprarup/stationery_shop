import { remote } from 'webdriverio'

const capabilities = {
    "platformName": "Android",
    "appium:automationName": "uiautomator2",
    "appium:deviceName": "avd",
    "appium:appPackage": "com.codezero.flutter.stationeryshop.stationery_shop",
    "appium:appActivity": ".MainActivity"
}

const wdOpts = {
    hostname: 'localhost',
    port: 4723,
    logLevel: 'info',
    capabilities,
}

async function loginTest() {
    const driver = await remote(wdOpts)

    try {
        const loginScreen = await driver.$('//android.view.View[@content-desc="Login"]')
        await loginScreen.waitForDisplayed({ timeout: 5000 })

        const usernameField = await driver.$('//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]')
        await usernameField.click();
        await driver.waitUntil(async () => {
            return await driver.isKeyboardShown()
        })
        await usernameField.setValue('admin')

        const passwordField = await driver.$('//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]')
        await passwordField.click();
        await passwordField.setValue('admin')

        const loginButton = await driver.$('//android.widget.Button[@content-desc="LOGIN"]')
        await loginButton.click()

        const dashboardPage = await driver.$('//android.view.View[@content-desc="Dashboard"]')
        await dashboardPage.waitForDisplayed({ timeout: 5000 })
    } finally {
        await driver.deleteSession()
    }
}

async function signUpTest() {
    const driver = await remote(wdOpts)
    try {
        const loginScreen = await driver.$('//android.view.View[@content-desc="Login"]')
        await loginScreen.waitForDisplayed({ timeout: 5000 })

        const signUpButton = await driver.$('//android.widget.Button[@content-desc="Sign up"]')
        await signUpButton.click()

        const signUpScreen = await driver.$('//android.view.View[@content-desc="Create an Account"]')
        await signUpScreen.waitForDisplayed({ timeout: 5000 })
    } finally {
        await driver.deleteSession()
    }
}

async function runTests() {
    await loginTest()
    await signUpTest()
}

runTests().catch(console.error)