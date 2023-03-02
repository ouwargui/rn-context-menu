import { requireNativeViewManager } from "expo-modules-core";
import * as React from "react";
import { ViewProps } from "react-native";

export type OnPressEvent = {
  identifier: number;
};

export type Props = {
  title: string;
  onPressActionItem: (event: { nativeEvent: OnPressEvent }) => void;
} & ViewProps;

const NativeView: React.ComponentType<Props> =
  requireNativeViewManager("RnContextMenuView");

export default function RnContextMenuView(props: Props) {
  return <NativeView {...props} />;
}
