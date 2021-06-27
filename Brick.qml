import QtQuick 2.0

Rectangle {
    width: 100
    height: 200
    color: post ? "darkgray" :"white"

    property int config: 14
    property bool light: false
    property bool chosen: false
    property bool post: false

    border.width: 1
    border.color: "black"

    function chose(){
        chosen = (post == false)
    }

    signal choses(int config)

    Rectangle {
        x: 19; y: 69; width: 8; height: 8
        color: light ? "black" :"white"
        visible: config > 1
    }

    Rectangle {
        x: 46; y: 69; width: 8; height: 8
        color: light ? "black" :"white"
        visible: false
    }

    Rectangle {
        x: 73; y: 69; width: 8; height: 8
        color: light ? "black" :"white"
        visible: config > 3
    }

    Rectangle {
        x: 19; y: 96; width: 8; height: 8
        color: light ? "black" :"white"
        visible: config == 6
    }

    Rectangle {
        x: 46; y: 96; width: 8; height: 8
        color: light ? "black" :"white"
        visible: (config % 2) != 0
    }

    Rectangle {
        x: 73; y: 96; width: 8; height: 8
        color: light ? "black" :"white"
        visible: config == 6
    }
    Rectangle {
        x: 19; y: 123; width: 8; height: 8
        color: light ? "black" :"white"
        visible: config > 3
    }

    Rectangle {
        x: 46; y: 123; width: 8; height: 8
        color: light ? "black" :"white"
        visible: false
    }

    Rectangle {
        x: 73; y: 123; width: 8; height: 8
        color: light ? "black" :"white"
        visible: config > 1
    }

    MouseArea{
        anchors.fill: parent

        onClicked: {
            chose()
            choses(parent.config)
        }

    }

}
