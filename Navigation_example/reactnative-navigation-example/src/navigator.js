import React from "react";
import { StyleSheet, Text, View, Button } from "react-native";
import {
  StackNavigator,
  DrawerNavigator,
  TabNavigator
} from "react-navigation";
import HomeScreen from "./HomeScreen";
import StackScreen from "./StackScreen";
import DrawerScreen from "./DrawerScreen";
import TabNavScreen from "./TabNavScreen";

const TabNav = TabNavigator(
  { Home: { screen: HomeScreen }, Notifications: { screen: TabNavScreen } },
  {
    tabBarPosition: "bottom",
    animationEnabled: true,
    tabBarOptions: {
      activeTintColor: "#e91e63",
      labelStyle: {
        fontSize: 20
      }
    }
  }
);

const SimpleApp = StackNavigator({
  Home: { screen: TabNav },
  stackScreen: { screen: StackScreen }
});

export default (DrawerNav = DrawerNavigator({
  Home: {
    screen: SimpleApp
  },
  Screen2: {
    screen: DrawerScreen
  }
}));
