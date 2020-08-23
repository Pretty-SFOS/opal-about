# INCLUDEPATH += $$PWD
QML_IMPORT_PATH += $$PWD

1.path = $$[QT_INSTALL_QML]/Opal/About
1.files = \
    $$PWD/Opal/About/qmldir \
    $$PWD/Opal/About/AboutPageBase.qml \
    $$PWD/Opal/About/License.qml \
    $$PWD/Opal/About/InfoSection.qml \
    $$PWD/Opal/About/ContributionSection.qml \
    $$PWD/Opal/About/ContributionGroup.qml \

2.path = $$[QT_INSTALL_QML]/Opal/About/private
2.files = \
    $$PWD/Opal/About/private/qmldir \
    $$PWD/Opal/About/private/ContributorsPage.qml \
    $$PWD/Opal/About/private/DetailList.qml \
    $$PWD/Opal/About/private/LicensePage.qml \

INSTALLS += 1 2
DISTFILES += $$1.files $$2.files

#message(Plugins: $$[QT_INSTALL_PLUGINS])
#message(QML: $$[QT_INSTALL_QML])
#message(Data files: $$[QT_INSTALL_DATA])
