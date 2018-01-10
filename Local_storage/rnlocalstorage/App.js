import React from "react";
import { StyleSheet, Text, View, Button, AsyncStorage } from "react-native";

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { counter: 0 };
    this.incrementCounter = this.incrementCounter.bind(this);
  }
  componentDidMount() {
    AsyncStorage.getItem("counterkey").then(value => {
      if (value != null) {
        this.setState({ counter: value });
      }
    });
  }
  async incrementCounter() {
    await AsyncStorage.setItem(
      "counterkey",
      JSON.stringify(++this.state.counter)
    );
    this.setState({ counter: this.state.counter });
  }
  render() {
    return (
      <View style={styles.container}>
        <Text>You have clicked this many times:</Text>
        <Text>{this.state.counter}</Text>
        <Button onPress={this.incrementCounter} title="Increment" />
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
