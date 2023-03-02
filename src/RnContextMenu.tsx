import { requireNativeViewManager } from "expo-modules-core";
import * as React from "react";

export type OnPressEvent = {
  identifier: string;
};

export type RnContextMenuAction = {
  title: string;
  image?: string;
  identifier: string;
  attribute?: "destructive" | "disabled" | "hidden";
};

export type RnContextMenuProps = {
  title: string;
  image?: string;
  options?: "displayInline" | "destructive" | "singleSelection";
  children: RnContextMenuAction[];
};

export type RnContextMenu = {
  title: string;
  menus?: RnContextMenuProps[];
  actions: RnContextMenuAction[];
};

export type Props = {
  onItemPress?: (event: { nativeEvent: OnPressEvent }) => void;
  options: RnContextMenu;
  children: React.ReactNode;
};

const NativeView: React.ComponentType<Props> =
  requireNativeViewManager("RnContextMenuView");

export default function RnContextMenuView(props: Props) {
  return <NativeView {...props} />;
}
