import QtQuick
import QtQuick.Controls 2 // Import QtQuick Controls

Window {
    width: 640
    height: 480
    visible: true
    color: "#db000000"
    title: qsTr("Welcome to ExelentOS")
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowSystemMenuHint
    minimumWidth: 640
    maximumWidth: 640
    minimumHeight: 480
    maximumHeight: 480
    Item {
        id: mainContent
        anchors.fill: parent
        opacity: 0 // Start with zero opacity

        // Fade-in animation
        SequentialAnimation on opacity {
            running: true // Start the animation when visible
            NumberAnimation { to: 1; duration: 1000 } // 1 second fade-in
        }

        Text {
            id: _text
            x: 114
            y: 0
            width: 413
            height: 77
            color: "#ffffff"
            text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Cantarell'; font-size:11pt; font-weight:400; font-style:normal;\">\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Blanka'; font-size:48pt;\">Welcome to</span></p></body></html>"
            font.pixelSize: 50
            textFormat: Text.RichText
        }

        Image {
            id: image
            width: 642
            height: 504
            anchors.verticalCenter: _text.verticalCenter
            anchors.left: _text.right
            anchors.right: _text.left
            anchors.top: _text.bottom
            anchors.bottom: _text.top
            anchors.leftMargin: -527
            anchors.rightMargin: -526
            anchors.topMargin: -9
            anchors.bottomMargin: -480
            source: "qrc:/images/exelentos-logo-dark.png" // Ensure this matches the prefix in your QRC file
            anchors.verticalCenterOffset: 235
            anchors.horizontalCenterOffset: -2
            anchors.horizontalCenter: _text.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }

        Button {
            x: 470
            y: 420
            height: 38
            text: "Start Your Journey"
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                }
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor

                    onEntered: {
                        parent.border.color = "purple"; // Change border color on hover
                    }

                    onExited: {
                        parent.border.color = "#888"; // Reset border color when not hovered
                    }

                    onClicked: {
                        customButton.textColor = "purple"; // Change text color on click
                    }
                }
            }
            anchors.topMargin: 20 // Margin above the button
            onClicked: {
                mainApp.startJourney();
                mainApp.openNewQml();
            }
        }
    }
}


