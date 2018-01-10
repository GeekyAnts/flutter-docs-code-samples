import React from "react";
import { StyleSheet, Text, TextInput, View, Alert, Button } from "react-native";

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: ""
    };
  }
  validate = () => {
    var emailError = false;
    var passwordError = false;
    if (!this.state.email.includes("@")) {
      emailError = true;
      Alert.alert("Alert", "Not a valid email.", [
        { text: "OK", onPress: () => {} }
      ]);
      return;
    }
    if (this.state.password.length < 6) {
      passwordError = true;
      Alert.alert("Alert", "Not a valid password.", [
        { text: "OK", onPress: () => {} }
      ]);
      return;
    }
    if (!(emailError || passwordError)) {
      Alert.alert(
        "Alert",
        `Email: ${this.state.email}, Password: ${this.state.password}`,
        [{ text: "OK", onPress: () => {} }]
      );
    }
  };
  render() {
    return (
      <View style={styles.container}>
        <TextInput
          style={{
            height: 60,
            width: 200,
            paddingTop: 20,
            paddingBottom: 5
          }}
          placeholder="Enter you email"
          onChangeText={email => this.setState({ email })}
        />
        <TextInput
          style={{
            height: 60,
            width: 200,
            paddingTop: 20,
            paddingBottom: 5
          }}
          secureTextEntry
          placeholder="Enter you Password"
          onChangeText={password => this.setState({ password })}
        />
        <Button title="Submit" onPress={this.validate} />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    paddingTop: 50
  }
});
