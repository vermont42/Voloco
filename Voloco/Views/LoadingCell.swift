// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class LoadingCell: UITableViewCell {
  @UsesAutoLayout
  private var activityIndicatorView: UIActivityIndicatorView = {
    let activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    activityIndicatorView.startAnimating()
    return activityIndicatorView
  }()

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = UIColor.systemBackground

    addSubview(activityIndicatorView)

    activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
  }
}
