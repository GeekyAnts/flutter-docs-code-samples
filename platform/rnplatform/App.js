import React from "react";
import { StyleSheet, Platform, Text, View } from "react-native";

export default class App extends React.Component {
  getPlatform = () => {
    if (Platform.OS === "ios") {
      return "iOS";
    } else if (Platform.OS === "android") {
      return "android";
    } else {
      return "not recognised";
    }
  };
  render() {
    return (
      <View style={styles.container}>
        <Text>Platform is {this.getPlatform()}</Text>
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
