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
 *
 * 2020-04-25:
 * - remove version numbers, use changelog instead
 * - backwards-incompatible changes are marked with "[breaking]"
 *
 * 2020-04-17:
 * - initial release
 *
 */

import QtQuick 2.2
import Sailfish.Silica 1.0

Column {
    id: root
    property string label
    property var values
    width: parent.width
    spacing: 0

    Repeater {
        model: values.length
        delegate: DetailItem {
            label: index === 0 ? root.label : ""
            value: root.values[index]
        }
    }
}
