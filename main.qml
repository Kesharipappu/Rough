import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

Window {
    id: mainWindow // Give the window a Component id

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    TextField {
        id: firstName
        placeholderText: "Enter First Name"
        validator: RegExpValidator {
            regExp: /^.+$/
            // The regular expression ensures that the name is not empty (at least one character is required)
        }

        property bool valid: false // Custom property to track validity
    }

    TextField {
        id: lastName
        y: 50
        placeholderText: "Enter Last Name"
        validator: RegExpValidator {
            regExp: /^.+$/
            // The regular expression ensures that the name is not empty (at least one character is required)
        }

        property bool valid: false // Custom property to track validity

        onFocusChanged: {
            if (!activeFocus && text.trim() === "" && lastName.valid) {
                var alert = Qt.createQmlObject('import QtQuick.Dialogs 1.3; MessageDialog {}', parent);
                alert.title = "Alert";
                alert.text = "This field is necessary!";
                alert.standardButtons = StandardButton.Ok;
                alert.accepted.connect(function () {
                    lastName.forceActiveFocus(); // Focus on the lastName field again
                });
                alert.open();
            }
        }

        onTextChanged: {
            valid = true;
        }
    }

    Button {
        text: "Save"
        y: 110
        width: 120
        height: 50

        onClicked: {
            firstName.valid = firstName.validate();
            lastName.valid = lastName.validate();

            if (firstName.valid && lastName.valid) {
                var messageDialog = Qt.createQmlObject('import QtQuick.Dialogs 1.3; MessageDialog {}', parent);
                messageDialog.text = "Data Saved Successfully !!!";
                messageDialog.standardButtons = StandardButton.Ok;
                messageDialog.accepted.connect(function() {
                    // Close the window when "Ok" button is clicked
                    mainWindow.close();
                });
                messageDialog.open();
            } else {
                console.log("Invalid data!"); // Do something if the data is invalid (you can show an error message)
            }
        }
    }
}





//import QtQuick 2.15
//import QtQuick.Window 2.15
//import QtQuick.Controls 2.15
//import QtQuick.Dialogs 1.3

//Window {
//    width: 640
//    height: 480
//    visible: true
//    title: qsTr("Hello World")

//    Button {
//        text: "Save"
//        width: 120
//        height: 50

//        onClicked: {
//            var messageDialog = Qt.createQmlObject('import QtQuick.Dialogs 1.3; MessageDialog {}', parent);
//            messageDialog.text = "Data Saved Successfully !!!";
//            messageDialog.standardButtons = StandardButton.Ok;
//            messageDialog.open();

//        }
//    }
//}

//import QtQuick 2.15
//import QtQuick.Window 2.15
//import QtQuick.Controls 2.15
//import QtQuick.Dialogs 1.3

//Window {
//    id: mainWindow // Give the window a Component id

//    width: 640
//    height: 480
//    visible: true
//    title: qsTr("Hello World")

//    TextField{
//        id: firstName
//        placeholderText: "Enter First Name"
//        validator: RegExpValidator {
//                    regExp: /^.+$/
//                    // The regular expression ensures that the name is not empty (at least one character is required)
//                }
//    }

//    TextField{
//        id: lastName
//        y: 50
//        placeholderText: "Enter Last Name"
//        validator: RegExpValidator {
//                    regExp: /^.+$/
//                    // The regular expression ensures that the name is not empty (at least one character is required)
//                }
//    }

//    Button {
//        text: "Save"
//        y: 110
//        width: 120
//        height: 50

//        onClicked: {
//            var messageDialog = Qt.createQmlObject('import QtQuick.Dialogs 1.3; MessageDialog {}', parent);
//            messageDialog.text = "Data Saved Successfully !!!";
//            messageDialog.standardButtons = StandardButton.Ok;
//            messageDialog.accepted.connect(function() {
//                // Close the window when "Ok" button is clicked
//                mainWindow.close();
//            });
//            messageDialog.open();
//        }
//    }
//}




