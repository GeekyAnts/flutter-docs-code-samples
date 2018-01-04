import React, { Component } from "react";
import { AppRegistry, View, Button } from "react-native";

export default class FlexDirectionBasics extends Component {
  constructor(props) {
    super(props);
    this.state = { justContent: "center", alItems: "flex-start" };
  }

  render() {
    return (
      <View style={{ flex: 1 }}>
        <View style={{ paddingTop: 50 }}>
          <Button
            title="Show Space in between"
            onPress={() => {
              if (this.state.justContent == "center") {
                this.setState({ justContent: "space-between" });
              } else {
                this.setState({ justContent: "center" });
              }
            }}
          />
          <Button
            title="Show Center"
            onPress={() => {
              if (this.state.alItems == "flex-start") {
                this.setState({ alItems: "center" });
              } else {
                this.setState({ alItems: "flex-start" });
              }
            }}
          />
        </View>
        <View
          style={{
            flex: 1,
            flexDirection: "column",
            justifyContent: this.state.justContent,
            alignItems: this.state.alItems
          }}
        >
          <View
            style={{ width: 100, height: 100, backgroundColor: "powderblue" }}
          />
          <View
            style={{ width: 100, height: 100, backgroundColor: "skyblue" }}
          />
          <View
            style={{ width: 100, height: 100, backgroundColor: "steelblue" }}
          />
        </View>
      </View>
    );
  }
}
