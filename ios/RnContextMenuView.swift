import ExpoModulesCore

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class RnContextMenuView: ExpoView {
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
      previewProvider: makeRatePreview,
      actionProvider: { _ in
        let removeRating = self.makeRemoveRatingAction()
        let rateMenu = self.makeRateMenu()
        let children = [rateMenu, removeRating]
        return UIMenu(title: "", children: children)
      })
  }

  func makeRatePreview() -> UIViewController {
    let viewController = UIViewController()

    // 1
    let imageView = UIImageView(image: UIImage(systemName: "circle.fill"))
    viewController.view = imageView

    // 2
    imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    imageView.translatesAutoresizingMaskIntoConstraints = false

    // 3
    viewController.preferredContentSize = imageView.frame.size

    return viewController
  }

  func makeRemoveRatingAction() -> UIAction {
    // 1
    let removeRatingAttributes = UIMenuElement.Attributes.destructive

    // 3
    let deleteImage = UIImage(systemName: "delete.left")

    // 4
    return UIAction(
      title: "Remove rating",
      image: deleteImage,
      identifier: nil,
      attributes: removeRatingAttributes) { _ in
        print("removed")
      }
  }

  func makeRateMenu() -> UIMenu {
    let ratingButtonTitles = ["Boring", "Meh", "It's OK", "Like It", "Fantastic!"]

    let rateActions = ratingButtonTitles
      .enumerated()
      .map { index, title in
        UIAction(
          title: title,
          identifier: UIAction.Identifier("\(index + 1)"),
          handler: updateRating)
      }

    return UIMenu(
      title: "Rate...",
      image: UIImage(systemName: "star.circle"),
      options: .displayInline,
      children: rateActions)
  }

  func updateRating(from action: UIAction) {
    guard let number = Int(action.identifier.rawValue) else {
      return
    }
    print("updated with \(number)")
  }
}
