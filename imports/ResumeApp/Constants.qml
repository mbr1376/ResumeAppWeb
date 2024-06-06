pragma Singleton
import QtQuick 6.2
import QtQuick.Studio.Application

QtObject {
    readonly property int width: 1920
    readonly property int height: 1080

    property string relativeFontDirectory: "fonts"


    /* Edit this comment to add your custom font */
    readonly property FontLoader robotoSlab: FontLoader{ source: "qrc:/qt/qml/content/fonts/RobotoSlab-Light.ttf"}
    readonly property FontLoader robotoSlab_bold: FontLoader{ source:  "qrc:/qt/qml/content/fonts/RobotoSlab-ExtraBold.ttf"}

    readonly property font font: Qt.font({
                                             family: robotoSlab.name,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font boldFont: Qt.font({
                                                  family: robotoSlab_bold.name,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })

    readonly property color backgroundColor: "#121212"
    readonly property color fgColor: "#FFFFFF"
    readonly property color primery: "#BB86FC"
    readonly property color secondary: "#03DAC6"


    property StudioApplication application: StudioApplication {
        fontPath: Qt.resolvedUrl("../../content/" + relativeFontDirectory)
    }
}
