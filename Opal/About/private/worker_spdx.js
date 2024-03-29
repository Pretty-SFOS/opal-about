//@ This file is part of opal-about.
//@ https://github.com/Pretty-SFOS/opal-about
//@ SPDX-FileCopyrightText: 2021-2022 Mirian Margiani
//@ SPDX-License-Identifier: GPL-3.0-or-later

var LOG_SCOPE = '[Opal.About]'

function getShortText(origShortText, spdxId) {
    // This function provides standard short texts for a few common licenses,
    // unless a short text is already provided by the user.
    if (!!origShortText) return origShortText

    if (/^[AL]?GPL-/.test(spdxId)) {
        return "This is free software: you are welcome to redistribute it under certain conditions. " +
               "There is NO WARRANTY, to the extent permitted by law."
    }

    return origShortText
}

function sendError(spdxId, shortText) {
    WorkerScript.sendMessage({
        spdxId: spdxId,
        name: "",
        fullText: "",
        shortText: shortText,
        error: true
    })
}

function sendSuccess(spdxId, name, fullText, shortText) {
    WorkerScript.sendMessage({
        spdxId: spdxId,
        name: name,
        fullText: fullText,
        shortText: shortText,
        error: false
    })
}

function request(type, url, onSuccess, onFailure, postData) {
    var xhr = new XMLHttpRequest
    xhr.open(type, url)
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            var response = xhr.responseText

            if (response === "") {
                onFailure(xhr)
            } else {
                onSuccess(xhr)
            }
        }
    }

    if (postData !== undefined && type === "PUT") {
        xhr.send(postData)
    } else {
        xhr.send()
    }
}

function loadRemote(spdxId, localUrl, remoteUrl, origShortText) {
    request("GET", remoteUrl, function(xhr) {
        try {
            var o = JSON.parse(xhr.responseText)
            if (!o || typeof o !== "object") throw 1
            console.log(LOG_SCOPE, "license loaded remotely from", remoteUrl)
            sendSuccess(spdxId, o['name'], o['licenseText'],
                        getShortText(origShortText, spdxId))

            request("PUT", localUrl, function(x){
                console.log(LOG_SCOPE, "saved license with status", x.status, "to", localUrl)
            }, function(x){}, xhr.responseText)
        } catch (e) {
            console.log(LOG_SCOPE, "failed to load license remotely from", remoteUrl)
            sendError(spdxId, getShortText(origShortText, spdxId))
        }
    }, function(xhr) {
        console.log(LOG_SCOPE, "failed to load license remotely from", remoteUrl)
        sendError(spdxId, getShortText(origShortText, spdxId))
    })
}

WorkerScript.onMessage = function(message) {
    if (message.spdxId === undefined || message.spdxId === "") {
        console.error(LOG_SCOPE, "cannot load license without spdx id")
        sendError("")
        return
    }

    request("GET", message.localUrl, function(xhr) {
        try {
            var o = JSON.parse(xhr.responseText)
            if (!o || typeof o !== "object") throw 1
            console.log(LOG_SCOPE, "license loaded locally from", message.localUrl)
            sendSuccess(message.spdxId, o['name'], o['licenseText'],
                        getShortText(message.shortText, message.spdxId))
        } catch (e) {
            if (!!message.online) {
                loadRemote(message.spdxId, message.localUrl, message.remoteUrl, message.shortText)
            } else {
                console.log(LOG_SCOPE, "license not cached at "+message.localUrl+
                            ", skipping download in offline mode")
                sendError(message.spdxId, getShortText(message.shortText, message.spdxId))
            }
        }
    }, function(xhr) {
        if (!!message.online) {
            loadRemote(message.spdxId, message.localUrl, message.remoteUrl, message.shortText)
        } else {
            console.log(LOG_SCOPE, "license not cached at "+message.localUrl+
                        ", skipping download in offline mode")
            sendError(message.spdxId, getShortText(message.shortText, message.spdxId))
        }
    })
}
