import { requireNativeViewManager } from "expo-modules-core";
import * as React from "react";
import { ViewProps } from "react-native";

export type Props = {
  title: string;
} & ViewProps;

const NativeView: React.ComponentType<Props> =
  requireNativeViewManager("RnContextMenuView");

export default function RnContextMenuView(props: Props) {
  return <NativeView {...props} />;
}
