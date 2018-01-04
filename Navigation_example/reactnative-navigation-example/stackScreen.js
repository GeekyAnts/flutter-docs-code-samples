import React from "react";
import { StyleSheet, Text, View, Button, StackNavigator } from "react-native";

export default class StackScreen extends React.Component {
  static navigationOptions = {
    title: "Stack Navigation"
  };
  render() {
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <Text>You just used stack navigator!</Text>
      </View>
    );
  }
}
