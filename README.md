<!--
SPDX-FileCopyrightText: 2020-2021 Mirian Margiani
SPDX-License-Identifier: GFDL-1.3-or-later
-->

# 'About' page for Sailfish apps

This repo provides files to include a simple 'About' page with license and
contributors information in your Sailfish app.

## How to use

### Setup

Follow the main documentation for installing Opal modules
[in the Wiki](https://github.com/Pretty-SFOS/opal).

### Configuration

See [`doc/gallery.qml`](doc/gallery.qml) for an example. Copy the file to get
started. You can run [`release-module.sh`](release-module.sh) to generate QCH
documentation. You can then add the documentation to QtCreator via
Extras → Settings → Help → Documentation → Add.

## Development

You do not need to clone this repository if you only intend to use the module in
another project. Simply download the
[latest release bundle](https://github.com/Pretty-SFOS/opal-about/releases/latest).

Follow the main documentation for developing modules
[in the Wiki](https://github.com/Pretty-SFOS/opal).

## License

Copyright (C) 2020-2021  Mirian Margiani

`opal-about` is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

`opal-about` is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with `opal-about`.  If not, see <http://www.gnu.org/licenses/>.
