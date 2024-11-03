import QtQuick 2.0
import QtQuick.Controls 2.0
import execute 1.0

Window {
    width: 740
    height: 480
    visible: true
    color: "#db000000"
    title: qsTr("ExelentOS post install menu")
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowSystemMenuHint
    minimumWidth: 740
    maximumWidth: 740
    minimumHeight: 480
    maximumHeight: 480

    CommandExecutor {
        id: commandExecutor
    }
    Text {
        text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Cantarell'; font-size:11pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Blanka'; font-size:36pt; font-weight:700; color:#ffffff;\">Post install Menu</span></p></body></html>"
        textFormat: Text.RichText
        anchors.verticalCenterOffset: -211
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        font.pointSize: 20
    }

    Column {
        x: 0
        y: 92
        width: parent.width
        height: parent.height

        // Custom buttons for switching tabs


        // StackLayout to switch between grids
        Column {
             width: parent.width
             height: parent.height
             spacing: 20

             // Custom buttons to switch between grids
             Row {
                 spacing: 2
                 anchors.horizontalCenter: parent.horizontalCenter

                 Button {
                     id: postinstallationTab
                     text: "post Install"
                     checkable: true
                     checked: true
                     onClicked: {
                         installationGrid.visible = true
                         informationGrid.visible = false
                         appGrid.visible = false
                         postinstallationTab.checked = true
                         informationTab.checked = false
                         installapps.checked = false
                     }
                     background: Rectangle {
                         color: postinstallationTab.checked ? "#000000" : "#00000000"  // Active and inactive colors
                         border.color: postinstallationTab.checked ? "#FFFFFF" : "#00000000"
                         radius: 4
                         height: 30
                         width: 118
                     }
                     font.pixelSize: 16
                 }
                 Button {
                     id: installapps
                     text: "get more apps"
                     checkable: true
                     checked: false
                     onClicked: {
                         installationGrid.visible = false
                         informationGrid.visible = false
                         appGrid.visible = true
                         postinstallationTab.checked = false
                         informationTab.checked = false
                         installapps.checked = true
                     }
                     background: Rectangle {
                         color: installapps.checked ? "#000000" : "#00000000"  // Active and inactive colors
                         border.color: installapps.checked ? "#FFFFFF" : "#00000000"
                         radius: 4
                         height: 30
                         width: 130
                     }
                     font.pixelSize: 16
                 }

                 Button {
                     id: informationTab
                     text: "Information"
                     checkable: true
                     onClicked: {
                         installationGrid.visible = false
                         informationGrid.visible = true
                         appGrid.visible = false
                         informationTab.checked = true
                         postinstallationTab.checked = false
                         installapps.checked = false
                     }
                     background: Rectangle {
                         color: informationTab.checked ? "#000000" : "#00000000"
                         border.color: informationTab.checked ? "#FFFFFF" : "#00000000"
                         radius: 4
                         height: 30
                         width: 120
                     }
                     font.pixelSize: 16
                 }
             }
             // Installation Grid
             Grid {
                 id: installationGrid
                 rows: 3
                 columns: 2
                 spacing: 40
                 visible: true  // Default to visible
                 anchors.centerIn: parent

                 Button {
                     width: 300
                     height: 50
                     Text { color: "#ffffff"; text: "Update Mirrors"; anchors.centerIn: parent }
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
                     onClicked: {
                        var output = commandExecutor.executeCommand("konsole -e 'sudo bash -c \' reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist && pacman -Syy --noconfirm\''");
                        console.log("Command output:\n" + output);
                     }

                 }
                 Button {
                     width: 300
                     height: 50
                     Text { color: "#ffffff"; text: "Change Wallpaper"; textFormat: Text.RichText; anchors.centerIn: parent }
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
                     onClicked: {
                        var output = commandExecutor.executeCommand("systemsettings kcm_wallpaper");
                        console.log("Command output:\n" + output);
                     }

                 }
                 Button {
                     width: 300
                     height: 50
                     Text { color: "#ffffff"; text: "Update pacman packages"; anchors.centerIn: parent }
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
                     onClicked: {
                        var output = commandExecutor.executeCommand("konsole -e 'sudo bash -c \'sudo pacman -Syyu --noconfirm\''");
                        console.log("Command output:\n" + output);
                     }
                 }
                 Button {
                     width: 300
                     height: 50
                     Text { color: "#ffffff"; text: "customize user profile"; anchors.centerIn: parent }
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
                     onClicked: {
                        var output = commandExecutor.executeCommand("systemsettings kcm_users");
                         console.log("Command output:\n" + output);
                     }
                 }


                 // Add more items as needed
             }
             Grid {
                 id: appGrid
                 rows: 3
                 columns: 2
                 spacing: 40
                 visible: false  // Default to visible
                 anchors.centerIn: parent

                 Button {
                     width: 300
                     height: 50
                     Text { color: "#ffffff"; text: "Open discover"; anchors.centerIn: parent }
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
                     onClicked: {
                         var output = commandExecutor.executeCommand("plasma-discover");
                         console.log("Command output:\n" + output);
                     }

                 }
                 Button {
                     width: 300
                     height: 50
                     Text { color: "#ffffff"; text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Cantarell'; font-size:11pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Open pacman package website</p></body></html>"; textFormat: Text.RichText; anchors.centerIn: parent }
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
                     onClicked: {
                         // Replace with your desired URL
                         var url = "https://archlinux.org/packages/";
                         Qt.openUrlExternally(url); // Opens the URL in the default browser
                     }

                 }
                 Button {
                     width: 300
                     height: 50
                     Text { color: "#ffffff"; text: "open aur website"; anchors.centerIn: parent }
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
                     onClicked: {
                         // Replace with your desired URL
                         var url = "https://aur.archlinux.org/packages";
                         Qt.openUrlExternally(url); // Opens the URL in the default browser
                     }
                 }

                 // Add more items as needed
             }

             // Information Grid
             Grid {
                 id: informationGrid
                 rows: 2
                 columns: 2
                 spacing: 10
                 visible: false  // Initially hidden
                 anchors.centerIn: parent

                 Button {
                     width: 300
                     height: 50
                     Text { color: "#ffffff"; text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Cantarell'; font-size:11pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Visit ExelentOS website</p></body></html>"; textFormat: Text.RichText; anchors.centerIn: parent }
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
                     onClicked: {
                         // Replace with your desired URL
                         var url = "https://exelentos.github.io";
                         Qt.openUrlExternally(url); // Opens the URL in the default browser
                     }
                 }
                 Button {
                     width: 300
                     height: 50
                     Text { color: "#ffffff"; text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Cantarell'; font-size:11pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Visit ExelentOS wiki</p></body></html>"; textFormat: Text.RichText; anchors.centerIn: parent }
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
                     onClicked: {
                         // Replace with your desired URL
                         var url = "https://exelentos.github.io/wiki/index.html";
                         Qt.openUrlExternally(url); // Opens the URL in the default browser
                     }
                 }
                 Button {
                     width: 300
                     height: 50
                     Text { color: "#ffffff"; text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Cantarell'; font-size:11pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Visit github issue page</p></body></html>"; textFormat: Text.RichText; anchors.centerIn: parent }
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
                     onClicked: {
                         // Replace with your desired URL
                         var url = "https://github.com/ExelentOS/ExelentOS-iso/issues";
                         Qt.openUrlExternally(url); // Opens the URL in the default browser
                     }
                 }
                 Button {
                     width: 300
                     height: 50
                     Text { color: "#ffffff"; text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Cantarell'; font-size:11pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Visit ExelentOS github page</p></body></html>"; textFormat: Text.RichText; anchors.centerIn: parent }
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
                     onClicked: {
                         // Replace with your desired URL
                         var url = "https://github.com/ExelentOS/";
                         Qt.openUrlExternally(url); // Opens the URL in the default browser
                     }
                 }
                 // Add more items as needed
             }
        }

    }
    Row {
        spacing: 10
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 10
        anchors.rightMargin: 10

        Button {
            text: "Close"
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
            onClicked: {
                Qt.quit()  // Or other close function
            }
        }

        Button {
            text: "Disable and Close"
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
            onClicked: {
                // Implement disable functionality here
                var output = commandExecutor.executeCommand("rm ~/.config/autostart/welcome.desktop");
                console.log("Command output:\n" + output);
                Qt.quit()  // Or other close function

            }
        }
    }

}


