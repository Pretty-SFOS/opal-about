/*
 * This file is part of harbour-opal.
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2020-2021 Mirian Margiani
 */

import QtQuick 2.0
import Sailfish.Silica 1.0 as S
import Opal.About 1.0 as A

A.AboutPageBase {
    id: page
    allowedOrientations: S.Orientation.All

    appName: "Opal.About Example"
    iconSource: Qt.resolvedUrl("../../images/harbour-opal.png")
    versionNumber: APP_VERSION
    releaseNumber: APP_RELEASE
    description: qsTr("This is a short description of the app. It can use styled " +
                      "and rich text or <a href='https://example.org'>links</a>.")

    // note: don't use qsTr() for names in real applications
    authors: [qsTr("the app's maintainer"), qsTr("another important person")]
    mainAttributions: [qsTr("additional name")]
    sourcesUrl: "https://github.com/Pretty-SFOS/opal-about"
    translationsUrl: "https://weblate.com/"

    licenses: A.License {
        spdxId: "GPL-3.0-or-later"
        // -- automatically provided:
        // customShortText: "This is free software: you are welcome to redistribute it under certain conditions. " +
        //                  "There is NO WARRANTY, to the extent permitted by law."
    }
    attributions: [
        A.Attribution {
            name: "My.Extra.Component"
            entries: ["2020-2021 John Doe", "2021 Jane Doe"]
            licenses: A.License { spdxId: "CC0-1.0" }
        },
        A.Attribution {
            name: "The Other Library"
            licenses: [ A.License { spdxId: "MIT" }, A.License { spdxId: "MPL-2.0" } ]
        },
        A.Attribution {
            name: "Yet Another Lib"
            entries: "1984 Jane Doe"
            licenses: A.License { spdxId: "GPL-3.0-or-later" }
        },
        A.Attribution {
            name: "Other Imaginary Components"
            entries: "2000 Components Community"
            licenses: A.License { spdxId: "MIT" }
        },
        A.Attribution {
            // no entries and no licenses: adds a "thank you!"
            // entry on the contributors page
            name: "Some person"
        }

    ]

    donations.text: donations.defaultTextCoffee
    donations.services: [
        A.DonationService {
            name: "LiberaPay"
            url: "https://liberapay.com/"
        },
        A.DonationService {
            name: "Other Service"
            url: "https://example.org/"
        }
    ]

    extraSections: [
        A.InfoSection {
            title: qsTr("Data")
            text: qsTr("Lorem ipsum dolor sit amet et cetera ad libitum plurum sid alum.")
            buttons: [
                A.InfoButton {
                    text: qsTr("Data License")
                    onClicked: A.openOrCopyUrl("https://example.org")
                }
            ]
        },
        A.InfoSection {
            title: qsTr("Extra info")
            text: qsTr("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. " +
                       "Aenean commodo ligula eget dolorus.")
        }
    ]

    contributionSections: [
        A.ContributionSection {
            title: qsTr("Development")
            groups: [
                A.ContributionGroup {
                    title: qsTr("Programming")
                    entries: ["ichthyosaurus", "Jim Doe", "Jane Doe"]
                },
                A.ContributionGroup {
                    title: qsTr("Icon Design")
                    entries: ["Sailfish", "Jolla", "John Doe"]
                }
            ]
        },
        A.ContributionSection {
            title: qsTr("Translations")
            groups: [
                A.ContributionGroup {
                    title: qsTr("English")
                    entries: ["Some Body", "Sam Bodhi", "Sam B. Dy"]
                },
                A.ContributionGroup {
                    title: qsTr("German")
                    entries: [] // an empty section will be invisible
                }
            ]
        }
    ]

    S.PullDownMenu {
        parent: page.flickable
        S.MenuItem {
            text: qsTr("Open another page")
            onClicked: pageStack.push(Qt.resolvedUrl("EmptyDummyPage.qml"))
        }
    }
}
