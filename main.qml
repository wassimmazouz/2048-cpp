import QtQuick 6.6
import QtQuick.Window 6.6
import QtQuick.Controls 6.6

Window {
    id: game2048
    width: 468
    height: 612
    visible: true
    color: "#363535"
    property alias textNewFontfamily: textNew.font.family
    title : qsTr("Jeu du 2048")

    Rectangle {
        id: rectangleGrille
        y: 225
        width: 315
        height: 315
        color: "#f5f4f2"
        radius: 5
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter

        Grid {
            id: grille_game
            y: 10
            width: 297
            height: 297
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 9
            rows: 4
            columns: 4

            Rectangle {
                id: rect_1_1
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3

                Text {
                    focus: true
                    id: text_1_1
                    text: (ObjetGrid.grid_QML[0] === '0') ? " " : ObjetGrid.grid_QML[0];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_1_1.text === "0"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_1_1.text === "2"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_1_1.text === "4"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_1_1.text === "8"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_1_1.text === "16"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_1_1.text === "32"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_1_1.text === "64"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_1_1.text === "128"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_1_1.text === "256"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_1_1.text === "512"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_1_1.text === "1024"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_1_1.text === "2048"
                            PropertyChanges {target: rect_1_1 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_1_1 ; duration: 30
                            }

                        }]

                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_1_2
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus: true;
                    id: text_1_2
                    text:(ObjetGrid.grid_QML[1] === '0') ? " " : ObjetGrid.grid_QML[1];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                     font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_1_2.text === "0"
                            PropertyChanges {target: rect_1_2 ; color : ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_1_2.text === "2"
                            PropertyChanges {target: rect_1_2 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_1_2.text === "4"
                            PropertyChanges {target: rect_1_2 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_1_2.text === "8"
                            PropertyChanges {target: rect_1_2 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_1_2.text === "16"
                            PropertyChanges {target: rect_1_2 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_1_2.text === "32"
                            PropertyChanges {target: rect_1_2 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_1_2.text === "64"
                            PropertyChanges {target: rect_1_2 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_1_2.text === "128"
                            PropertyChanges {target: rect_1_2 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_1_2.text === "256"
                            PropertyChanges {target: rect_1_2 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_1_2.text === "512"
                            PropertyChanges {target: rect_1_2 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_1_2.text === "1024"
                            PropertyChanges {target: rect_1_2 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_1_2.text === "2048"
                            PropertyChanges {target: rect_1_2 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_1_2 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_1_3
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus: true;
                    id: text_1_3
                    text: (ObjetGrid.grid_QML[2] === '0') ? " " : ObjetGrid.grid_QML[2];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                     font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_1_3.text === "0"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_1_3.text === "2"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_1_3.text === "4"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_1_3.text === "8"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_1_3.text === "16"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_1_3.text === "32"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_1_3.text === "64"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_1_3.text === "128"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_1_3.text === "256"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_1_3.text === "512"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_1_3.text === "1024"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_1_3.text === "2048"
                            PropertyChanges {target: rect_1_3 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_1_3 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_1_4
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_1_4
                    text: (ObjetGrid.grid_QML[3] === '0') ? " " : ObjetGrid.grid_QML[3];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                     font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_1_4.text === "0"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_1_4.text === "2"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_1_4.text === "4"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_1_4.text === "8"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_1_4.text === "16"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_1_4.text === "32"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_1_4.text === "64"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_1_4.text === "128"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_1_4.text === "256"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_1_4.text === "512"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_1_4.text === "1024"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_1_4.text === "2048"
                            PropertyChanges {target: rect_1_4 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_1_4 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_2_1
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_2_1
                    text: (ObjetGrid.grid_QML[4] === '0') ? " " : ObjetGrid.grid_QML[4];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                     font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_2_1.text === "0"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_2_1.text === "2"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_2_1.text === "4"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_2_1.text === "8"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_2_1.text === "16"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_2_1.text === "32"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_2_1.text === "64"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_2_1.text === "128"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_2_1.text === "256"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_2_1.text === "512"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_2_1.text === "1024"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_2_1.text === "2048"
                            PropertyChanges {target: rect_2_1 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_2_1 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_2_2
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_2_2
                    text: (ObjetGrid.grid_QML[5] === '0') ? " " : ObjetGrid.grid_QML[5];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_2_2.text === "0"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_2_2.text === "2"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_2_2.text === "4"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_2_2.text === "8"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_2_2.text === "16"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_2_2.text === "32"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_2_2.text === "64"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_2_2.text === "128"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_2_2.text === "256"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_2_2.text === "512"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_2_2.text === "1024"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_2_2.text === "2048"
                            PropertyChanges {target: rect_2_2 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_2_2 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_2_3
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_2_3
                    text: (ObjetGrid.grid_QML[6] === '0') ? " " : ObjetGrid.grid_QML[6];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_2_3.text === "0"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_2_3.text === "2"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_2_3.text === "4"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_2_3.text === "8"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_2_3.text === "16"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_2_3.text === "32"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_2_3.text === "64"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_2_3.text === "128"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_2_3.text === "256"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_2_3.text === "512"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_2_3.text === "1024"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_2_3.text === "2048"
                            PropertyChanges {target: rect_2_3 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_2_3 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_2_4
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_2_4
                    text: (ObjetGrid.grid_QML[7] === '0') ? " " : ObjetGrid.grid_QML[7];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_2_4.text === "0"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_2_4.text === "2"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_2_4.text === "4"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_2_4.text === "8"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_2_4.text === "16"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_2_4.text === "32"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_2_4.text === "64"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_2_4.text === "128"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_2_4.text === "256"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_2_4.text === "512"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_2_4.text === "1024"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_2_4.text === "2048"
                            PropertyChanges {target: rect_2_4 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_2_4 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_3_1
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_3_1
                    text: (ObjetGrid.grid_QML[8] === '0') ? " " : ObjetGrid.grid_QML[8];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_3_1.text === "0"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_3_1.text === "2"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_3_1.text === "4"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_3_1.text === "8"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_3_1.text === "16"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_3_1.text === "32"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_3_1.text === "64"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_3_1.text === "128"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_3_1.text === "256"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_3_1.text === "512"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_3_1.text === "1024"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_3_1.text === "2048"
                            PropertyChanges {target: rect_3_1 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_3_1 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_3_2
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_3_2
                    text: (ObjetGrid.grid_QML[9] === '0') ? " " : ObjetGrid.grid_QML[9];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_3_2.text === "0"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_3_2.text === "2"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_3_2.text === "4"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_3_2.text === "8"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_3_2.text === "16"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_3_2.text === "32"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_3_2.text === "64"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_3_2.text === "128"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_3_2.text === "256"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_3_2.text === "512"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_3_2.text === "1024"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_3_2.text === "2048"
                            PropertyChanges {target: rect_3_2 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_3_2 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_3_3
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_3_3
                    text: (ObjetGrid.grid_QML[10] === '0') ? " " : ObjetGrid.grid_QML[10];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_3_3.text === "0"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_3_3.text === "2"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_3_3.text === "4"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_3_3.text === "8"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_3_3.text === "16"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_3_3.text === "32"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_3_3.text === "64"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_3_3.text === "128"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_3_3.text === "256"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_3_3.text === "512"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_3_3.text === "1024"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_3_3.text === "2048"
                            PropertyChanges {target: rect_3_3 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_3_3 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_3_4
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_3_4
                    text: (ObjetGrid.grid_QML[11] === '0') ? " " : ObjetGrid.grid_QML[11];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_3_4.text === "0"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_3_4.text === "2"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_3_4.text === "4"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_3_4.text === "8"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_3_4.text === "16"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_3_4.text === "32"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_3_4.text === "64"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_3_4.text === "128"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_3_4.text === "256"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_3_4.text === "512"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_3_4.text === "1024"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_3_4.text === "2048"
                            PropertyChanges {target: rect_3_4 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_3_4 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_4_1
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_4_1
                    text: (ObjetGrid.grid_QML[12] === '0') ? " " : ObjetGrid.grid_QML[12];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_4_1.text === "0"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_4_1.text === "2"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_4_1.text === "4"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_4_1.text === "8"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_4_1.text === "16"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_4_1.text === "32"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_4_1.text === "64"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_4_1.text === "128"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_4_1.text === "256"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_4_1.text === "512"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_4_1.text === "1024"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_4_1.text === "2048"
                            PropertyChanges {target: rect_4_1 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_4_1 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_4_2
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_4_2
                    text: (ObjetGrid.grid_QML[13] === '0') ? " " : ObjetGrid.grid_QML[13];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_4_2.text === "0"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_4_2.text === "2"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_4_2.text === "4"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_4_2.text === "8"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_4_2.text === "16"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_4_2.text === "32"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_4_2.text === "64"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_4_2.text === "128"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_4_2.text === "256"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_4_2.text === "512"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_4_2.text === "1024"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_4_2.text === "2048"
                            PropertyChanges {target: rect_4_2 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_4_2 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_4_3
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_4_3
                    text: (ObjetGrid.grid_QML[14] === '0') ? " " : ObjetGrid.grid_QML[14];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_4_3.text === "0"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_4_3.text === "2"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_4_3.text === "4"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_4_3.text === "8"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_4_3.text === "16"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_4_3.text === "32"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_4_3.text === "64"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_4_3.text === "128"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_4_3.text === "256"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_4_3.text === "512"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_4_3.text === "1024"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_4_3.text === "2048"
                            PropertyChanges {target: rect_4_3 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_4_3 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }

            Rectangle {
                id: rect_4_4
                x: 255
                y: 255
                width: 67
                height: 67
                color: "#cfcecc"
                radius: 3
                Text {
                    focus : true;
                    id: text_4_4
                    text: (ObjetGrid.grid_QML[15] === '0') ? " " : ObjetGrid.grid_QML[15];
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrid.font_QML
                    states:[
                        State {
                            name: "col_0";
                            when: text_4_4.text === "0"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[0]}
                        },
                        State {
                            name: "col_2";
                            when: text_4_4.text === "2"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[1]}
                        },
                        State {
                            name: "col_4";
                            when: text_4_4.text === "4"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[2]}
                        },
                        State {
                            name: "col_8";
                            when: text_4_4.text === "8"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[3]}
                        },
                        State {
                            name: "col_16";
                            when: text_4_4.text === "16"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[4]}
                        },
                        State {
                            name: "col_32";
                            when: text_4_4.text === "32"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[5]}
                        },
                        State {
                            name: "col_64";
                            when: text_4_4.text === "64"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[6]}
                        },
                        State {
                            name: "col_128";
                            when: text_4_4.text === "128"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[7]}
                        },
                        State {
                            name: "col_256";
                            when: text_4_4.text === "256"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[8]}
                        },
                        State {
                            name: "col_512";
                            when: text_4_4.text === "512"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[9]}
                        },
                        State {
                            name: "col_1024";
                            when: text_4_4.text === "1024"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[10]}
                        },
                        State {
                            name: "col_2048";
                            when: text_4_4.text === "2048"
                            PropertyChanges {target: rect_4_4 ; color:ObjetGrid.color_QML[11]}
                        }
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rect_4_4 ; duration: 30
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrid.up();
                            break;
                        case Qt.Key_Down:
                            ObjetGrid.down();
                            break;
                        case Qt.Key_Right:
                            ObjetGrid.right();
                            break;
                        case Qt.Key_Left:
                            ObjetGrid.left();
                            break;
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: rectLogo2048
        x: 172
        y: 14
        width: 125
        height: 150
        color: "#877c32"
        radius: 3
        border.width: 0

        Text {
            id: textLogo
            color: "#ffffff"
            text: qsTr("2048")
            anchors.fill: parent
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            focus: true
            style: Text.Sunken
            font.weight: Font.Bold
            font.family: "Tahoma"
        }
    }
    Rectangle {
        id: rectScore
        x: 12
        y: 14
        width: 150
        height: 90
        color: "#f5f4f2"
        radius: 5
        border.width: 0
        enabled: false
        transformOrigin: Item.Center

        Text {
            id: textScore
            width: 100
            height: 41
            color: "#121212"
            text: qsTr("Score")
            anchors.top: parent.top
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.underline: false
            font.bold: true
        }

        Text {
            id: textValue_S
            y: 38
            width: 100
            height: 42
            color: "#121212"
            text: ObjetGrid.score_QML
            anchors.bottom: parent.bottom
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            activeFocusOnTab: false
            focus: true
        }
    }
    Rectangle {
        id: rectBest
        x: 310
        y: 14
        width: 150
        height: 90
        color: "#f5f4f2"
        radius: 5
        enabled: false

        Text {
            id: textBest
            x: 18
            width: 100
            height: 41
            color: "#121212"
            text: qsTr("Best")
            anchors.top: parent.top
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
        }

        Text {
            id: textValue_B
            x: 8
            y: 38
            width: 100
            height: 42
            color: "#121212"
            text: ObjetGrid.best_QML
            anchors.bottom: parent.bottom
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            anchors.bottomMargin: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            focus: true
            activeFocusOnTab: false
        }
    }

    Rectangle {
        id: rectNew
        x: 12
        y: 116
        width: 150
        height: 48
        color: "#a1c8ff"
        radius: 3
        transformOrigin: Item.Center

        Text {
            id: textNew
            x: 56
            y: 22
            text: qsTr("NEW")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.italic: false
            font.family: "Arial"
            font.bold: true;
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
            id: mouseArea_New
            anchors.fill: parent
            onClicked: ObjetGrid.new_game();
            hoverEnabled: true

            onEntered: {
                rectNew.color="#035b69"
            }
            onExited: {
                rectNew.color = "#a1c8ff"
            }
        }
    }


    Rectangle {
        id: rectUndo
        x: 310
        y: 116
        width: 150
        height: 48
        color: "#a1c8ff"
        radius: 3

        Text {
            id: textUndo
            x: 56
            y: 22
            text: qsTr("UNDO")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.family: "Arial"
        }

        MouseArea {
            id: mouseArea_Undo
            visible: true
            anchors.fill: parent
            onClicked: ObjetGrid.undo();
            hoverEnabled: true
            onEntered: {
                rectUndo.color="#035b69"
            }
            onExited: {
                rectUndo.color = "#a1c8ff"
            }
        }
    }

    Rectangle {
        id: rectFont
        x: 12
        y: 250
        width: 55
        height: 253
        color: "#877C32"
        radius: 4
        visible: true
        border.width: 0

        Grid {
            id: grille_font
            width: 48
            height: 247
            visible : true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 3
            rows: 5

            Rectangle {
                id: rect_font_1
                width: 48
                height: 47
                color: "#ABC4AA"
                visible : true
                radius: 2
                border.width: 0

                Text {
                    id: text_font_1
                    text: qsTr("2048")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.styleName: "Regular"
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible  :true
                    focus : true
                    font.family: "Sofia pro"
                }

                MouseArea {
                    id: mouseArea_font_1
                    anchors.fill: parent
                    onClicked: {
                        ObjetGrid.setfont0()
                        rect_font_1.color="#ABB4A5"
                    }
                    hoverEnabled: true
                    onEntered: {
                        rect_font_1.color="#F3DEBA"
                    }
                    onExited: {
                        rect_font_1.color = "#ABC4AA"
                    }
                }
            }

            Rectangle {
                id: rect_font_2
                width: 48
                height: 47
                color: "#ABC4AA"
                visible : true
                radius: 2
                border.width: 0

                Text {
                    id: text_font_2
                    text: qsTr("2048")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Arial"
                }

                MouseArea {
                    id: mouseArea_font_2
                    anchors.fill: parent
                    onClicked: {
                        ObjetGrid.setfont1()
                        rect_font_2.color="#ABB4A5"
                    }
                    hoverEnabled: true
                    onEntered: {
                        rect_font_2.color="#F3DEBA"
                    }
                    onExited: {
                        rect_font_2.color = "#ABC4AA"
                    }
                }
            }

            Rectangle {
                id: rect_font_3
                width: 48
                height: 47
                color: "#ABC4AA"
                visible : true
                radius: 2
                border.width: 0

                Text {
                    id: text_font_3
                    text: qsTr("2048")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Verdana"
                }

                MouseArea {
                    id: mouseArea_font_3
                    anchors.fill: parent
                    onClicked: {
                        ObjetGrid.setfont2()
                        rect_font_3.color="#ABB4A5"
                    }
                    hoverEnabled: true
                    onEntered: {
                        rect_font_3.color="#F3DEBA"
                    }
                    onExited: {
                        rect_font_3.color = "#ABC4AA"
                    }
                }
            }
            Rectangle {
                id: rect_font_4
                width: 48
                height: 47
                color: "#ABC4AA"
                visible : true
                radius: 2
                border.width: 0

                Text {
                    id: text_font_4
                    text: qsTr("2048")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Monteserrat"
                }

                MouseArea {
                    id: mouseArea_font_4
                    anchors.fill: parent
                    onClicked: {
                        ObjetGrid.setfont3()
                        rect_font_4.color="#ABB4A5"
                    }
                    hoverEnabled: true
                    onEntered: {
                        rect_font_4.color="#F3DEBA"
                    }
                    onExited: {
                        rect_font_4.color = "#ABC4AA"
                    }
                }
            }

            Rectangle {
                id: rect_font_5
                width: 48
                height: 47
                color: "#ABC4AA"
                visible : true
                radius: 2
                border.width: 0

                Text {
                    id: text_font_5
                    text: qsTr("2048")
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Courier"
                }

                MouseArea {
                    id: mouseArea_font_5
                    anchors.fill: parent
                    onClicked: {
                        ObjetGrid.setfont4()
                        rect_font_5.color="#ABB4A5"
                    }
                    hoverEnabled: true
                    onEntered: {
                        rect_font_5.color="#F3DEBA"
                    }
                    onExited: {
                        rect_font_5.color = "#ABC4AA"
                    }
                }
            }
        }
    }
    Rectangle {
            id: rectColor
            x: 400
            y: 250
            width: 55
            height: 253
            color: "#877C32"
            radius: 4
            visible: true
            border.width: 0

            Grid {
                id: grille_color
                width: 48
                height: 247
                visible : true
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 3
                rows: 5

                Rectangle {
                    id: rect_color_1
                    width: 48
                    height: 47
                    color: "#ABC4AA"
                    visible : true
                    radius: 2
                    border.width: 0
                    Text {
                        id: text_color_1
                        anchors.fill: parent
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        text : qsTr("Original")
                    }

                    MouseArea {
                        id: mouseArea_color_1
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            ObjetGrid.classicColors()
                        }
                        onPressed:{
                            rect_color_1.border.color = "#ffffff"
                        }
                        onReleased: {
                            rect_color_1.border.color = "#000000"
                        }
                        onEntered: {
                            rect_color_1.border.width = 2
                        }
                        onExited: {
                            rect_color_1.border.width = 0
                        }
                    }
                }

                Rectangle {
                    id: rect_color_2
                    width: 48
                    height: 47
                    color: "#ABC4AA"
                    visible : true
                    radius: 2
                    border.width: 0

                    Text {
                        id: text_color_2
                        text: qsTr("Rainbow")
                        anchors.fill: parent
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        id: mouseArea_color_2
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            ObjetGrid.customColors()
                        }
                        onPressed:{
                            rect_color_2.border.color = "#ffffff"
                        }
                        onReleased: {
                            rect_color_2.border.color = "#000000"
                        }
                        onEntered: {
                            rect_color_2.border.width = 2
                        }
                        onExited: {
                            rect_color_2.border.width = 0
                        }
                    }
                }

                Rectangle {
                    id: rect_color_3
                    width: 48
                    height: 47
                    color: "#ABC4AA"
                    visible : true
                    radius: 2
                    border.width: 0

                    Text {
                        id: text_color_3
                        text: qsTr("Red")
                        anchors.fill: parent
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        id: mouseArea_color_3
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            ObjetGrid.primaryColors()
                        }
                        onPressed:{
                            rect_color_3.border.color = "#ffffff"
                        }
                        onReleased: {
                            rect_color_3.border.color = "#000000"
                        }
                        onEntered: {
                            rect_color_3.border.width = 2
                        }
                        onExited: {
                            rect_color_3.border.width = 0
                        }
                    }
                }
                Rectangle {
                    id: rect_color_4
                    width: 48
                    height: 47
                    color: "#ABC4AA"
                    visible : true
                    radius: 2
                    border.width: 0

                    Text {
                        id: text_color_4
                        text: qsTr("Pale")
                        anchors.fill: parent
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        id: mouseArea_color_4
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            ObjetGrid.bwColors()
                        }
                        onPressed:{
                            rect_color_4.border.color = "#ffffff"
                        }
                        onReleased: {
                            rect_color_4.border.color = "#000000"
                        }
                        onEntered: {
                            rect_color_4.border.width = 2
                        }
                        onExited: {
                            rect_color_4.border.width = 0
                        }
                    }
                }

                Rectangle {
                    id: rect_color_5
                    width: 48
                    height: 47
                    color: "#ABC4AA"
                    visible : true
                    radius: 2
                    border.width: 0

                    Text {
                        id: text_color_5
                        text: qsTr("Heat")
                        anchors.fill: parent
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    MouseArea {
                        id: mouseArea_color_5
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            ObjetGrid.rainbowColors()
                        }
                        onPressed:{
                            rect_color_5.border.color = "#ffffff"
                        }
                        onReleased: {
                            rect_color_5.border.color = "#000000"
                        }
                        onEntered: {
                            rect_color_5.border.width = 2
                        }
                        onExited: {
                            rect_color_5.border.width = 0
                        }
                    }
                }
            }
    }

    Text {
        id: text_font
        x: 15
        y: 210
        color: "#fafcfc"
        text: qsTr("Fonts")
        font.pixelSize: 20
        font.styleName: "Bold"
        font.family: "Comic Sans MS"
    }

    Text {
        id: text_Color
        x: 400
        y: 210
        color: "#fafcfc"
        text: qsTr("Colors")
        font.pixelSize: 20
        font.styleName: "Bold"
        font.family: "Comic Sans MS"
    }

}




