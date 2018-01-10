import React from "react";
import { StyleSheet, Text, View, TouchableOpacity } from "react-native";

export default class App extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity
          onPress={() => {
            console.log("Press");
          }}
          onLongPress={() => {
            console.log("Long Press");
          }}
        >
          <Text>Tap or Long Press</Text>
        </TouchableOpacity>
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
