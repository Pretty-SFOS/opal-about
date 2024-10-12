<!--
SPDX-FileCopyrightText: 2023-2024 Mirian Margiani
SPDX-License-Identifier: GFDL-1.3-or-later
-->

# Changelog

## 2.3.1 (2024-10-12)

- updated translations: Romanian, Italian

## 2.3.0 (2024-10-10)

- updated translations: Moldavian, Italian, Romanian
- added more default translations that can be used by other apps
- added support for automatically loading Opal attributions
    - this feature can be enabled via the `autoAddOpalAttributions` property
    - it is disabled by default for now but will become the default setting in a future version
- minor tweaks here and there

## 2.2.1 (2024-08-09)

- updated translations: Finnish, Indonesian, Chinese, Ukrainian, Russian, Polish, Hungarian
- fixed version being displayed when no version is given (thanks @roundedrectangle!)
- updated packaging boilerplate

## 2.2.0 (2023-06-29)

- added the ready-made Attribution component to `Opal/Attributions/Opal<module>Attribution.qml`
- you no longer have to import all Opal modules on the “About” page to attribute them,
  simply use `import "../modules/Opal/Attributions"` to access all attributions
- no extra import is required to attribute `Opal.About` itself

## 2.1.1 (2023-06-17)

- updated translations: Spanish, Swedish, French, Dutch, Turkish
- minor documentation updates and clarifications

## 2.1.0 (2023-06-13)

- updated translations: Indonesian, French, German
- fixed spacing of changelog paragraphs

## 2.0.0 (2023-06-11)

I forgot to rename a component before the final 1.0.0 release, so now we get
version 2.0.0 because of this breaking change.

- renamed `Changelog` to `ChangelogItem`, so that custom changelogs based on
  `ChangelogList` can be called `Changelog.qml`
- added a new `ChangelogNews` component for automatically showing a "what's new" dialog after an update
- added missing documentation for the `paragraphs` property in `ChangelogItem`
- fixed a few links in the documentation
- fixed QML minification for some files where it failed
- moved translations to Weblate

## 1.0.0 (2023-06-03)

- first fully-featured and stable release
