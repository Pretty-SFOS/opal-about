<!--
SPDX-FileCopyrightText: 2023-2024 Mirian Margiani
SPDX-License-Identifier: GFDL-1.3-or-later
-->

# Changelog

## 3.0.1 (2025-11-26)

- Added translations: Bengali, Chinese (Traditional Han script), Hindi, Malayalam, Thai
- Updated translations: Czech, Finnish, French, Spanish, Swedish
- Updated gallery example page

## 3.0.0 (2025-08-10)

- Replaced the bundled external link handler with a new dependency on the
  [Opal.LinkHandler](https://github.com/Pretty-SFOS/opal-linkhandler) module.
  This is a drop-in replacement: simply install the link handler module and you
  are good to go. No QML changes are needed.

- The `autoAddOpalAttributions` property is now enabled by default. This means
  you no longer have to manually add Opal modules that you are using to the
  `attributions` list of your About page. All attributions properly installed
  to `qml/modules/Opal/Attributions/Opal*Attribution.qml` are loaded automatically.

- Updated translations with contents from apps using this module.
  I tried my best to always keep the most up-to-date version of all strings.
  Hopefully nothing was overwritten - I apologize for any lost work!

**Migrating to version 3.0.0:**

- Install the [Opal.LinkHandler](https://github.com/Pretty-SFOS/opal-linkhandler) module
  ([latest release](https://github.com/Pretty-SFOS/opal-linkhandler/releases/latest)).
- Make sure `autoAddOpalAttributions` is not manually disabled in your About page.
- Once `autoAddOpalAttributions` is enabled (new default), remove all manual
  attributions for Opal modules from the `attributions` property in your About page.

## 2.3.9 (2025-08-08)

- Added translations: Arabic, Persian
- Updated translations: Turkish
- Added reference to `autoAddOpalAttributions` to `AboutPageBase::attributions` docs

## 2.3.8 (2025-06-11)

- Updated translations: Polish, Ukrainian

## 2.3.7 (2025-03-11)

- Updated translations: Estonian, Finnish, Portuguese, Portuguese (Brazil), Romanian, Russian, Slovak, Spanish, Tamil, Ukrainian

## 2.3.6 (2024-11-28)

- Updated translations: Portuguese, Portuguese (Brazil), Tamil

## 2.3.5 (2024-11-27)

- Added translations: Portuguese, Portuguese (Brazil), Tamil, Norwegian Nynorsk, Dutch (Belgium)
- Updated translations: Italian, German, English

## 2.3.4 (2024-11-19)

- Updated translations: Belarusian, Finnish, Slovak

## 2.3.3 (2024-10-30)

- Updated translations: Estonian, Swedish
- Added translations: Lithuanian

## 2.3.2 (2024-10-13)

- Updated translations: Estonian, Russian, Spanish, Ukrainian
- Removed duplicate Romanian translation
- Fixed QML minification in release bundles

## 2.3.1 (2024-10-12)

- Updated translations: Romanian, Italian

## 2.3.0 (2024-10-10)

- Updated translations: Moldavian, Italian, Romanian
- Added more default translations that can be used by other apps
- Added support for automatically loading Opal attributions
    - this feature can be enabled via the `autoAddOpalAttributions` property
    - it is disabled by default for now but will become the default setting in a future version
- Minor tweaks here and there

## 2.2.1 (2024-08-09)

- Updated translations: Finnish, Indonesian, Chinese, Ukrainian, Russian, Polish, Hungarian
- Fixed version being displayed when no version is given (thanks @roundedrectangle!)
- Updated packaging boilerplate

## 2.2.0 (2023-06-29)

- Added the ready-made Attribution component to `Opal/Attributions/Opal<module>Attribution.qml`
- You no longer have to import all Opal modules on the “About” page to attribute them,
  simply use `import "../modules/Opal/Attributions"` to access all attributions
- No extra import is required to attribute `Opal.About` itself

## 2.1.1 (2023-06-17)

- Updated translations: Spanish, Swedish, French, Dutch, Turkish
- Minor documentation updates and clarifications

## 2.1.0 (2023-06-13)

- Updated translations: Indonesian, French, German
- Fixed spacing of changelog paragraphs

## 2.0.0 (2023-06-11)

I forgot to rename a component before the final 1.0.0 release, so now we get
version 2.0.0 because of this breaking change.

- Renamed `Changelog` to `ChangelogItem`, so that custom changelogs based on
  `ChangelogList` can be called `Changelog.qml`
- Added a new `ChangelogNews` component for automatically showing a "what's new" dialog after an update
- Added missing documentation for the `paragraphs` property in `ChangelogItem`
- Fixed a few links in the documentation
- Fixed QML minification for some files where it failed
- Moved translations to Weblate

## 1.0.0 (2023-06-03)

- First fully-featured and stable release
