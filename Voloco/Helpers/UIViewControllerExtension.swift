// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

extension UIViewController {
  func fatalCastMessage(view: Any) -> String {
    "Could not cast \(self).view to \(view)."
  }
}
