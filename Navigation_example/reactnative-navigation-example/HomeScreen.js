import React from "react";
import { StyleSheet, Text, View, Button } from "react-native";
import { StackNavigator } from "react-navigation";

export default class HomeScreen extends React.Component {
  constructor(props) {
    super(props);
  }

  static navigationOptions = ({ navigation }) => ({
    title: "Home",
    headerLeft: (
      <Button
        onPress={() => navigation.navigate("DrawerOpen")}
        title="Open Drawer"
      />
    ),
    tabBarLabel: "Home",
    tabBarVisible: true,
    swipeEnabled: true
  });
  render() {
    const { navigate } = this.props.navigation;
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <Button
          onPress={() => navigate("stackScreen")}
          title="Click to use stack navigator"
        />
      </View>
    );
  }
}
