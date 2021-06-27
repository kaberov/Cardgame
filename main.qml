import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

Window {
    id: w

    minimumWidth: 600
    maximumWidth: 600
    minimumHeight: cl.height
    maximumHeight: cl.height
    width: 600
    height: cl.height
    visible: true
    title: qsTr("Cards!")

    ColumnLayout{
        id: cl

        anchors.centerIn: w.contentItem
        spacing: 2

        Gameplay{
            id: gameplay
            onTimeStop: {
               toolbar.timeStop()
            }
        }

        Toolbar{
            id: toolbar

            onQuitApp:{
                Qt.quit()
            }
            onNewGame: {
                gameplay.newGame()
                gameplay.light()
            }
            onClearGame: {
                gameplay.cleanGame()
            }
            onTimeout: {
                gameplay.timeout()
            }
            onWin: {
                gameplay.cleanGame()
                gameplay.win()
            }
        }
    }
}
