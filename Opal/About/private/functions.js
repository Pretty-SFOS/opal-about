/*
 * This file is part of opal-about.
 * SPDX-FileCopyrightText: 2021 Mirian Margiani
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

.pragma library

function updateSpdxList(licenses, spdxTarget, /*namesTarget,*/ force) {
    if (spdxTarget !== null /*&& namesTarget !== null*/ && force !== true) {
        return null
    }

    var spdx = []
    // var names = []

    for (var i in licenses) {
        spdx.push(licenses[i].spdxId)
        // names.push(licenses[i].name)
    }

    return { spdx: spdx/*, names: names*/ }
}
