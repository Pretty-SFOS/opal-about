import QtQuick 2.0
import Sailfish.Silica 1.0
import ".."

Repeater {
    id: root

    property bool initiallyExpanded
    property string mainModule

    delegate: LicenseListPart {
        title: modelData.name
        headerVisible: title !== '' && title !== mainModule
        licenses: modelData.licenses
        extraTexts: modelData.__effectiveEntries
        description: modelData.description
        initiallyExpanded: root.initiallyExpanded
        homepage: modelData.homepage
        sources: modelData.sources
    }
}
