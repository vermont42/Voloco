// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

protocol Coordinator {
  var navigationController: UINavigationController { get set }
  func start()
}
