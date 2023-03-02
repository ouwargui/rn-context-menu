import { useState } from "react";
import { SafeAreaView, Text, View } from "react-native";
import { RnContextMenu } from "rn-context-menu";

export default function App() {
  const [identifier, setIdentifier] = useState<string | undefined>(undefined);

  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: "purple" }}>
      <RnContextMenu
        onItemPress={(event) => {
          setIdentifier(event.nativeEvent.identifier);
        }}
        options={{
          title: "Text Context Menu",
          menus: [
            {
              title: "Options",
              image: "gear.circle.fill",
              options: "displayInline",
              children: [
                {
                  title: "Option 1",
                  identifier: "opt1",
                },
                {
                  title: "Option 2",
                  identifier: "opt2",
                },
                {
                  title: "Option 3",
                  identifier: "opt3",
                  attribute: "destructive",
                  image: "x.circle.fill",
                },
              ],
            },
          ],
          actions: [
            {
              title: "Favorite",
              identifier: "fav",
              image: "star.fill",
            },
            {
              title: "Remove",
              identifier: "del",
              image: "x.circle.fill",
              attribute: "destructive",
            },
          ],
        }}
      >
        <View
          style={{
            alignSelf: "center",
            justifyContent: "center",
            alignItems: "center",
            backgroundColor: "pink",
            padding: 50,
          }}
        >
          <Text style={{ backgroundColor: "#fff" }}>teste1</Text>
        </View>
      </RnContextMenu>
      <Text
        style={{
          alignSelf: "center",
          marginTop: 200,
          color: "white",
          fontSize: 28,
        }}
      >{`button identifier: ${identifier}`}</Text>
    </SafeAreaView>
  );
}
