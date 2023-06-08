<!--
SPDX-FileCopyrightText: 2023 Mirian Margiani
SPDX-License-Identifier: GFDL-1.3-or-later
-->

# Changelog

## 2.0.0 (2023-06-08)

I forgot to rename a component before the final 1.0.0 release, so now we get
version 2.0.0 because of this breaking change.

- renamed `Changelog` to `ChangelogItem`, so that custom changelogs based on
  `ChangelogList` can be called `Changelog.qml`
- added a new `ChangelogNews` component for automatically showing a "what's new" dialog after an update
- added missing documentation for the `paragraphs` property in `ChangelogItem`
- fixed a few links in the documentation
- fixed QML minification for some files where it failed

## 1.0.0 (2023-06-03)

- first fully-featured and stable release
