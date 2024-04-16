// Copyright © 2024 Josh Adams. All rights reserved.

import Foundation

extension NSCoder {
  static func fatalErrorNotImplemented() -> Never {
    fatalError("init(coder:) has not been implemented.")
  }
}
