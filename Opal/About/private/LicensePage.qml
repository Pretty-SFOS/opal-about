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
    allowedOrientations: Orientation.All
    property list<License> licenses
    property bool enableSourceHint: true

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.horizontalPageMargin
        VerticalScrollDecorator { }

        Column {
            id: column
            width: parent.width
            PageHeader { title: qsTranslate("Opal.About", "License(s)", "", licenses.length) }

            Label {
                visible: enableSourceHint
                width: parent.width - 2*Theme.horizontalPageMargin
                height: visible ? implicitHeight + Theme.paddingLarge : 0
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignLeft
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeExtraSmall
                color: Theme.secondaryHighlightColor
                text: qsTranslate("Opal.About", "Note: please check the source code for most accurate information.")
            }

            Repeater {
                model: licenses
                delegate: Column {
                    width: parent.width - 2*Theme.horizontalPageMargin
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: Theme.paddingSmall

                    Label {
                        width: parent.width
                        horizontalAlignment: Text.AlignRight
                        wrapMode: Text.Wrap
                        font.pixelSize: Theme.fontSizeSmall
                        textFormat: Text.PlainText
                        color: Theme.highlightColor
                        text: modelData.name !== "" ? modelData.name : modelData.spdxId
                    }

                    Label {
                        width: parent.width
                        horizontalAlignment: Text.AlignRight
                        wrapMode: Text.Wrap
                        font.pixelSize: Theme.fontSizeExtraSmall
                        textFormat: Text.PlainText
                        color: Theme.secondaryHighlightColor
                        text: modelData.forComponents.join(', ')
                        visible: modelData.forComponents.length > 0
                    }

                    Label {
                        width: parent.width
                        horizontalAlignment: Text.AlignRight
                        wrapMode: Text.Wrap
                        font.pixelSize: Theme.fontSizeExtraSmall
                        textFormat: Text.PlainText
                        color: Theme.secondaryHighlightColor
                        text: modelData.spdxId
                        visible: modelData.name !== ""
                    }

                    Item { width: 1; height: 1 }

                    Label {
                        property bool error: modelData.error === true || modelData.fullText === ""
                        width: parent.width
                        wrapMode: Text.Wrap
                        font.pixelSize: Theme.fontSizeExtraSmall
                        textFormat: error ? Text.RichText : Text.PlainText
                        color: Theme.highlightColor

                        text: error ? '<style type="text/css">A { color: "' +
                                      String(Theme.primaryColor) +
                                      '"; }</style>' + qsTranslate("Opal.About", "Please refer to <a href='%1'>%1</a>").arg(
                                          "https://spdx.org/licenses/%1.html".arg(modelData.spdxId))
                                    : modelData.fullText
                        onLinkActivated: Qt.openUrlExternally(link)
                    }

                    Item { width: 1; height: 1.5*Theme.paddingLarge }
                }
            }
        }
    }
}
