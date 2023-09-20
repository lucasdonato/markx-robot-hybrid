*** Settings ***
Documentation            Tudo deve começar nesse arquivo

Library     AppiumLibrary
Library     libs/mongo.py

Resource       env.resource

Resource       screens/${PLATFORM}/login.resource
Resource       screens/${PLATFORM}/tasks.resource

*** Keywords ***
Start session
    
    Run Keyword If    '${PLATFORM}' == 'android'
    ...       Open Application    http://localhost:4723
    ...       automationName=uiautomator2
    ...       platformName=Android
    ...       deviceName=Emulator
    ...       udid=emulator-5554
    ...       autoGrantPermissions=true
    ...       app=${EXECDIR}/apps/markx.apk
    
    Run Keyword If    '${PLATFORM}' == 'ios'
    ...       Open Application    http://localhost:4723
    ...       automationName=XCUITest
    ...       platformName=iOS
    ...       deviceName=iPhone 14 Pro
    ...       udid=6BCD0847-4AA2-42BB-B614-E1EFB2A465C8
    ...       autoAcceptedAlerts=true
    ...       app=${EXECDIR}/apps/markX.app
    ...       platformVersion=16.4
    ...       bundleId=com.qaxperience.markx

    Wait Until Page Contains    Endereço IP da Api    10

Finish session
    Capture Page Screenshot
    Close Application
