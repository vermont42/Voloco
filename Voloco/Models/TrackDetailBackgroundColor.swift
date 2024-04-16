// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

struct StructColor {
  let strategy: () -> (UIColor)

  init(strategy: @escaping () -> (UIColor) = { .secondarySystemBackground }) {
    self.strategy = strategy
  }

  var color: UIColor {
    strategy()
  }
}

enum TrackDetailBackgroundColor: CaseIterable {
  static var current: TrackDetailBackgroundColor = .standard

  case standard
  case purple
  case turquoise
  case pink

  var uiColor: UIColor {
    if true { // user is in control group
      switch self {
      case .standard:
        TrackDetailBackgroundColor.toggle()
        return .secondarySystemBackground
      case .purple:
        TrackDetailBackgroundColor.toggle()
        return .systemPurple
      default:
        return .secondarySystemBackground
      }
    } else if false { // user is in experiment group A
      // TODO: use CaseIterable and allCases to return random color
      return .systemPurple
    } else { // user is in experiment group B
      let color = UIColor(
        red: CGFloat(Int.random(in: 0 ..< 256)),
        green: CGFloat(Int.random(in: 0 ..< 256)),
        blue: CGFloat(Int.random(in: 0 ..< 256)),
        alpha: 1.0
      )
      return color
    }
  }

  static func toggle() {
    switch current {
    case .standard:
      current = .purple
    case .purple:
      current = .standard
    default:
      break
    }
  }
}
