import React from "react";
import { StyleSheet, Text, View, Button } from "react-native";
import { StackNavigator } from "react-navigation";

export default class DrawerScreen extends React.Component {
  static navigationOptions = {
    drawerLabel: "Screen2"
  };

  render() {
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <Text>You just used Drawer navigator!</Text>
        <Button
          onPress={() => this.props.navigation.goBack()}
          title="Go back home"
        />
      </View>
    );
  }
}
