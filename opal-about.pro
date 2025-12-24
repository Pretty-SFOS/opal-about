# This file is part of Opal and has been released into the public domain.
# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2021-2024 Mirian Margiani
# SPDX-FileCopyrightText: 2025 Peter G. (nephros)
#
# See https://github.com/Pretty-SFOS/opal for more information.

TEMPLATE = aux
TARGET = opal-about

MODULENAME = Opal/About
TARGETPATH = $$[QT_INSTALL_QML]/$$MODULENAME

import.files = $$MODULENAME/*.qml $$MODULENAME/qmldir $$MODULENAME/plugins.qmltypes
import.path = $$TARGETPATH

private.files = $$MODULENAME/private/*.qml $$MODULENAME/private/qmldir $$MODULENAME/private/plugins.qmltypes
private.path = $$TARGETPATH/private

target.path = $$TARGETPATH

OTHER_FILES += rpm/$$TARGET.spec \
               README.md

# Input
#SOURCES += 
#HEADERS += 

QML_FILES += Opal/About/Attribution.qml \
             Opal/About/InfoSection.qml \
             Opal/About/DonationService.qml \
             Opal/About/License.qml \
             Opal/About/private/LicenseListPart.qml \
             Opal/About/private/ExtraTranslations.qml \
             Opal/About/private/ChangelogPage.qml \
             Opal/About/private/ContributorsAttributionRepeater.qml \
             Opal/About/private/LicensePage.qml \
             Opal/About/private/ScrollbarType.qml \
             Opal/About/private/LicenseListRepeater.qml \
             Opal/About/private/DonationsGroup.qml \
             Opal/About/private/ChangelogView.qml \
             Opal/About/private/ContributorsPage.qml \
             Opal/About/private/DetailList.qml \
             Opal/About/private/ChangelogItemsLoader.qml \
             Opal/About/private/OpalAttributionsLoader.qml \
             Opal/About/AboutPageBase.qml \
             Opal/About/ContributionGroup.qml \
             Opal/About/ChangelogItem.qml \
             Opal/About/Button.qml \
             Opal/About/ContributionSection.qml \
             Opal/About/InfoButton.qml \
             Opal/About/ChangelogNews.qml \
             Opal/About/ChangelogList.qml


TRANSLATIONS += translations/opal-about-ab.ts \
                translations/opal-about-af.ts \
                translations/opal-about-ar.ts \
                translations/opal-about-be.ts \
                translations/opal-about-bn.ts \
                translations/opal-about-cs.ts \
                translations/opal-about-de.ts \
                translations/opal-about-el.ts \
                translations/opal-about-en.ts \
                translations/opal-about-es.ts \
                translations/opal-about-et.ts \
                translations/opal-about-fa.ts \
                translations/opal-about-fi.ts \
                translations/opal-about-fr.ts \
                translations/opal-about-hi.ts \
                translations/opal-about-hu.ts \
                translations/opal-about-id.ts \
                translations/opal-about-it.ts \
                translations/opal-about-ko.ts \
                translations/opal-about-lt.ts \
                translations/opal-about-ml.ts \
                translations/opal-about-ms.ts \
                translations/opal-about-nb_NO.ts \
                translations/opal-about-nl.ts \
                translations/opal-about-nl_BE.ts \
                translations/opal-about-nn.ts \
                translations/opal-about-pl.ts \
                translations/opal-about-pt.ts \
                translations/opal-about-pt_BR.ts \
                translations/opal-about-ro.ts \
                translations/opal-about-ru.ts \
                translations/opal-about-sk.ts \
                translations/opal-about-sr.ts \
                translations/opal-about-sv.ts \
                translations/opal-about-ta.ts \
                translations/opal-about-th.ts \
                translations/opal-about-tr.ts \
                translations/opal-about-ug.ts \
                translations/opal-about-uk.ts \
                translations/opal-about-zh_CN.ts \
                translations/opal-about-zh_Hant.ts

TS_FILE = translations/opal-about.ts

translations.commands += lupdate $$MODULENAME -ts $$TS_FILE
translations.depends = $$MODULENAME/*.qml
translations.CONFIG += no_check_exist no_link
translations.output = $$TS_FILE
translations.input = .

translations_install.files = $$TS_FILE
translations_install.path = /usr/share/translations/source
translations_install.CONFIG += no_check_exist

QMAKE_EXTRA_TARGETS += translations
PRE_TARGETDEPS += translations

qmfiles.input    = TRANSLATIONS
qmfiles.output   = $$OUT_PWD/translations/${QMAKE_FILE_BASE}.qm
qmfiles.commands = @echo "compiling ${QMAKE_FILE_NAME}"; lrelease -silent ${QMAKE_FILE_NAME} -qm ${QMAKE_FILE_OUT}
qmfiles.depends  = translations
qmfiles.CONFIG   = no_link target_predeps

qmfiles_install.files   = $$OUT_PWD/translations/*.qm
qmfiles_install.path    = /usr/share/translations
qmfiles_install.CONFIG  = no_check_exist

QMAKE_EXTRA_COMPILERS += qmfiles

INSTALLS += import private target translations_install qmfiles_install

