import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
GridLayout{
    id: gl
    width: 600
    height: 600

    columns: 6
    rows: 3
    columnSpacing: 0
    rowSpacing: 0
    signal timeStop()

    function newGame(){
        var newGameConfig =  helper.newGame()
        dialog.win = false
        for (var i = 0; i<18; i++){
            bricks.itemAt(i).config = newGameConfig[i]
            bricks.itemAt(i).light = false
            bricks.itemAt(i).post = false
            bricks.itemAt(i).chosen = false
        }
    }
    function cleanGame(){
        for (var i = 0; i<18; i++)
            bricks.itemAt(i).config = 0
    }
    function light(){
        var list = []
        var listch = []
        var listp = []
        var counter_chosen = 0
        for (var j = 0; j<18; j++){
           list.push( bricks.itemAt(j).config)
           listch.push( bricks.itemAt(j).chosen)
           if (listch[j]===true){
               counter_chosen++
           }
           listp.push( bricks.itemAt(j).post)
        }
        if(counter_chosen>=2){
            listp = helper.light(list, listp, listch)
        }
        var counter_listp = 0
        for (var i = 0; i<18; i++){

            bricks.itemAt(i).light = listp[i]
            bricks.itemAt(i).post = listp[i]

            if (listch[i]===true){
                bricks.itemAt(i).light = listch[i]
            }

            if(listp[i]===true)
                counter_listp++
        }
        if(counter_listp>=18){
            console.log("Win!")
            win()
        }
        if(counter_chosen>=2){
            for (var k = 0; k<18; k++){
                bricks.itemAt(k).chosen = false
            }
        }
    }


    function timeout(){
        dialog.texts="Game over"
        dialog.win = true
        cleanGame()
    }

    function win(){
        timeStop()
        dialog.texts="Victory!"
        dialog.win = true
    }
    Repeater{
        id:bricks
        model:18

        Brick {
                onChoses: gameplay.light()
        }

    Component.onCompleted:  {
        newGame()
    }
    }
    Dialog {
        property bool win: false
        property string texts: "-1"
        height: 300
        width:500
        id: dialog
        Label {
                text:dialog.texts
            }
        title:texts
        modal: true
        standardButtons: Dialog.Ok
        anchors.centerIn: parent
        visible: win
    }


}
