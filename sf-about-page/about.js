.pragma library

// This script is a library. This improves performance, but it means that no
// variables from the outside can be accessed.

var DEVELOPMENT = [
    {label: qsTr("Programming"), values: ["Jane Doe", "John Doe"]},
    {label: qsTr("Icon Design"), values: ["Some Body", "Bodhi Sam"]}
]

var TRANSLATIONS = [
    {label: qsTr("English"), values: ["Jane Doe"]},
    {label: qsTr("Atlantean"), values: ["At Lanta"]}
]

var VERSION_NUMBER = "1.0" // set in main.qml's Component.onCompleted
var APPINFO = {
    appName: "this app",  // the name of your app
    iconPath: "",         // e.g. "/usr/share/icons/hicolor/172x172/apps/harbour-jammy.png"
    description: "",      // a rich text description of your app
    author: "",           // the main author(s) or maintainer(s)
    dataInformation: "",  // if your app uses data from an external provider, add e.g. copyright
                          // info here
    dataLink: "",         // a link to the website of an external provider
    dataLinkText: "",     // custom button text
    sourcesLink: "",      // where users can get your app's source code
    sourcesText: "",      // custom button text, e.g. qsTr("Sources on GitHub")

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
