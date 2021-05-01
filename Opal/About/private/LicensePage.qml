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
 *
 * 2020-04-17:
 * - initial release
 *
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."

Page {
    id: root
    allowedOrientations: Orientation.All
    property list<License> licenses
    property list<Attribution> attributions
    property bool enableSourceHint: true
    property alias pageDescription: pageHeader.description
    property string appName

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.horizontalPageMargin
        VerticalScrollDecorator { }

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingMedium

            PageHeader {
                id: pageHeader
                title: qsTranslate("Opal.About", "License(s)", "", licenses.length+attributions.length)
                description: appName
            }

            Label {
                visible: enableSourceHint
                width: parent.width - 2*Theme.horizontalPageMargin
                height: visible ? implicitHeight + Theme.paddingLarge : 0
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeExtraSmall
                color: Theme.highlightColor
                text: qsTranslate("Opal.About", "Note: please check the source code for most accurate information.")
            }

            LicenseListPart {
                visible: root.licenses.length > 0
                title: appName
                headerVisible: appName !== '' && pageDescription !== appName
                licenses: root.licenses
                initiallyExpanded: root.licenses.length === 1 && root.attributions.length === 0
            }

            Repeater {
                model: attributions
                delegate: LicenseListPart {
                    title: modelData.name
                    headerVisible: title !== '' && pageDescription !== title
                    licenses: modelData.licenses
                    extraTexts: modelData.entries
                    initiallyExpanded: root.licenses.length === 0 &&
                                       root.attributions.length === 1 &&
                                       root.attributions[0].licenses.length === 1
                }
            }
        }
    }
}
