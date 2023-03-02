import ExpoModulesCore

internal struct RnContextMenuOptions: Record {
  @Field
  var title: String?

  @Field
  var menus: [RnContextMenuProps]

  @Field
  var actions: [RnContextMenuAction]
}

internal struct RnContextMenuProps: Record {
  @Field
  var title: String?

  @Field
  var image: String?

  @Field
  var options: RnContextMenuMenuOptions?

  @Field
  var children: [RnContextMenuAction]
}

internal struct RnContextMenuAction: Record {
  @Field
  var title: String?

  @Field
  var image: String?

  @Field
  var identifier: String?

  @Field
  var attribute: RnContextMenuActionAttributes?
}

internal enum RnContextMenuActionAttributes: String, Enumerable {
  case destructive
  case disabled
  case hidden

  func toUIMenuElementAttributes() -> UIMenuElement.Attributes {
    switch self {
    case .destructive:
      return UIMenuElement.Attributes.destructive
    case .disabled:
      return UIMenuElement.Attributes.disabled
    case .hidden:
      return UIMenuElement.Attributes.hidden
    }
  }
}

internal enum RnContextMenuMenuOptions: String, Enumerable {
  case destructive
  case displayInline
  case singleSelection

  func toUIMenuOptions() -> UIMenu.Options {
    switch self {
    case .destructive:
      return UIMenu.Options.destructive
    case .singleSelection:
      if #available(iOS 15.0, *) {
        return UIMenu.Options.singleSelection
      } else {
        return []
      }
    case .displayInline:
      return UIMenu.Options.displayInline
    }
  }
}
