import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';

import { RnContextMenuViewProps } from './RnContextMenu.types';

const NativeView: React.ComponentType<RnContextMenuViewProps> =
  requireNativeViewManager('RnContextMenu');

export default function RnContextMenuView(props: RnContextMenuViewProps) {
  return <NativeView {...props} />;
}
