/*
 * This file is part of opal-about.
 *
 * SPDX-FileCopyrightText: 2021 Mirian Margiani
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
 */

function sendError(spdxId) {
    WorkerScript.sendMessage({
        spdxId: spdxId,
        name: "",
        fullText: "",
        error: true
    });
}

function sendSuccess(spdxId, name, fullText) {
    WorkerScript.sendMessage({
        spdxId: spdxId,
        name: name,
        fullText: fullText,
        error: false
    });
}

function request(type, url, onSuccess, onFailure, postData) {
    var xhr = new XMLHttpRequest;
    xhr.open(type, url);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            var response = xhr.responseText;

            if (response === "") {
                onFailure(xhr);
            } else {
                onSuccess(xhr);
            }
        }
    };

    if (postData !== undefined && type === "PUT") {
        xhr.send(postData);
    } else {
        xhr.send();
    }
}

function loadRemote(spdxId, localUrl, remoteUrl) {
    request("GET", remoteUrl, function(xhr) {
        try {
            var o = JSON.parse(xhr.responseText);
            if (!o || typeof o !== "object") throw 1;
            console.log("license loaded remotely from", remoteUrl);
            sendSuccess(spdxId, o['name'], o['licenseText']);

            request("PUT", localUrl, function(x){
                console.log("saved license with status", x.status, "to", localUrl);
            }, function(x){}, xhr.responseText);
        }
        catch (e) {
            console.log("failed to load license remotely from", remoteUrl);
            sendError(spdxId);
        }
    }, function(xhr) {
        console.log("failed to load license remotely from", remoteUrl);
        sendError(spdxId);
    });
}

WorkerScript.onMessage = function(message) {
    if (message.spdxId === undefined || message.spdxId === "") {
        error = true;
        console.error("cannot load license without spdx id");
        sendError("");
        return;
    }

    request("GET", message.localUrl, function(xhr) {
        try {
            var o = JSON.parse(xhr.responseText);
            if (!o || typeof o !== "object") throw 1;
            console.log("license loaded locally from", message.localUrl);
            sendSuccess(message.spdxId, o['name'], o['licenseText']);
        }
        catch (e) {
            loadRemote(message.spdxId, message.localUrl, message.remoteUrl);
        }
    }, function(xhr) {
        loadRemote(message.spdxId, message.localUrl, message.remoteUrl);
    });
}
