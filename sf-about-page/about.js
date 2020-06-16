.pragma library
// This script is a library. This improves performance, but it means that no
// variables from the outside can be accessed.


// -- TRANSLATORS
// Please add yourself to the list of contributors. If your language is already
// in the list, add your name to the 'values' field:
//     example: {label: qsTr("Your language"), values: ["Existing contributor", "YOUR NAME HERE"]},
//
// If you added a new translation, create a new section at the top of the list:
//     example:
//          var TRANSLATIONS = [
//              {label: qsTr("Your language"), values: ["YOUR NAME HERE"]},
//          [...]
//
var TRANSLATIONS = [
    {label: qsTr("English"), values: ["Jane Doe"]},
    {label: qsTr("Atlantean"), values: ["At Lanta"]}
]


// -- OTHER CONTRIBUTORS
// Please add yourself the the list of contributors.
var DEVELOPMENT = [
    {label: qsTr("Programming"), values: ["Jane Doe", "John Doe"]},
    {label: qsTr("Icon Design"), values: ["Some Body", "Bodhi Sam"]}
]


var VERSION_NUMBER = "1.0" // set in main.qml's Component.onCompleted
var APPINFO = {
    iconPath: "",         // e.g. "/usr/share/icons/hicolor/172x172/apps/harbour-jammy.png"
    description: "",      // a rich text description of your app
    author: "",           // the main author(s) or maintainer(s)
    sourcesLink: "",      // where users can get your app's source code
    sourcesText: "",      // custom button text, e.g. qsTr("Sources on GitHub")

    extraInfoTitle: "",   // section to show extra info
                          // e.g. use qsTr("Data"), if your app uses data from an external provider
    extraInfoText: "",    // add e.g. copyright info here, if your app uses data from an external provider
    extraInfoLinkText: "", // custom button text
    extraInfoLink: "",     // e.g. a link to the website of an external provider

    enableContributorsPage: false, // whether to enable 'ContributorsPage.qml'
    contribDevelopment: DEVELOPMENT,
    contribTranslations: TRANSLATIONS
}

function aboutPageUrl() {
    return Qt.resolvedUrl("AboutPage.qml");
}

function pushAboutPage(pageStack) {
    APPINFO.versionNumber = VERSION_NUMBER;
    pageStack.push(aboutPageUrl(), APPINFO);
}
