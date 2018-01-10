import React from "react";
import { StyleSheet, View } from "react-native";
import Canvas from "react-native-canvas";

export default class App extends React.Component {
  handleCanvas = canvas => {
    const ctx = canvas.getContext("2d");
    ctx.fillStyle = "skyblue";
    ctx.beginPath();
    ctx.arc(75, 75, 50, 0, 2 * Math.PI);
    ctx.fillRect(150, 100, 300, 300);
    ctx.stroke();
  };
  render() {
    return (
      <View style={styles.container}>
        <Canvas ref={this.handleCanvas} />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center"
  }
});
