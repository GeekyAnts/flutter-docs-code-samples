import React, { Component } from "react";
import { AppRegistry, Text, View, StatusBar, Button } from "react-native";

export default class BlinkApp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      buttonText: "blink",
      ifBlink: false,
      showText: true,
      text: "I love blinking"
    };
    this.toggleBlinkState = this.toggleBlinkState.bind(this);
    var handle;
  }
  toggleBlinkState() {
    if (this.state.buttonText == "blink") {
      handle = setInterval(() => {
        this.setState(previousState => {
          return { showText: !previousState.showText };
        });
      }, 1000);
      this.setState({
        buttonText: "Stop blinking"
      });
    } else {
      clearInterval(handle);
      this.setState({ buttonText: "blink", showText: true });
    }
  }

  render() {
    let display = this.state.showText ? this.state.text : " ";
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <StatusBar hidden={true} />
        <Text>{display} </Text>
        <Button onPress={this.toggleBlinkState} title={this.state.buttonText} />
      </View>
    );
  }
}
