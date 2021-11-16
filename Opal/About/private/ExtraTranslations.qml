//@ This file is part of opal-about.
//@ https://github.com/Pretty-SFOS/opal-about
//@ SPDX-FileCopyrightText: 2021 Mirian Margiani
//@ SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.0
//@ This file MUST NOT be used anywhere. It contains a list of some commonly
//@ needed strings for which Opal.About will provide default translations.
//@ Do not include this file in qmldir. This file may not contain valid QML.
Item {
    // commonly used strings
    readonly property string k: qsTranslate("Opal.About.Common", "Author")
    readonly property string l: qsTranslate("Opal.About.Common", "Author(s)", "", 5)
    readonly property string m: qsTranslate("Opal.About.Common", "Maintainer")
    readonly property string n: qsTranslate("Opal.About.Common", "Maintainer(s)", "", 5)
    readonly property string a: qsTranslate("Opal.About.Common", "Development")
    readonly property string b: qsTranslate("Opal.About.Common", "Programming")
    readonly property string c: qsTranslate("Opal.About.Common", "Translations")
    readonly property string e: qsTranslate("Opal.About.Common", "Icon Design")
    readonly property string f: qsTranslate("Opal.About.Common", "Third-party libraries")
    readonly property string g: qsTranslate("Opal.About.Common", "Data")
    readonly property string h: qsTranslate("Opal.About.Common", "Data License")
    readonly property string i: qsTranslate("Opal.About.Common", "Data License(s)", "", 5)
    readonly property string j: qsTranslate("Opal.About.Common", "Terms of Use")

    // some languages (to be expanded!)
    readonly property string la: qsTranslate("Opal.About.Common", "Swedish")
    readonly property string lb: qsTranslate("Opal.About.Common", "Polish")
    readonly property string lc: qsTranslate("Opal.About.Common", "German")
    readonly property string ld: qsTranslate("Opal.About.Common", "French")
    readonly property string le: qsTranslate("Opal.About.Common", "Chinese")
    readonly property string lf: qsTranslate("Opal.About.Common", "English")
    readonly property string lg: qsTranslate("Opal.About.Common", "Italian")
    readonly property string lh: qsTranslate("Opal.About.Common", "Finnish")
    readonly property string li: qsTranslate("Opal.About.Common", "Norwegian")
    readonly property string lj: qsTranslate("Opal.About.Common", "Latvian")
    readonly property string lk: qsTranslate("Opal.About.Common", "Estonian")
}
