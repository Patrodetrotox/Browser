import QtQuick 2.6
import Sailfish.Silica 1.0
import "../../qml"


Page {
    id: root

    Column {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        Drawer {
            id: drawer
            backgroundSize: buttonRow.height
            width: parent.width
            height: parent.height - textField.height
            dock: Dock.Bottom
            SilicaWebView {

                Connections{
                    target: application
                    onNavigateBack: webView.goBack()
                    onNavigateForward: webView.goForward()
                }

                Binding {
                    target: application
                    property: 'currentPageTitle'
                    value: textField.label
                }

                Binding {
                    target: application
                    property: 'canNavigateForward'
                    value: webView.canGoForward
                }

                Binding {
                    target: application
                    property: 'canNavigateBack'
                    value: webView.canGoBack
                }

                id: webView
                width: parent.width
                height: parent.height
                url: "https://doc.qt.io/qt-5/qml-qtwebview-webview.html"
            }
            background: Row {
                id: buttonRow
                spacing: Theme.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter
                IconButton {
                    enabled: webView.canGoBack
                    icon.source: "image://theme/icon-m-back"
                    onClicked: {
                        webView.goBack()
                    }
                }
                IconButton {
                    icon.source: "image://theme/icon-m-reload"
                    onClicked: {
                        webView.reload()
                    }
                }
                IconButton {
                    enabled: webView.canGoForward
                    icon.source: "image://theme/icon-m-forward"
                    onClicked: {
                        webView.goForward()
                    }
                }
            }
        }
        Row {
           TextField {

               EnterKey.enabled: acceptableInput

               EnterKey.onClicked: webView.url = textField.text

               id: textField
               width: root.width * 5/6
               text: webView.url
               validator: RegExpValidator { regExp: /^((?:https?\:)?(?:\/{2})?)?((?:[\w\d-_]+)\.(?:[\w\d-_\.ы]{2,64}))(\:\d{2,6})?((?:\/|\?|#|&){1}(?:[\w\d\S]+)?)?$/i }
               states: [
                   State {
                       when: webView.loading == false
                       name: "loaded"
                       PropertyChanges {
                           target: textField
                           label: webView.title
                       }
                   },

                   State {
                       when: webView.loading == true
                       name: "loading"
                       PropertyChanges {
                           target: textField
                           label: "laoding... {" + webView.loadProgress + "%}"
                       }
                   }
               ]


           }

            IconButton {
                icon.source: "image://theme/icon-m-menu"
                onClicked: {
                    if(drawer.opened) {
                        drawer.hide()
                    } else {
                        drawer.show()
                    }
                }
            }
        }
    }
}
