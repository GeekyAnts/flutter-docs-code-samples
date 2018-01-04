import React from "react";
import { StyleSheet, Text, View, Button, FlatList } from "react-native";

class CustomCard extends React.Component {
  render() {
    return (
      <View style={styles.card}>
        <Text style={styles.text}> Card {this.props.index} </Text>
        <Button
          style={styles.button}
          title="Press"
          onPress={() => this.props.onPress(this.props.index)}
        />
      </View>
    );
  }
}
export default class App extends React.Component {
  onPress = index => {
    console.log("Card ", index);
  };
  render() {
    return (
      <View style={styles.container}>
        <FlatList
          data={[{ key: 0 }, { key: 1 }, { key: 2 }, { key: 3 }, { key: 4 }]}
          renderItem={({ item }) => (
            <CustomCard onPress={this.onPress} index={item.key} />
          )}
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
    marginTop: 30
    // justifyContent: "space-around"
  },
  card: {
    flex: 1,
    minHeight: 80,
    minWidth: 350,
    flexDirection: "column",
    marginTop: 10,
    marginBottom: 10,
    backgroundColor: "#E0E0E0"
  },
  text: {
    flex: 1,
    fontSize: 24,
    paddingTop: 20,
    alignSelf: "center",
    justifyContent: "center"
  },
  button: {
    flex: 1,
    flexDirection: "row",
    justifyContent: "flex-end"
  }
});
