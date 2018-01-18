import React, { Component } from "react";
import { StyleSheet, Text, View, PanResponder, Alert } from "react-native";

const getDirection = ({ moveX, moveY, dx, dy }) => {
  const swipedHorizontal = dx !== 0;
  const swipedVertical = dy !== 0;
  if (swipedHorizontal)
    Alert.alert("Alert", "Swiped horizontally", { cancelable: false });
  if (swipedVertical)
    Alert.alert("Alert", "Swiped vertically", { cancelable: false });
};

export default class App extends Component {
  componentWillMount() {
    this._panResponder = PanResponder.create({
      onMoveShouldSetPanResponder: (event, gestureState) =>
        !!getDirection(gestureState),
      onPanResponderMove: (event, gestureState) => true,
      onPanResponderRelease: (event, gestureState) => {
        const drag = getDirection(gestureState);
      },
      onPanResponderTerminationRequest: (event, gestureState) => true
    });
  }

  render() {
    return (
      <View style={styles.container} {...this._panResponder.panHandlers}>
        <View style={styles.center}>
          <Text>Swipe Horizontally or Vertically</Text>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1
  },
  center: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center"
  }
});
