import React from "react";
import { StyleSheet, Text, View, Button } from "react-native";

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { isLight: true };
  }
  toggleTheme = () => {
    this.setState({ isLight: !this.state.isLight });
  };
  render() {
    return (
      <View
        style={
          this.state.isLight ? styles.lightContainer : styles.darkContainer
        }
      >
        <Text style={{ fontSize: 32, color: "cyan", fontWeight: "600" }}>
          Sample text
        </Text>
        <Button
          title={this.state.isLight ? "Dark Theme" : "Light Theme"}
          onPress={this.toggleTheme}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  lightContainer: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center"
  },
  darkContainer: {
    flex: 1,
    backgroundColor: "#323232",
    alignItems: "center",
    justifyContent: "center"
  }
});
