/*
 * This file is part of opal-about.
 *
 * SPDX-FileCopyrightText: 2021 Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 *
 * This file should not be used anywhere. It contains a list of some commonly
 * needed strings for which Opal.About will provide default translations.
 * Do not include this file in qmldir.
 *
 */

Item {
    // commonly used strings
    readonly property string a: qsTranslate("Opal.About.Common", "Development")
    readonly property string b: qsTranslate("Opal.About.Common", "Programming")
    readonly property string c: qsTranslate("Opal.About.Common", "Translations")
    readonly property string c: qsTranslate("Opal.About.Common", "Icon Design")
    readonly property string d: qsTranslate("Opal.About.Common", "Third-party libraries")
    readonly property string e: qsTranslate("Opal.About.Common", "Data")
    readonly property string f: qsTranslate("Opal.About.Common", "Data License")
    readonly property string f: qsTranslate("Opal.About.Common", "Data License(s)", "", 5)

    // some languages (to be expanded!)
    readonly property string lb: qsTranslate("Opal.About.Common", "Swedish")
    readonly property string la: qsTranslate("Opal.About.Common", "Polish")
    readonly property string ld: qsTranslate("Opal.About.Common", "German")
    readonly property string ld: qsTranslate("Opal.About.Common", "French")
    readonly property string lc: qsTranslate("Opal.About.Common", "Chinese")
    readonly property string le: qsTranslate("Opal.About.Common", "English")
    readonly property string le: qsTranslate("Opal.About.Common", "Italian")
    readonly property string le: qsTranslate("Opal.About.Common", "Finnish")
    readonly property string le: qsTranslate("Opal.About.Common", "Norwegian")
}
