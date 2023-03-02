import { StyleSheet, Text, View } from 'react-native';

import * as RnContextMenu from 'rn-context-menu';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>{RnContextMenu.hello()}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
