import QtQuick 2.0
import Sailfish.Silica 1.0
import "../../qml"

CoverBackground {
    Label {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 40
        height: parent.height - 2 * coverBack.height
        truncationMode: TruncationMode.Elide
        id: coverLabel
        text: application.currentPageTitle
        wrapMode: Text.Wrap
        font.pixelSize: Theme.fontSizeMedium
    }

    CoverActionList {
        enabled: application.canNavigateBack && application.canNavigateForward
        CoverAction {
            id: coverBack
            iconSource: "image://theme/icon-cover-previous"
            onTriggered: application.navigateBack()
        }

        CoverAction {
            id: coverForward
            iconSource: "image://theme/icon-cover-next"
            onTriggered: application.navigateForward()
        }
    }

    CoverActionList {
        enabled: application.canNavigateBack && !application.canNavigateForward
        CoverAction {
            iconSource: "image://theme/icon-cover-previous"
            onTriggered: application.navigateBack()
        }
    }

    CoverActionList {
        enabled: !application.canNavigateBack && application.canNavigateForward

        CoverAction {
            iconSource: "image://theme/icon-cover-next"
            onTriggered: application.navigateForward()
        }
    }

//    IconButton {
//        id: coverBack
//        x: 0
//        y: parent.height - height
//        enabled: application.canNavigateBack
//        icon.source: "image://theme/icon-cover-previous"
//        onClicked: application.navigateBack()
//    }

//    IconButton {
//        id: coverForward
//        x: parent.width - width
//        y: parent.height - height
//        enabled: application.canNavigateForward
//        icon.source: "image://theme/icon-cover-next"
//        onClicked: application.navigateForward()
//    }
}
