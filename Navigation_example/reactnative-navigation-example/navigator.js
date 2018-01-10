import React from "react";
import { StyleSheet, Text, View, Button } from "react-native";
import {
  StackNavigator,
  DrawerNavigator,
  TabNavigator
} from "react-navigation";
import HomeScreen from "./HomeScreen";
import StackScreen from "./stackScreen";
import drawerScreen from "./drawerScreen";
import tabNavScreen from "./tabNavScreen";

const TAbNav = TabNavigator(
  { Home: { screen: HomeScreen }, Notifications: { screen: tabNavScreen } },
  {
    tabBarPosition: "bottom",
    animationEnabled: true,
    tabBarOptions: {
      activeTintColor: "#e91e63",
      style: {
        flex: 1,
        height: 100
      },
      labelStyle: {
        fontSize: 20
      }
    }
  }
);

const SimpleApp = StackNavigator({
  Home: { screen: TAbNav },
  stackScreen: { screen: StackScreen }
});

export default (DrawerNav = DrawerNavigator({
  Home: {
    screen: SimpleApp
  },
  Screen2: {
    screen: drawerScreen
  }
}));
