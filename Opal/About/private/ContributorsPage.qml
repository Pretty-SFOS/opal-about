//@ This file is part of opal-about.
//@ https://github.com/Pretty-SFOS/opal-about
//@ SPDX-FileCopyrightText: 2020-2022 Mirian Margiani
//@ SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.2
import Sailfish.Silica 1.0
import "functions.js" as Func
import ".."

Page {
    property list<ContributionSection> sections
    property list<Attribution> attributions
    property var mainAttributions: []
    property string appName

    property bool allowDownloadingLicenses: false

    // this could be used to always attribute Opal.About in case all users forget
    // to properly attribute this library
    property list<Attribution> _defaultAttributions

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + 2*Theme.paddingLarge
        VerticalScrollDecorator { }

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingMedium

            PageHeader { title: qsTranslate("Opal.About", "Contributors") }

            SectionHeader {
                text: qsTranslate("Opal.About", "Development")
                visible: mainAttributions.length > 0
            }

            DetailList {
                visible: mainAttributions.length > 0
                label: appName
                values: mainAttributions
            }

            Repeater {
                model: sections
                delegate: Column {
                    width: parent.width
                    spacing: column.spacing

                    SectionHeader {
                        text: modelData.title
                        visible: modelData.title !== '' &&
                                 modelData.groups.length > 0 &&
                                 !(index === 0 && (modelData.title === 'Development' ||
                                                   modelData.title === qsTranslate("Opal.About", "Development")))
                    }

                    Repeater {
                        model: modelData.groups
                        delegate: DetailList {
                            label: modelData.title
                            values: modelData.__effectiveEntries
                        }
                    }
                }
            }

            Column {
                width: parent.width
                spacing: column.spacing

                SectionHeader {
                    text: qsTranslate("Opal.About", "Acknowledgements")
                    visible: attributions.length > 0
                }

                Repeater {
                    model: [attributions, _defaultAttributions]
                    delegate: Repeater {
                        model: modelData
                        delegate: DetailList {
                            // FIXME dots are not right-to-left compatible
                            property string spdxString: modelData._getSpdxString(" \u2022 \u2022 \u2022")
                            property bool showLicensePage: false

                            activeLastValue:    spdxString !== ''
                                             || modelData.sources !== ''
                                             || modelData.homepage !== ''
                                             || modelData.description !== ''
                            label: (modelData.__effectiveEntries.length === 0 && spdxString === '') ?
                                       qsTranslate("Opal.About", "Thank you!") :
                                       modelData.name
                            values: {
                                var vals = Func.makeStringListConcat(modelData.__effectiveEntries, spdxString, false)

                                if (vals.length === 0) {
                                    vals = [modelData.name]
                                }

                                if (spdxString === '') {
                                    var append = ''

                                    if (modelData.description !== '' ||
                                            (modelData.sources !== '' &&
                                             modelData.homepage !== '')) {
                                        append = qsTranslate("Opal.About", "Details")

                                        if (modelData.description !== '') {
                                            showLicensePage = true
                                        }
                                    } else if (modelData.sources !== '') {
                                        append = qsTranslate("Opal.About", "Source Code")
                                    } else if (modelData.homepage !== '') {
                                        append = qsTranslate("Opal.About", "Homepage")
                                    }

                                    if (append !== '') {
                                        vals.push(append + "  \u2022 \u2022 \u2022")
                                    }
                                } else {
                                    showLicensePage = true
                                }

                                return vals
                            }
                            onClicked: {
                                if (showLicensePage) {
                                    pageStack.animatorPush("LicensePage.qml", {
                                                               'mainAttribution': modelData,
                                                               'attributions': [],
                                                               'allowDownloadingLicenses': allowDownloadingLicenses,
                                                               'enableSourceHint': true
                                                           })
                                } else {
                                    var pages = []
                                    if (modelData.homepage !== '') pages.push({'page': Qt.resolvedUrl('ExternalUrlPage.qml'),
                                                                                 'properties': {'externalUrl': modelData.homepage,
                                                                                     'title': qsTranslate("Opal.About", 'Homepage')}})
                                    if (modelData.sources !== '') pages.push({'page': Qt.resolvedUrl('ExternalUrlPage.qml'),
                                                                                 'properties': {'externalUrl': modelData.sources,
                                                                                     'title': qsTranslate("Opal.About", 'Source Code')}})
                                    pageStack.push(pages)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
