import ExpoModulesCore

public class RnContextMenuModule: Module {
  // Each module class must implement the definition function. The definition consists of components
  // that describes the module's functionality and behavior.
  // See https://docs.expo.dev/modules/module-api for more details about available components.
  public func definition() -> ModuleDefinition {
    Name("RnContextMenuView")

    View(RnContextMenuView.self) {
      Events("onPressActionItem")

      Prop("title") { (view, title: String) in
        view.contextMenuTitle = title
      }
    }
  }
}
