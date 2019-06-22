import QtQuick 2.6
import Sailfish.Silica 1.0
import "cover"

ApplicationWindow {
    id: application

    property string currentPageTitle
    property bool canNavigateBack: false
    property bool canNavigateForward: false
    
    signal navigateBack()
    signal navigateForward()

    initialPage: Qt.resolvedUrl("pages/BrowserPage.qml")
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
