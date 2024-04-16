// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class TrackCoordinator: Coordinator, BrowseTracksDelegate, TrackDetailDelegate {
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let vc = BrowseTracksVC(browseTracksDelegate: self)
    vc.tabBarItem = UITabBarItem(title: "Browse", image: Symbols.musicNote, selectedImage: nil)
    navigationController.pushViewController(vc, animated: false)
  }

  func showDetails(track: Track) {
    let trackDetailVC = TrackDetailVC(track: track, trackDetailDelegate: self)
    navigationController.pushViewController(trackDetailVC, animated: true)
  }

  func openURL(string: String) {
    if
      let url = URL(string: string),
      UIApplication.shared.canOpenURL(url)
    {
      UIApplication.shared.open(url)
    }
  }
}
