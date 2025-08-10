/*
 * This file is part of harbour-opal.
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2020-2023 Mirian Margiani
 */

import QtQuick 2.0
import Sailfish.Silica 1.0 as S
import Opal.About 1.0 as A

A.AboutPageBase {
    id: page

    appName: "Opal.About Example"
    appIcon: Qt.resolvedUrl("../../images/harbour-opal-gallery.png")
    appVersion: APP_VERSION
    appRelease: APP_RELEASE
    description: qsTr("This is a short description of the app. It can use styled " +
                      "and rich text or <a href='https://example.org'>links</a>.")

    // note: don't use qsTr() for names in real applications
    authors: [qsTr("the app's maintainer"), qsTr("another important person")]
    mainAttributions: [qsTr("additional name")]
    sourcesUrl: "https://github.com/Pretty-SFOS/opal-about"
    translationsUrl: "https://weblate.com/"
    homepageUrl: "https://example.org/my/forum"

    // changelogList: Qt.resolvedUrl("Changelog.qml")

    changelogItems: [
        // add new entries at the top
        A.ChangelogItem {
            version: "3.0.0-1"
            date: "2023-03-01"
            paragraphs: "This version introduces an important clarification: " +
                        "this changelog is just an example, and it does not " +
                        "refer to the Opal Gallery app."
        },
        A.ChangelogItem {
            version: "2.0.0-1"
            date: "2023-02-01"
            // author: "ichthyosaurus" -- the author field is optional
            paragraphs: [
                "A lot has changed since the last version. Unicorns learned " +
                "to fly and penguins grew horns.",
                "We decided to increase the version number to celebrate " +
                "these achievements of nature."
            ]
        },
        A.ChangelogItem {
            version: "1.0.0-1"
            date: "2023-01-01"
            author: "ichthyosaurus"
            paragraphs: "This is the first version. Everything is new and " +
                        "shiny, so be sure to check every page of this brand new " +
                        "app."
        }
    ]

    licenses: A.License {
        spdxId: "GPL-3.0-or-later"
        // -- automatically provided:
        // customShortText: "This is free software: you are welcome to redistribute it under certain conditions. " +
        //                  "There is NO WARRANTY, to the extent permitted by law."
    }
    attributions: [
        // Note: attribution for Opal modules is added automatically. See the
        // "autoAddOpalAttributions" property for details.

        A.Attribution {
            name: "My.Extra.Component"
            entries: ["2020-2022 John Doe", "2022 Jane Doe"]
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
            homepage: "https://example.org/homepage"
            sources: "https://example.org/sources"
        },
        A.Attribution {
            name: "Other Imaginary Components"
            entries: "2000 Components Community"
            licenses: A.License { spdxId: "MIT" }
            homepage: "https://example.org/component"
        },
        A.Attribution {
            // no entries and no licenses: adds a "thank you!"
            // entry on the contributors page
            name: "Some person"
            homepage: "https://example.org"
        },
        A.Attribution {
            // no entries and no licenses: adds a "thank you!"
            // entry on the contributors page
            name: "Some other person"
            homepage: "https://example.org"
            sources: "https://source.example.org"
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
            // Extra buttons can be added to the main list (source code, homepage, translations)
            // by defining them in the first custom info section. Set no title.
            buttons: [
                A.InfoButton {
                    text: qsTr("Forum")
                    onClicked: page.openOrCopyUrl("https://example.org/forum")
                }
            ]
        },
        A.InfoSection {
            title: qsTr("Data")
            text: qsTr("Lorem ipsum dolor sit amet et cetera ad libitum plurum sid alum.")
            buttons: [
                A.InfoButton {
                    text: qsTr("Data License")
                    onClicked: page.openOrCopyUrl("https://example.org")
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
