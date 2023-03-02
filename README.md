# rn-context-menu

A context menu view wrapper for React Native

# Demo
https://user-images.githubusercontent.com/44242141/222493265-c7a8550e-959a-4ef4-96f4-22a4f2fc77ab.mp4

# Installation

### Add the package to your dependencies
```
npm install rn-context-menu
yarn add rn-context-menu
```
### Configure for iOS
Run `npx pod-install` after installing the npm package.


# API documentation

## Props
|Name|Required|Type|
|----|--------|----|
|onItemPress|No |(event: {nativeEvent: OnPressEvent}) => void|
|options    |yes|RnContextMenu|
|children   |yes|ReactNode|

### OnPressEvent
|Name|Required|Type|
|----|--------|----|
|identifier|yes|string|

### RnContextMenu
|Name|Required|Type|
|----|--------|----|
|title  |yes|string|
|menus  |no |RnContextMenuProps[]|
|actions|yes|RnContextMenuAction[]|

### RnContextMenuProps
|Name|Required|Type|
|----|--------|----|
|title  |yes |string|
|image  |no  |SF Symbol (string)|
|options|no  |"displayInline" / "destructive" / "singleSelection"|
|children|yes|RnContextMenuAction[]|

### RnContextMenuAction
|Name|Required|Type|
|----|--------|----|
|title     |yes|string|
|image     |no |SF Symbol (string)|
|identifier|yes|string|
|attribute |no |"destructive" / "disabled" / "hidden"|

# Contributing

Contributions are very welcome!
