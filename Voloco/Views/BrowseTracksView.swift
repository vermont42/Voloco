// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class BrowseTracksView: UIView {
  static let rowHeight: CGFloat = 128.0

  @UsesAutoLayout
  private(set) var tableView: UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = BrowseTracksView.rowHeight
    return tableView
  }()

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .secondarySystemBackground

    addSubview(tableView)

    tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.standard).activate()
    tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()
  }

  func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
    tableView.dataSource = dataSource
    tableView.delegate = delegate
    tableView.register(TrackCell.self, forCellReuseIdentifier: "\(TrackCell.self)")
  }
}
