import React from "react";
import { StyleSheet, View, Text } from "react-native";
import { DeckSwiper } from "./deckSwiper";

const cards = [
  {
    text: "Card One",
    name: "One"
  },
  {
    text: "Card two",
    name: "two"
  }
];

export default class App extends React.Component {
  render() {
    return (
      <View>
        <View>
          <DeckSwiper
            dataSource={cards}
            renderItem={item => (
              <View style={styles.card}>
                <Text style={styles.text}> {item.text} </Text>
              </View>
            )}
          />
        </View>
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
