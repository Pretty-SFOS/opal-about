//@ This file is part of opal-about.
//@ https://github.com/Pretty-SFOS/opal-about
//@ SPDX-FileCopyrightText: 2021-2023 Mirian Margiani
//@ SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.0
//@ This file MUST NOT be used anywhere. It contains a list of some commonly
//@ needed strings for which Opal.About will provide default translations.
//@ Do not include this file in qmldir. This file may contain invalid QML.
Item {
    // commonly used strings
    readonly property string k: qsTranslate("Opal.About.Common", "Author")
    readonly property string l: qsTranslate("Opal.About.Common", "Author(s)", "", 5)
    readonly property string m: qsTranslate("Opal.About.Common", "Maintainer")
    readonly property string n: qsTranslate("Opal.About.Common", "Maintainer(s)", "", 5)
    readonly property string b: qsTranslate("Opal.About.Common", "Programming")
    readonly property string e: qsTranslate("Opal.About.Common", "Icon Design")
    readonly property string f: qsTranslate("Opal.About.Common", "Third-party libraries")
    readonly property string g: qsTranslate("Opal.About.Common", "Data")
    readonly property string h: qsTranslate("Opal.About.Common", "Data License")
    readonly property string i: qsTranslate("Opal.About.Common", "Data License(s)", "", 5)
    readonly property string j: qsTranslate("Opal.About.Common", "Terms of Use")

    // These strings are not listed here because they are already used
    // in AboutPageBase.qml. They will be in the final translations anyway.
    //// readonly property string a: qsTranslate("Opal.About.Common", "Development")
    //// readonly property string c: qsTranslate("Opal.About.Common", "Translations")

    // some languages (to be expanded!)
    readonly property string l000: qsTranslate("Opal.About.Common", "Swedish")
    readonly property string l001: qsTranslate("Opal.About.Common", "Polish")
    readonly property string l002: qsTranslate("Opal.About.Common", "German")
    readonly property string l003: qsTranslate("Opal.About.Common", "French")
    readonly property string l004: qsTranslate("Opal.About.Common", "Chinese")
    readonly property string l005: qsTranslate("Opal.About.Common", "English")
    readonly property string l006: qsTranslate("Opal.About.Common", "Italian")
    readonly property string l007: qsTranslate("Opal.About.Common", "Finnish")
    readonly property string l008: qsTranslate("Opal.About.Common", "Norwegian")
    readonly property string l009: qsTranslate("Opal.About.Common", "Norwegian Bokmål")
    readonly property string l010: qsTranslate("Opal.About.Common", "Norwegian Nynorsk")
    readonly property string l011: qsTranslate("Opal.About.Common", "Latvian")
    readonly property string l012: qsTranslate("Opal.About.Common", "Estonian")
    readonly property string l013: qsTranslate("Opal.About.Common", "Czech")
    readonly property string l014: qsTranslate("Opal.About.Common", "Greek")
    readonly property string l015: qsTranslate("Opal.About.Common", "Spanish")
    readonly property string l016: qsTranslate("Opal.About.Common", "Hungarian")
    readonly property string l017: qsTranslate("Opal.About.Common", "Indonesian")
    readonly property string l018: qsTranslate("Opal.About.Common", "Russian")
    readonly property string l019: qsTranslate("Opal.About.Common", "Dutch")
    readonly property string l020: qsTranslate("Opal.About.Common", "Dutch (Belgium)")
    readonly property string l021: qsTranslate("Opal.About.Common", "Slovak")
    readonly property string l022: qsTranslate("Opal.About.Common", "Turkish")
    readonly property string l023: qsTranslate("Opal.About.Common", "Ukrainian")
    readonly property string l024: qsTranslate("Opal.About.Common", "Romanian")
    readonly property string l025: qsTranslate("Opal.About.Common", "Serbian")
}
