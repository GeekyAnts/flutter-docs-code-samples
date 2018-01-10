import React from "react";
import { StyleSheet, Text, View, Button } from "react-native";
import { StackNavigator } from "react-navigation";

export default class TabNavScreen extends React.Component {
  static navigationOptions = { tabBarLabel: "Tab Screen", swipeEnabled: true };

  render() {
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <Text>You just used Tab navigator!</Text>
      </View>
    );
  }
}
