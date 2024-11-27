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
    readonly property string lang: qsTranslate("Opal.About.Common", "Belarusian")
    readonly property string lang: qsTranslate("Opal.About.Common", "Chinese")
    readonly property string lang: qsTranslate("Opal.About.Common", "Czech")
    readonly property string lang: qsTranslate("Opal.About.Common", "Dutch")
    readonly property string lang: qsTranslate("Opal.About.Common", "English")
    readonly property string lang: qsTranslate("Opal.About.Common", "Estonian")
    readonly property string lang: qsTranslate("Opal.About.Common", "Finnish")
    readonly property string lang: qsTranslate("Opal.About.Common", "French")
    readonly property string lang: qsTranslate("Opal.About.Common", "German")
    readonly property string lang: qsTranslate("Opal.About.Common", "Greek")
    readonly property string lang: qsTranslate("Opal.About.Common", "Hungarian")
    readonly property string lang: qsTranslate("Opal.About.Common", "Indonesian")
    readonly property string lang: qsTranslate("Opal.About.Common", "Italian")
    readonly property string lang: qsTranslate("Opal.About.Common", "Lithuanian")
    readonly property string lang: qsTranslate("Opal.About.Common", "Norwegian Bokmål")
    readonly property string lang: qsTranslate("Opal.About.Common", "Polish")
    readonly property string lang: qsTranslate("Opal.About.Common", "Portuguese")
    readonly property string lang: qsTranslate("Opal.About.Common", "Brazilian Portuguese")
    readonly property string lang: qsTranslate("Opal.About.Common", "Romanian")
    readonly property string lang: qsTranslate("Opal.About.Common", "Russian")
    readonly property string lang: qsTranslate("Opal.About.Common", "Serbian")
    readonly property string lang: qsTranslate("Opal.About.Common", "Slovak")
    readonly property string lang: qsTranslate("Opal.About.Common", "Spanish")
    readonly property string lang: qsTranslate("Opal.About.Common", "Swedish")
    readonly property string lang: qsTranslate("Opal.About.Common", "Tamil")
    readonly property string lang: qsTranslate("Opal.About.Common", "Turkish")
    readonly property string lang: qsTranslate("Opal.About.Common", "Ukrainian")

    // Opal.About is not yet translated into these languages:
    readonly property string lang: qsTranslate("Opal.About.Common", "Norwegian Nynorsk")
    readonly property string lang: qsTranslate("Opal.About.Common", "Latvian")
    readonly property string lang: qsTranslate("Opal.About.Common", "Dutch (Belgium)")
}
