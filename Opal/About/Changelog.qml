//@ This file is part of opal-about.
//@ https://github.com/Pretty-SFOS/opal-about
//@ SPDX-FileCopyrightText: 2023 Mirian Margiani
//@ SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.0
import "private/functions.js" as Func

/*!
    \qmltype Changelog
    \inqmlmodule Opal.About
    \inherits QtObject
    \brief Provides the definition of a changelog section for a specific version.

    This changelog is intended to be short, running text that highlights the
    most important user-facing changes in a version. Spare bullet points
    and complex technical descriptions for detailed changelogs in other
    release channels.

    Short changelogs will be read more often, keep the performance impact
    in check, reduce file sizes to a minimum, and look better.

    \sa AboutPageBase::changelogItems, AboutPageBase::changelogList, ChangelogList
*/
QtObject {
    /*!
      This property specifies the app version that this changelog describes.

      \note Make sure to sort changelogs chronologically with the most recent
      entry at the top.

      \required
    */
    property string version

    /*!
      This property holds the date when this version was released.

      It is recommended to define this property but it is not required.

      \note You can specify the date as an ISO-formatted string
      ("YYYY-MM-DD") or as a JS Date object.
    */
    property date date: new Date(NaN)

    /*!
      This property holds the author of a release.

      Set this property if you are working in a team or if an app changed
      maintainers over the course of its life.
    */
    property string author

    /*!
      This property may hold an additional description of the attribution.

      When attributing a third-party library, it may be desired to explain how
      exactly the library is used.

      When publishing a derived project, simply adding the name of the "parent"
      project is not enough. A short explanation is polite and will help users
      understand the origins of the new project.

      \note this description is only included on the license page. Sometimes,
      a \c InfoSection is better suited to display acknowledgments on the main
      page instead of / in addition to the license page.

      \sa InfoSection, InfoButton, InfoSection::smallPrint, openOrCopyUrl
    */
    property var paragraphs

    /*!
      This property defines the text format for the description.

      Set one of the QtQuick \l Text values. The default is
      \l {Text.StyledText}.
    */
    property int textFormat: Text.StyledText

    /*!
      This property holds a cleaned list of description paragraphs.
      \internal
    */
    property var __effectiveEntries: Func.makeStringList(paragraphs, false)

    /*!
      This property holds a string to be used as list view sections.
      \internal
    */
    property string __effectiveSection: version + (
        isNaN(date.valueOf()) ? '' :
        '|' + Qt.formatDate(date, Qt.DefaultLocaleShortDate))
}
