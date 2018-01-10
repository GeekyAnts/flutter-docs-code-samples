import React from "react";
import { StyleSheet, Text, View, Button } from "react-native";

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      _ipAddress: "Unknown"
    };
    this._getIPAddressUsingAwait = this._getIPAddressUsingAwait.bind(this);
  }
  _getIPAddressUsingPromise = () => {
    return fetch("https://httpbin.org/ip")
      .then(response => response.json())
      .then(responseJson => {
        this.setState({ _ipAddress: responseJson.origin });
      })
      .catch(error => {
        console.error(error);
      });
  };
  async _getIPAddressUsingAwait() {
    const response = await fetch("https://httpbin.org/ip");
    const json = await response.json();
    const data = await json.origin;
    this.setState({ _ipAddress: data });
  }
  render() {
    return (
      <View style={styles.container}>
        <Text>Your current IP address is:</Text>
        <Text>{this.state._ipAddress}</Text>
        <Button
          title="Get IP Address"
          onPress={this._getIPAddressUsingAwait.bind(this)}
        />
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
