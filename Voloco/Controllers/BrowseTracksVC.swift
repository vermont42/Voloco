// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class BrowseTracksVC: UIViewController {
  let deleSource: BrowseTracksDeleSource

  private var browseTracksView: BrowseTracksView {
    if let castedView = view as? BrowseTracksView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: BrowseTracksView.self))
    }
  }

  init(browseTracksDelegate: BrowseTracksDelegate) {
    deleSource = BrowseTracksDeleSource(browseTracksDelegate: browseTracksDelegate)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override func loadView() {
    view = BrowseTracksView(frame: UIScreen.main.bounds)
    title = "Browse"
    browseTracksView.setupTable(dataSource: deleSource, delegate: deleSource)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    deleSource.beginLoading(tableView: browseTracksView.tableView)
  }
}
