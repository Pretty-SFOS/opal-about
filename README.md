<!--
SPDX-FileCopyrightText: 2020-2023 Mirian Margiani
SPDX-License-Identifier: GFDL-1.3-or-later
-->

# 'About' page for Sailfish apps

A shiny and flexible “About” page supporting license info, contributors,
changelogs, donations, etc. in your Sailfish app.

## Screenshots

TBD.

## Example code

A most basic but beautiful “About” page can be added with very few lines of
code:

```{qml}
import QtQuick 2.0
import Sailfish.Silica 1.0 as S
import Opal.About 1.0 as A

A.AboutPageBase {
    id: root
    allowedOrientations: S.Orientation.All
    appName: "My App"
    appIcon: Qt.resolvedUrl("../images/harbour-my-app.png")
    appVersion: "1.0.0"
    description: "My App is a simple app."
    authors: "2023 Me, Myself, and I"
    licenses: A.License { spdxId: "GPL-3.0-or-later" }
    attributions: A.OpalAboutAttribution {}
    sourcesUrl: "https://git.example.org/my-app"
}
```

Advanced features are just as easy to use and extensive documentation is
available through QtCreator.

### Note on Qmllive

`Opal.About` does not yet work properly with Qmllive.

## How to use

You do not need to clone this repository if you only intend to use the module in
another project. Simply download the
[latest release bundle](https://github.com/Pretty-SFOS/opal-about/releases/latest).

### Setup

Follow the main documentation for installing Opal modules
[here](https://github.com/Pretty-SFOS/opal/blob/main/README.md#using-opal).

### Configuration

See [`doc/gallery.qml`](doc/gallery.qml) for an example. Copy the file to get
started.

### Documentation

Extensive documentation is included in the release bundle and can be added to
QtCreator via Extras → Settings → Help → Documentation → Add.

## Size

The “minified” release bundle without documentation comments takes about 40 KiB.
This is similar to a bare-bones manually built “About” page including the HTML
version of the GNU GPL v3 but without a list of contributors.

## License

    Copyright (C) 2018-2023  Mirian Margiani
    Program: opal-about

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
