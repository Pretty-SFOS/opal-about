/*
 * This file is part of opal-about.
 * SPDX-FileCopyrightText: 2020-2021 Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick 2.2
import Sailfish.Silica 1.0
import ".."

Page {
    allowedOrientations: Orientation.All
    property list<ContributionSection> sections
    property list<Attribution> attributions
    property var mainAttributions: []
    property string appName

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
                            values: modelData.entries
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
                    model: attributions
                    delegate: DetailList {
                        property string spdxString: modelData._getSpdxString(" \u2022 \u2022 \u2022")
                        activeLastValue: spdxString !== ''
                        label: (modelData.entries.length === 0 && spdxString === '') ?
                                   qsTranslate("Opal.About", "Thank you!") :
                                   modelData.name
                        values: {
                            if (modelData.entries.length > 0 && spdxString !== '') modelData.entries.concat([spdxString])
                            else if (modelData.entries.length > 0) modelData.entries
                            else if (spdxString !== '') [spdxString]
                            else [modelData.name]
                        }
                        onClicked: {
                            pageStack.animatorPush("LicensePage.qml", {
                                                       'attributions': [modelData],
                                                       'enableSourceHint': true,
                                                       'pageDescription': modelData.name
                                                   })
                        }
                    }
                }
            }
        }
    }
}
