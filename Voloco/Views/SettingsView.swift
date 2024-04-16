// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class SettingsView: UIView {
  @UsesAutoLayout
  private var playTypeLabel = SettingsView.createLabel(text: "Play Type")

  @UsesAutoLayout
  private(set) var playTypeControl = SettingsView.createControl(displayNames: PlayType.allCases.map { $0.displayName })

  @UsesAutoLayout
  private var playTypeDescription = SettingsView.createDescription(text: "This setting controls whether tracks are played as files or streams in Safari.")

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .secondarySystemBackground

    [playTypeLabel, playTypeControl, playTypeDescription].forEach {
      addSubview($0)
    }

    playTypeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.standard).activate()
    playTypeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    playTypeLabel.bottomAnchor.constraint(equalTo: playTypeControl.topAnchor, constant: Layout.standard * -1.0).activate()

    playTypeControl.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    playTypeControl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()

    playTypeDescription.topAnchor.constraint(equalTo: playTypeControl.bottomAnchor, constant: Layout.standard).activate()
    playTypeDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    playTypeDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()
  }

  private static func createLabel(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = Fonts.heading
    return label
  }

  private static func createControl(displayNames: [String]) -> UISegmentedControl {
    var items: [String] = []
    displayNames.forEach {
      items.append($0)
    }
    return UISegmentedControl(items: items)
  }

  private static func createDescription(text: String) -> UILabel {
    let description = UILabel()
    description.text = text
    description.numberOfLines = 0
    description.lineBreakMode = .byWordWrapping
    description.font = Fonts.smallBody
    return description
  }
}
