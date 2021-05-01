/*
 * This file is part of opal-about.
 *
 * SPDX-FileCopyrightText: 2020-2021 Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * *** CHANGELOG: ***
 *
 * 2020-08-22 [breaking]:
 * - packaged as part of Opal
 * - renamed to opal-about
 * - restructured and refactored
 *
 * 2020-04-25:
 * - remove version numbers, use changelog instead
 * - backwards-incompatible changes are marked with "[breaking]"
 * - allow all page orientations (effective value is limited by ApplicationWindow.allowedOrientations)
 *
 * 2020-04-24:
 * - hide empty groups
 *
 * 2020-04-17:
 * - initial release
 *
 */

import QtQuick 2.2
import Sailfish.Silica 1.0
import ".."

Page {
    allowedOrientations: Orientation.All
    property list<ContributionSection> sections
    property list<Attribution> attributions

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + 2*Theme.paddingLarge

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingMedium

            PageHeader { title: qsTranslate("Opal.About", "Contributors") }

            Repeater {
                model: sections
                delegate: Column {
                    width: parent.width
                    spacing: column.spacing

                    SectionHeader {
                        text: modelData.title
                        visible: modelData.groups.length > 0
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
                        label: modelData.name
                        values: {
                            if (modelData.entries.length > 0 && spdxString !== '') modelData.entries.concat([spdxString])
                            else if (modelData.entries.length > 0) modelData.entries
                            else if (spdxString !== '') [spdxString]
                            else [qsTranslate("Opal.About", "Thank you!")]
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
