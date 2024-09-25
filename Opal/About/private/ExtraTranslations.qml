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
    //       in AboutPageBase.qml. They will be in the final translations anyway.
    // readonly property string a: qsTranslate("Opal.About.Common", "Development")
    // readonly property string c: qsTranslate("Opal.About.Common", "Translations")

    // some languages (to be expanded!)
    readonly property string la0: qsTranslate("Opal.About.Common", "Swedish")
    readonly property string lb0: qsTranslate("Opal.About.Common", "Polish")
    readonly property string lc0: qsTranslate("Opal.About.Common", "German")
    readonly property string ld0: qsTranslate("Opal.About.Common", "French")
    readonly property string le0: qsTranslate("Opal.About.Common", "Chinese")
    readonly property string lf0: qsTranslate("Opal.About.Common", "English")
    readonly property string lg0: qsTranslate("Opal.About.Common", "Italian")
    readonly property string lh0: qsTranslate("Opal.About.Common", "Finnish")
    readonly property string li0: qsTranslate("Opal.About.Common", "Norwegian")
    readonly property string li1: qsTranslate("Opal.About.Common", "Norwegian Bokmål")
    readonly property string li2: qsTranslate("Opal.About.Common", "Norwegian Nynorsk")
    readonly property string lj0: qsTranslate("Opal.About.Common", "Latvian")
    readonly property string lk0: qsTranslate("Opal.About.Common", "Estonian")
    readonly property string ll0: qsTranslate("Opal.About.Common", "Czech")
    readonly property string lm0: qsTranslate("Opal.About.Common", "Greek")
    readonly property string ln0: qsTranslate("Opal.About.Common", "Spanish")
    readonly property string lo0: qsTranslate("Opal.About.Common", "Hungarian")
    readonly property string lp0: qsTranslate("Opal.About.Common", "Indonesian")
    readonly property string lq0: qsTranslate("Opal.About.Common", "Russian")
    readonly property string lr0: qsTranslate("Opal.About.Common", "Dutch")
    readonly property string lr1: qsTranslate("Opal.About.Common", "Dutch (Belgium)")
    readonly property string ls0: qsTranslate("Opal.About.Common", "Slovak")
    readonly property string lt0: qsTranslate("Opal.About.Common", "Turkish")
}
