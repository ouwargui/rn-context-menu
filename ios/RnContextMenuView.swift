import ExpoModulesCore

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class RnContextMenuView: ExpoView {
  var contextMenuOptions: RnContextMenuOptions?
  let onItemPress = EventDispatcher()

  required init(appContext: AppContext? = nil) {
    super.init(appContext: appContext)
    clipsToBounds = true
  }

  override func insertReactSubview(_ subview: UIView!, at atIndex: Int) {
    if let reactSubviews = reactSubviews() {
      if reactSubviews.count == 1 {
        RCTMakeAndLogError("RNContextMenu can't have more than one child component", nil, nil)
        return
      }
    }
    super.insertReactSubview(subview, at: atIndex)
  }

  override func didUpdateReactSubviews() {
    super.didUpdateReactSubviews()
    let subview = subviews[0]
    let interaction = UIContextMenuInteraction(delegate: self)
    subview.addInteraction(interaction)
  }
}

extension RnContextMenuView: UIContextMenuInteractionDelegate {
  func contextMenuInteraction(
    _ interaction: UIContextMenuInteraction,
    configurationForMenuAtLocation location: CGPoint)
    -> UIContextMenuConfiguration?
  {
    return UIContextMenuConfiguration(
      identifier: nil,
      previewProvider: nil,
      actionProvider: { _ in
        let action = self.makeActions()
        let menu = self.makeMenus()
        var children: [UIMenuElement] = []
        children.append(contentsOf: menu)
        children.append(contentsOf: action)
        return UIMenu(title: self.contextMenuOptions?.title ?? "", children: children)
      })
  }

  func actionFactory(title: String?, image: String?, identifier: String?, attribute: UIMenuElement.Attributes?) -> UIAction {
    let title = title ?? "No Title"
    let image = image ?? ""
    let identifier = identifier ?? ""
    if let attribute = attribute {
      return UIAction(
        title: title,
        image: UIImage(systemName: image),
        identifier: UIAction.Identifier(rawValue: identifier),
        attributes: attribute) { action in
          self.onItemPress([
            "identifier": action.identifier.rawValue
          ])
        }
    }

    return UIAction(
      title: title,
      image: UIImage(systemName: image),
      identifier: UIAction.Identifier(rawValue: identifier)) { action in
        self.onItemPress([
          "identifier": action.identifier.rawValue
        ])
      }
  }

  func makeActions() -> [UIAction] {
    guard let contextMenuOptions = contextMenuOptions else { return [] }

    let actions: [UIAction] = contextMenuOptions.actions.map { menuAction in
      actionFactory(
        title: menuAction.title,
        image: menuAction.image,
        identifier: menuAction.identifier,
        attribute: menuAction.attribute?.toUIMenuElementAttributes())
    }

    return actions
  }

  func menuFactory(title: String?, image: String?, options: UIMenu.Options?, children: [UIAction]) -> UIMenu {
    let title = title ?? "No Title"
    let image = image ?? ""
    let options = options ?? []

    return UIMenu(
      title: title,
      image: UIImage(systemName: image),
      options: options,
      children: children)
  }

  func makeMenus() -> [UIMenu] {
    guard let contextMenuOptions = contextMenuOptions else { return [] }

    let menus: [UIMenu] = contextMenuOptions.menus.map { menu in
      let actions = menu.children.map { action in
        actionFactory(
          title: action.title,
          image: action.image,
          identifier: action.identifier,
          attribute: action.attribute?.toUIMenuElementAttributes())
      }
      return menuFactory(title: menu.title, image: menu.image, options: menu.options?.toUIMenuOptions(), children: actions)
    }

    return menus
  }
}
