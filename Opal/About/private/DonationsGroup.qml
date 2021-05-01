/*
 * This file is part of opal-about.
 * SPDX-FileCopyrightText: 2021 Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick 2.0
import ".."

QtObject {
    readonly property string defaultTextCoffee: qsTranslate("Opal.About.Common", "If you want to support my work, you can buy me a cup of coffee.")
    readonly property string defaultTextGeneral: qsTranslate("Opal.About.Common", "You can support this project by contributing, or by donating using any of these services.")
    readonly property string defaultTextContribInstead: qsTranslate("Opal.About.Common", "Please consider contributing to the project instead of donating.")

    property string text: ""
    property list<DonationService> services
}
