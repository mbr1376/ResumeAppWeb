import QtQuick 6.2
import QtQuick.Studio.Effects 1.0

Item {
    width: 600
    height: 400
Rectangle {
    id: back
    anchors.fill: parent
    color: "#99121212"
    border.width: 2
    border.color: "#121212"
    radius: 10
    layer.effect: ShaderEffectSource {
        anchors.fill: parent

        FastBlurEffect {
            anchors.fill: parent
            source: back
            radius: 32
        }
    }
}

}
