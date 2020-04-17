# 'About' page for Sailfish apps

This repo provides files to include a simple 'About' page with license and
contributors information in your Sailfish app.

## Configuration

Configuration is done by changing `sf-about-page/about.js`. Changing the QML
files is neither necessary nor recommended.

## How to use

Put the `sf-about-page` directory with all files into `APPROOT/qml` and add the
following to your PRO file:

```
DISTFILES += qml/sf-about-page/*.qml \
    qml/sf-about-page/license.html \
    qml/sf-about-page/about.js
```

Then in the file from where you want to push your new About page on the page
stack:

```
import "PATH/sf-about-page/about.js" as About

... code ...

About.pushAboutPage(pageStack)
```

## License

Currently, `sf-about-page` is released under the GNU GPL v3 or later.

```
Copyright (C) 2020  Mirian Margiani

sf-about-page is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

sf-about-page is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with sf-about-page.  If not, see <http://www.gnu.org/licenses/>.
```
