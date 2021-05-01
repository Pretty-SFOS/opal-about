/*
 * This file is part of opal-about.
 * SPDX-FileCopyrightText: 2021 Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick 2.0
import "private/functions.js" as Func

QtObject {
    property string name
    property var entries: []
    property list<License> licenses

    property var _spdxList: null

    function _getSpdxList(force) {
        var upd = Func.updateSpdxList(licenses, _spdxList, force)
        if (upd !== null) {
            _spdxList = upd.spdx
        }
        return _spdxList
    }

    function _getSpdxString(append, force) {
        var str = _getSpdxList(force).join(', ')
        if (str !== '' && append) str = str + ' ' + append
        return str
    }
}
