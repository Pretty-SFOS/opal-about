/*
 * This file is part of opal-about.
 * Copyright (C) 2021  Mirian Margiani
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 *
 * This file should not be used anywhere. It contains a list of some commonly
 * needed strings for which Opal.About will provide default translations.
 * Do not include this file in qmldir.
 *
 */

Item {
    // commonly used strings
    readonly property string a: qsTr("Development")
    readonly property string b: qsTr("Programming")
    readonly property string c: qsTr("Translations")
    readonly property string c: qsTr("Icon Design")
    readonly property string d: qsTr("Third party libraries")

    // some languages (to be expanded!)
    readonly property string lb: qsTr("Swedish")
    readonly property string la: qsTr("Polish")
    readonly property string ld: qsTr("German")
    readonly property string ld: qsTr("French")
    readonly property string lc: qsTr("Chinese")
    readonly property string le: qsTr("English")
    readonly property string le: qsTr("Italian")
    readonly property string le: qsTr("Finnish")
    readonly property string le: qsTr("Norwegian")
}
