import { NativeModulesProxy, EventEmitter, Subscription } from 'expo-modules-core';

// Import the native module. On web, it will be resolved to RnContextMenu.web.ts
// and on native platforms to RnContextMenu.ts
import RnContextMenuModule from './RnContextMenuModule';
import RnContextMenuView from './RnContextMenuView';
import { ChangeEventPayload, RnContextMenuViewProps } from './RnContextMenu.types';

// Get the native constant value.
export const PI = RnContextMenuModule.PI;

export function hello(): string {
  return RnContextMenuModule.hello();
}

export async function setValueAsync(value: string) {
  return await RnContextMenuModule.setValueAsync(value);
}

const emitter = new EventEmitter(RnContextMenuModule ?? NativeModulesProxy.RnContextMenu);

export function addChangeListener(listener: (event: ChangeEventPayload) => void): Subscription {
  return emitter.addListener<ChangeEventPayload>('onChange', listener);
}

export { RnContextMenuView, RnContextMenuViewProps, ChangeEventPayload };
