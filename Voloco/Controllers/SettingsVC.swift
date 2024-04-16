// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class SettingsVC: UIViewController {
  var settingsView: SettingsView {
    if let castedView = view as? SettingsView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: SettingsView.self))
    }
  }

  override func loadView() {
    view = SettingsView(frame: UIScreen.main.bounds)
    title = "Settings"

    settingsView.playTypeControl.addTarget(
      self,
      action: #selector(playTypeChanged(_:)),
      for: .valueChanged
    )
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    updateControl()
  }

  private func updateControl() {
    switch PlayType.current {
    case .file:
      settingsView.playTypeControl.selectedSegmentIndex = 0
    case .stream:
      settingsView.playTypeControl.selectedSegmentIndex = 1
    }
  }

  @objc func playTypeChanged(_ sender: UISegmentedControl) {
    let index = settingsView.playTypeControl.selectedSegmentIndex
    if index == 0 {
      PlayType.current = .file
    } else if index == 1 {
      PlayType.current = .stream
    }
  }
}
