import { SafeAreaView, Text, View } from "react-native";
import { RnContextMenu } from "rn-context-menu";

export default function App() {
  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: "purple" }}>
      <RnContextMenu title="Hello World">
        <View
          style={{
            alignSelf: "center",
            justifyContent: "center",
            alignItems: "center",
          }}
        >
          <Text style={{ backgroundColor: "#fff" }}>teste1</Text>
        </View>
      </RnContextMenu>
    </SafeAreaView>
  );
}
