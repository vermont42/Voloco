// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class TrackCell: UITableViewCell {
  @UsesAutoLayout
  private var titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.font = Fonts.labelBold
    titleLabel.numberOfLines = 2
    return titleLabel
  }()

  @UsesAutoLayout
  private var userNameLabel: UILabel = {
    let userNameLabel = UILabel()
    userNameLabel.font = Fonts.label
    userNameLabel.adjustsFontSizeToFitWidth = true
    return userNameLabel
  }()

  @UsesAutoLayout
  private var genreLabel: UILabel = {
    let genreLabel = UILabel()
    genreLabel.font = Fonts.labelSmall
    return genreLabel
  }()

  @UsesAutoLayout
  private(set) var photoImageView: UIImageView = {
    let photoImageView = UIImageView()
    photoImageView.contentMode = .scaleAspectFit
    return photoImageView
  }()

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = UIColor.systemBackground

    [titleLabel, userNameLabel, genreLabel, photoImageView].forEach {
      addSubview($0)
    }

    titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Layout.standard).activate()
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.standard).activate()
    titleLabel.trailingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: Layout.standard * -1.0).activate()

    userNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Layout.standard).activate()
    userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.standard).activate()
    userNameLabel.trailingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: Layout.standard * -1.0).activate()

    genreLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: Layout.standard).activate()
    genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.standard).activate()
    genreLabel.trailingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: Layout.standard * -1.0).activate()

    let photoPadding: CGFloat = 4.0
    photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Layout.standard * -1.0 + photoPadding).activate()
    photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
    photoImageView.heightAnchor.constraint(equalToConstant: BrowseTracksView.rowHeight - photoPadding).activate()
    photoImageView.widthAnchor.constraint(equalToConstant: BrowseTracksView.rowHeight - photoPadding).activate()
  }

  func configure(track: Track) {
    titleLabel.text = track.title
    userNameLabel.text = track.userName
    genreLabel.text = track.genre ?? Track.unknownGenre
    photoImageView.image = Symbols.musicNote
  }
}
