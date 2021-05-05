/*
 * This file is part of opal-about.
 * SPDX-FileCopyrightText: 2020-2021 Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import "private/functions.js" as Func
import "private"

/*!
    \qmltype AboutPageBase
    \inqmlmodule Opal.About
    \inherits Page
    \brief Provides the base for custom About pages.

    The \c AboutPageBase is the basis for custom app info pages. App
    info pages normally contain information about the app's version,
    authors, and licensing.

    This component allows for the inclusion of standard info blocks
    for one or more licenses, authors, and contributors. You can add an
    arbitrary number of additional custom info sections.

    \section2 Licenses and Attribution

    Open-source licenses are specified by their \l {https://spdx.org/licenses/}
    {SPDX identifiers}. Follow the link for a list of valid strings.
    Custom licenses can be defined manually but are strongly discouraged.
    The license list (\l licenses) holds all licenses that are directly
    used in the project. Refer to the \l License component for more information.

    If your app relies on third-party services, e.g. data providers
    or for cloud functionalities, you should include a dedicated info
    section for each service that requires the user to accept Terms of Use
    or attribution. You can add links or open custom pages via the \c button
    property of \l InfoSection. Refer to \l InfoSection and \l extraSections
    for more information.

    Use the \l attributions property to define attributions that are
    necessary but don't need a dedicated info section on the main page.

    \section2 Donations

    Users can be asked for donations using the \l donations group. Some default
    texts are already provided. Set a list of \l DonationService elements
    on the \l donations.services property.

    It is also possible to explicitly ask for \e no donations by using
    the \l DonationsGroup::defaultTextContribInstead text.

    The section will be hidden if neither a text nor services are defined.

    \section2 Example Page

    The code below demonstrates an app info page for a simple project.
    One-person projects without other contributors can omit setting the
    \l contributionSections property. If additional attributions (e.g.
    for third-party libraries) are required, the \l attributions property
    can be omitted too.

    \qml
        import QtQuick 2.0
        import Sailfish.Silica 1.0
        import Opal.About 1.0

        AboutPageBase {
            id: page
            allowedOrientations: Orientation.All

            appName: qsTr("MyApp")
            iconSource: Qt.resolvedUrl("../images/harbour-myapp.png")
            versionNumber: APP_VERSION
            releaseNumber: APP_RELEASE
            description: qsTr("This is a short description of the app.")
            sourcesUrl: "https://github.com/Pretty-SFOS/opal-about"
            translationsUrl: "https://weblate.org"

            authors: "Au Thor" // either a list or a single string
            licenses: License { spdxId: "GPL-3.0-or-later" }

            donations.text: donations.defaultTextCoffee
            donations.services: DonationService {
                name: "LiberaPay"
                url: "liberapay.com"
            }

            attributions: Attribution {
                name: "The Library"
                entries: ["1201 The Old Librarians", "2014 The Librarians"]
                licenses: License { spdxId: "CC0-1.0" }
            }

            contributionSections: [
                ContributionSection {
                    // title: qsTr("Development") -- automatically added for the top section
                    groups: [
                        ContributionGroup {
                            title: qsTr("Programming")
                            entries: ["Au Thor", "Jane Doe"] // it is not necessary to repeat names
                                                             // already listed in mainAttributions/authors
                        },
                        ContributionGroup {
                            title: qsTr("Icon Design")
                            entries: ["Sailfish", "Jolla", "John Doe"]
                        }
                    ]
                },
                ContributionSection {
                    title: qsTr("Translations")
                    groups: [
                        ContributionGroup {
                            title: qsTr("English")
                            entries: "Some Body"
                        },
                        ContributionGroup {
                            title: qsTr("German")
                            entries: "Max Mustermann"
                        }
                    ]
                }
            ]
        }
    \endqml

    \section2 Custom Page Elements

    It is possible to add custom page elements to the end of the
    page by explicitly parenting them to the page's \l flickable property.
    You can, for example, add a pulley menu by setting its \c parent
    property to \c {page.flickable}:

    \qml
    PullDownMenu {
        parent: page.flickable
        MenuItem {
            text: qsTr("Open a page")
            onClicked: pageStack.push(Qt.resolvedUrl("Page.qml"))
        }
    }
    \endqml

    \section2 Translations

    The module provides all translations needed for the most common use-cases.
    Pre-translated strings include a range of language names as needed in
    the contributions info, strings for attribution of third-party libraries,
    and more. All common translations that are not directly used in this module
    are provided in the \c {Opal.About.Common} translation context. After
    translations have been merged you can go through your strings and
    mark all translations provided by \c lupdate's "same text" heuristic as
    "accepted". If you forget this step, these translations won't be used.

    You can use Qt's \c qsTranslate function and provide the context manually
    if you want to explicitly use a pre-translated string. This should not be
    necessary, though.

    \sa License, InfoSection, Attribution, ContributionSection, ContributionGroup, donations
*/
Page {
    id: page

    /*!
      This property sets the app's name which will be displayed together with
      its logo and version string.

      \required
      \sa versionNumber releaseNumber
    */
    property string appName: ""

    /*!
      This property specifys the path to the app's logo.

      It is recommended to include the icon in your app's data directory.
      You can specify a full path to shared system files alternatively.

      \qml
      iconSource: Qt.resolvedUrl("../images/harbour-myapp.png")
      iconSource: "/usr/share/icons/hicolor/172x172/apps/harbour-myapp.png"
      \endqml

      Setting this property is not strictly required but highly recommended.

      \note you can use \opsnip {render-icons} to easily render SVG icon
      source to any destination.
    */
    property string iconSource: ""

    /*!
      This property holds the app's version number.

      Use for example \c APP_VERSION if configured via C++.

      \note you can use \opsnip {cached-defines} for passing options from
      YAML to QML.

      \required
      \sa releaseNumber
    */
    property string versionNumber: ""

    /*!
      This property holds the app's release number.
      Use for example \c APP_RELEASE if configured via C++

      \note you can use \opsnip {cached-defines} for passing options from
      YAML to QML.

      Setting this property is not required. It will only be shown
      if its value is not \c 1.

      \sa versionNumber
    */
    property string releaseNumber: "1"

    /*!
      This property holds a styled text description of the app.

      Sailfish-themed styling is applied by default. You can include
      links in text using \c {<a>} tags if needed. Depending on your
      use case it might be more appropriate to use a custom info
      section with a button though.

      \sa extraSections, InfoSection
    */
    property string description: ""

    /*!
      This property holds a list of the app's author(s) and/or maintainer(s).

      The names in this list will be shown on the main "about" page, and
      again at the top of the contributors page with the title "Development".

      It is possible to assign a single string value instead of a list
      to this property.

      \note if the first group in \l contributionSections is also titled
      "Development", it will be merged automatically.

      \note people's names should not be translated.

      \required
      \sa authors, contributionSections, attributions
    */
    property var mainAttributions: []

    /*!
      This is a convenience property to be used instead of the \l mainAttributions property.

      The entries of this property will be prepended to all entries of
      \l mainAttributions.

      It is possible to assign a single string value instead of a list
      to this property.

      \e{See \l mainAttributions for details.}

      \required
      \sa mainAttributions
    */
    property var authors: []

    /*!
      This property holds a cleaned list of main attributions.

      The list is combined from the \l mainAttributions and \l authors properties.

      \sa authors, mainAttributions
      \internal
    */
    property var __effectiveMainAttribs: Func.makeStringListConcat(authors, mainAttributions, false)

    /*!
      This property specifys where users can get the app's source code.

      If your app is open-source software it is recommended to include a
      link to a publicly accessible source code repository. This helps
      potential contributors. If you don't want to setup a public
      code repository you can add a custom info section with contact details.

      \note some open-source licenses require you to provide your app's source code.
    */
    property string sourcesUrl: ""

    /*!
      This property specifys where users can contribute to the app's translations.

      Helping with translations is a good way for non-technical users to contribute
      to open source projects they enjoy. Giving them the chance to do so gives
      warm and fuzzy feelings to everyone involved.

      \note \l {https://weblate.com} {Weblate} is an open source tool for
      translations. The community behind it provides a free service for
      applicable open source projects.
    */
    property string translationsUrl: ""

    /*!
      This property holds a list of relevant licenses.

      The very first licenses in this list is interpreted as the main
      license of the project and its name will be shown directly on the
      About page. If more than one license is specified, all
      additional licenses will be shown when clicking on the license
      section.

      Licenses are specified by their \l {https://spdx.org/licenses/}
      {SPDX identifiers}. You don't have to include any license
      texts manually: they will be automatically downloaded and cached
      locally. If a license text is not available locally and downloading
      is not possible, a short notice including a link to the full
      license text will be shown.

      \b {Required notices:}

      Some licenses require you to include certain notices in a
      prominent place. Use the \l License.customShortText property for this.

      Default short texts will be shown automatically for the
      following licenses:

      \table 100 %
      \header
        \li SPDX ID
        \li Default short text
      \row
        \li GPL-*, AGPL-*, LGPL-*
        \li This is free software: you are welcome to redistribute it under certain conditions.
            There is NO WARRANTY, to the extent permitted by law.
      \endtable

      \note these default texts are not translated.

      \sa License
    */
    property list<License> licenses

    /*!
      This property holds a list of attributions, e.g. to third-party libraries.

      This list is intended for listing names not involved in development,
      and for attributions to third-party libraries and the respective licenses.
      For example, some Creative Commons licenses require attribution.

      \note Use contribution sections for listing contributors.
      See \l contributionSections.

      \sa Attribution, contributionSections
    */
    property list<Attribution> attributions

    /*!
      This property group holds a list of possible ways to donate to the project.

      Users can be asked for donations using the \l donations group. Some default
      texts are already provided. Set a list of \l DonationService elements
      on the \l donations.services property.

      It is also possible to explicitly ask for \e no donations by using
      the \l DonationsGroup::defaultTextContribInstead text.

      The section will be hidden if neither a text nor services are defined.

      \qml
        donations.text: donations.defaultTextCoffee
        donations.services: DonationService {
            name: "LiberaPay"
            url: "liberapay.com"
        }
      \endqml

      \sa DonationService, DonationsGroup
    */
    readonly property DonationsGroup donations: DonationsGroup { }

    /*!
      This property holds a list of additional custom info sections.

      Custom sections will be shown below the authors/contributors section
      and above the donations and license sections.

      Multiple buttons can be added using \l InfoButton elements.

      \qml
        extraSections: InfoSection {
            title: qsTr("Data")
            text: qsTr("Lorem ipsum dolor sit amet et cetera ad libitum plurum sid alum.")
            buttons: InfoButton {
                text: qsTr("Terms of Use")
                onClicked: Qt.openUrlExternally("https://example.org")
            }
        }
      \endqml

      \sa InfoSection, InfoButton, donations, translationsUrl, sourcesUrl
    */
    property list<InfoSection> extraSections

    /*!
      This property holds the list of your apps contributors.

      You can leave this property empty if you are the only contributor.
      When this list is not empty, a page showing all contributions can
      be openend by clicking on the default author/maintainer section.

      The contributors page component is configured through this property
      and should not be used directly.

      The very first section is automatically added and contains the list
      of names specified in the \l mainAttributions property. The title
      of this section is "Development" (optionally translated).

      \note If the first section in the \l contributionSections list is titled
      "Development" too (or has no title), it will be merged with the
      automatically inserted top section.

      \note Third-party libraries and licenses can be specified using
      the \l attributions property.

      \qml
          contributionSections: [
              ContributionSection {
                  // title: qsTr("Development")
                  groups: [
                      ContributionGroup {
                          title: qsTr("Programming")
                          entries: "..."
                      },
                      ContributionGroup {
                          title: qsTr("Icon Design")
                          entries: ["...", "..."]
                      }
                  ]
              },
              ContributionSection {
                  title: qsTr("Translations")
                  groups: ContributionGroup {
                      title: qsTr("English")
                      entries: ["...", "..."]
                  }
              }
          ]
      \endqml

      \sa ContributionSection, ContributionGroup, attributions
    */
    property list<ContributionSection> contributionSections

    /*!
      This property references the page's main flickable.

      You can add custom page elements to the end of the
      page by explicitly parenting them to this property.
      You can, for example, add a pulley menu by setting its \c parent
      property to \c {page.flickable}:

      \qml
      PullDownMenu {
          parent: page.flickable
          MenuItem {
              text: qsTr("Open a page")
              onClicked: pageStack.push(Qt.resolvedUrl("Page.qml"))
          }
      }
      \endqml

      \sa SilicaFlickable, PullDownMenu
    */
    property alias flickable: _flickable

    /*!
      This property references the page's header item.
      \sa PageHeader
      \internal
    */
    property alias _pageHeaderItem: _pageHeader

    /*!
      This property references the app icon item.
      \sa Image
      \internal
    */
    property alias _iconItem: _icon

    /*!
      This property references the development info section.
      \sa InfoSection
      \internal
    */
    property alias _develInfoSection: _develInfo

    /*!
      This property references the license info section.
      \sa InfoSection
      \internal
    */
    property alias _licenseInfoSection: _licenseInfo

    /*!
      This property references the donations info section.
      \sa InfoSection
      \internal
    */
    property alias _donationsInfoSection: _donationsInfo

    allowedOrientations: Orientation.All

    SilicaFlickable {
        id: _flickable
        contentHeight: column.height
        anchors.fill: parent
        VerticalScrollDecorator { }

        onContentHeightChanged: {
            if (_flickable.contentHeight > page.height &&
                    _flickable.contentHeight - _pageHeader.origHeight +
                    Theme.paddingMedium < page.height) {
                var to = (page.height - (_flickable.contentHeight-_pageHeader.origHeight)) / 2 + Theme.paddingMedium
                if (to < paddingAnim.to) paddingAnim.to = to
                // console.count("[About] shrink: "+paddingAnim.to+" "+_pageHeader.origHeight+" p:"+page.height+" f:"+flickable.contentHeight)
                hideAnim.restart()
            } /* else {
                console.count("[About] no shrink: "+_pageHeader.height)
            } */
        }

        Column {
            id: column
            width: parent.width
            spacing: 1.5*Theme.paddingLarge

            PageHeader {
                id: _pageHeader
                property real origHeight: height
                title: qsTranslate("Opal.About", "About")
                Component.onCompleted: origHeight = height

                ParallelAnimation {
                    id: hideAnim
                    FadeAnimator {
                        target: _pageHeader
                        to: 0.0
                        duration: 80
                    }
                    SmoothedAnimation {
                        id: paddingAnim
                        target: _pageHeader
                        property: "height"
                        to: _pageHeader.origHeight
                        duration: 80
                    }
                }
            }

            Image {
                id: _icon
                anchors.horizontalCenter: parent.horizontalCenter
                width: Theme.itemSizeExtraLarge
                height: Theme.itemSizeExtraLarge
                fillMode: Image.PreserveAspectFit
                source: iconSource
                verticalAlignment: Image.AlignVCenter
            }

            Column {
                width: parent.width - 2*Theme.horizontalPageMargin
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: Theme.paddingSmall

                Label {
                    width: parent.width
                    visible: appName !== ""
                    text: appName
                    color: Theme.highlightColor
                    font.pixelSize: Theme.fontSizeLarge
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    width: parent.width
                    visible: String(versionNumber !== "")
                    text: qsTranslate("Opal.About", "Version %1").arg(
                              String(releaseNumber === "1") ?
                                  versionNumber :
                                  versionNumber+"-"+releaseNumber)
                    color: Theme.secondaryHighlightColor
                    font.pixelSize: Theme.fontSizeMedium
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - 2*Theme.horizontalPageMargin
                text: description
                onLinkActivated: Qt.openUrlExternally(link)
                wrapMode: Text.Wrap
                textFormat: Text.StyledText
                horizontalAlignment: Text.AlignHCenter
                linkColor: palette.secondaryColor
                palette.primaryColor: Theme.highlightColor
            }

            InfoSection {
                id: _develInfo
                width: parent.width
                title: qsTranslate("Opal.About", "Development")
                enabled: contributionSections.length > 0 || attributions.length > 0
                text: __effectiveMainAttribs.join(', ')
                showMoreLabel: qsTranslate("Opal.About", "show contributors")
                backgroundItem.onClicked: {
                    pageStack.animatorPush("private/ContributorsPage.qml", {
                                               'appName': appName,
                                               'sections': contributionSections,
                                               'attributions': attributions,
                                               'mainAttributions': __effectiveMainAttribs
                                           })
                }
            }

            Column {
                width: parent.width
                spacing: parent.spacing
                children: extraSections
            }

            InfoSection {
                id: _donationsInfo
                visible: donations.services.length > 0 || donations.text !== ''
                width: parent.width
                title: qsTranslate("Opal.About", "Donations")
                enabled: false
                text: donations.text === '' ? donations.defaultTextGeneral :
                                              donations.text
                __donationButtons: donations.services
            }

            InfoSection {
                id: _licenseInfo
                width: parent.width
                title: qsTranslate("Opal.About", "License")
                enabled: licenses.length > 0
                backgroundItem.onClicked: pageStack.animatorPush("private/LicensePage.qml", {
                    'appName': appName, 'licenses': licenses, 'attributions': attributions })
                text: enabled === false ?
                          qsTranslate("Opal.About", "This is proprietary software. All rights reserved.") :
                          ((licenses[0].name !== "" && licenses[0].error !== true) ?
                               licenses[0].name : licenses[0].spdxId)
                smallPrint: licenses[0].customShortText
                showMoreLabel: qsTranslate("Opal.About", "show license(s)", "", licenses.length+attributions.length)
                buttons: [
                    InfoButton {
                        text: qsTranslate("Opal.About", "Translations")
                        onClicked: Qt.openUrlExternally(translationsUrl)
                        enabled: translationsUrl !== ''
                    },
                    InfoButton {
                        text: qsTranslate("Opal.About", "Source Code")
                        onClicked: Qt.openUrlExternally(sourcesUrl)
                        enabled: sourcesUrl !== ''
                    }
                ]

                clip: true
                Behavior on height { SmoothedAnimation { duration: 80 } }
            }

            Item {
                id: bottomVerticalSpacing
                width: parent.width
                height: Theme.paddingMedium
            }
        }
    }

    Component.onCompleted: {
        // This is a workaround for a bug in Silica.
        // We set the default allowed orientations to "All" to fix
        // switching pages in horizontal mode using pageStack.animatorPush.
        // FIXME Find a better way to fix this.
        if (__silica_applicationwindow_instance &&
                __silica_applicationwindow_instance._defaultPageOrientations) {
            __silica_applicationwindow_instance._defaultPageOrientations = Orientation.All
        }
    }
}
