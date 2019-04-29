import QtQuick 2.0
import QtQuick.Controls 2.2
Item {
    property alias currentAdver: listView.currentIndex
    Rectangle{
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width*0.8
        height: parent.height*0.8
        ListView{
            id:listView
            anchors.fill: parent
            model: 5
            orientation:ListView.Horizontal
            highlightRangeMode: ListView.StrictlyEnforceRange
            currentIndex:2
            spacing: sp(2)
            preferredHighlightBegin:parent.width/2-listView.width/4 //开始时候高光的位置
            preferredHighlightEnd: preferredHighlightBegin + listView.width/2
            delegate: Rectangle{
                width: listView.currentIndex === index ? listView.width/2 : listView.width/4
                height: listView.currentIndex === index ? listView.height * 0.9 : listView.height * 0.7
                color: listView.currentIndex === index ? "#CDCD00":"#DEB887"
                anchors.verticalCenter: parent.verticalCenter
                visible: (listView.currentIndex === index || listView.currentIndex === index-1 ||
                          listView.currentIndex === index+1) ? true : false
                Label{
                    anchors.centerIn: parent
                    font.pointSize: 10
                    text: "广告或推荐内容: "+index
                }
                Behavior on width {
                    NumberAnimation {
                        duration: 250
                    }
                }
                Behavior on height {
                    NumberAnimation {
                        duration: 250
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        listView.currentIndex = index
                    }
                }
            }
        }
    }

    Rectangle{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width*0.8
        height: parent.height*0.2
        Row{
            anchors.centerIn: parent
            spacing:sp(6)
            Repeater {
                id: rep1
                model: 5
                anchors.centerIn: parent
                Rectangle {
                    width: currentAdver == index ? sp(5) :sp(4)
                    height: width
                    color: currentAdver == index ? "black":"grey"
                    radius: width/2

                    Behavior on width {
                        NumberAnimation {
                            duration: 250
                        }
                    }
                    Behavior on height {
                        NumberAnimation {
                            duration: 250
                        }
                    }
                }
            }
        }

    }

    Timer {
        id: time
        interval: 2500
        running: true
        repeat: true
        onTriggered: {
            if(listView.currentIndex == listView.count-1)
            {
                console.log("listView.count:" + listView.count)
                listView.currentIndex = 1
            }else{
                listView.currentIndex++
            }
        }
    }
}
