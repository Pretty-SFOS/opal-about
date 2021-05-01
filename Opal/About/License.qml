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
 * 2021-01-01:
 * - improved loading time by loading license texts in a worker thread
 *
 * 2020-08-23:
 * - initial release
 *
 */

import QtQuick 2.0
import Sailfish.Silica 1.0 // for StandardPaths

QtObject {
    property string spdxId
    property string customShortText: ""

    readonly property bool error: __error
    readonly property string name: __name
    readonly property string fullText: __fullText

    property var __forComponents: [] // used for deduplication

    property string __localUrl: "%1/%2.json".arg(StandardPaths.temporary).arg(spdxId)
    property string __remoteUrl: "https://spdx.org/licenses/%1.json".arg(spdxId)
    property string __name: ""
    property string __fullText: ""
    property bool __error: false
    property bool __initialized: false

    property WorkerScript __worker: WorkerScript {
        source: "private/worker_spdx.js"
        onMessage: {
            if (messageObject.spdxId !== spdxId) return;
            __name = messageObject.name;
            __fullText = messageObject.fullText;
            __error = messageObject.error;
        }

        Component.onCompleted: {
            _load();
            __initialized = true;
        }
    }

    onSpdxIdChanged: {
        if (__initialized) _load(true)
    }

    function _load(force) {
        if (fullText !== "" && force !== true) return;
        if (spdxId === undefined || spdxId === "") {
            __error = true;
            console.error("cannot load license without spdxId");
            return;
        }

        __name = ""; __fullText = ""; __error = false;
        __worker.sendMessage({
            spdxId: spdxId, localUrl: __localUrl, remoteUrl: __remoteUrl });
    }
}
