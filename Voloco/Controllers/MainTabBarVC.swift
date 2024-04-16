// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class MainTabBarVC: UITabBarController {
  private let trackCoordinator = TrackCoordinator(navigationController: UINavigationController())
  private let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())

  override func viewDidLoad() {
    trackCoordinator.start()
    settingsCoordinator.start()
    viewControllers = [trackCoordinator.navigationController, settingsCoordinator.navigationController]
  }
}
