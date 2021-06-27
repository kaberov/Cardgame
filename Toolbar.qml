import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

RowLayout{
    signal newGame()
    signal quitApp()
    signal win()
    signal timeout()
    signal clearGame()

    function timeStop(){
        timer.running=false
    }

    Button{
        id: newGameButton

        text: "New Game"
        onClicked: {

            newGame()
            timer.running= true
            timer.time=0
        }
    }

    TextField{
        id: timerField
        Layout.fillWidth: true
        readOnly: true
    }

    Button{
        id: quitButton
        text: "Quit"
        onClicked: quitApp()
    }

    Shortcut{
        context: Qt.ApplicationShortcut
        sequences: ["Ctrl+N"]
        onActivated: {
            newGame()
            timer.running= true
            timer.time=0
        }
    }

    Shortcut{
        context: Qt.ApplicationShortcut
        sequences: [StandardKey.Close, "Ctrl+Q"]
        onActivated: quitApp()
    }

    Timer
    {
            id:timer
            interval: 1000
            repeat: true
            running: false
            property int time: 0

            onTriggered: {
               timerField.text = 180-time
                if(time === 180){
                     timer.running=false
                     clearGame()
                     timer.time =-1
                }
                time++
            }

     }

}
