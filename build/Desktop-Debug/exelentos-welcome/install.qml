import QtQuick
import QtQuick.Controls 2

Page {
    id: newPage
    Rectangle {
        width: 640
        height: 480
        color: "#db000000"
        Text {
            anchors.centerIn: parent
            color: "#ffffff"
            text: "Welcome to the new screen!"
            font.pixelSize: 50
        }
    }
}
