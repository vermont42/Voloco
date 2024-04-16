// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class TrackDetailView: UIView, UITextViewDelegate {
  @UsesAutoLayout
  private(set) var photoImageView: UIImageView = {
    let photoImageView = UIImageView()
    photoImageView.contentMode = .scaleAspectFit
    return photoImageView
  }()

  @UsesAutoLayout
  private var titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.textAlignment = .center
    titleLabel.font = Fonts.labelBold
    titleLabel.numberOfLines = 0
    return titleLabel
  }()

  @UsesAutoLayout
  private var userNameLabel: UILabel = {
    let userNameLabel = UILabel()
    userNameLabel.textAlignment = .center
    userNameLabel.font = Fonts.label
    userNameLabel.numberOfLines = 0
    return userNameLabel
  }()

  @UsesAutoLayout
  private var genreLabel: UILabel = {
    let genreLabel = UILabel()
    genreLabel.textAlignment = .center
    genreLabel.font = Fonts.labelSmall
    return genreLabel
  }()

  @UsesAutoLayout
  private(set) var playTrackButton: UIButton = {
    let playTrackButton = UIButton()
    playTrackButton.titleLabel?.font = Fonts.buttonSmall
    playTrackButton.setTitle("Play Track", for: .normal)
    playTrackButton.setTitleColor(.systemBlue, for: .normal)
    return playTrackButton
  }()

  @UsesAutoLayout
  private(set) var showMusicianButton: UIButton = {
    let showMusicianButton = UIButton()
    showMusicianButton.titleLabel?.font = Fonts.buttonSmall
    showMusicianButton.setTitle("Show Musician", for: .normal)
    showMusicianButton.setTitleColor(.systemBlue, for: .normal)
    return showMusicianButton
  }()

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = TrackDetailBackgroundColor.current.uiColor
    [photoImageView, titleLabel, userNameLabel, genreLabel, playTrackButton, showMusicianButton].forEach {
      addSubview($0)
    }

    photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).activate()
    photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).activate()

    let photoHeightWidth: CGFloat = 180.0
    photoImageView.heightAnchor.constraint(equalToConstant: photoHeightWidth).activate()
    photoImageView.widthAnchor.constraint(equalToConstant: photoHeightWidth).activate()

    titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Layout.doubleStandard).activate()
    titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()

    userNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Layout.doubleStandard).activate()
    userNameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    userNameLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()

    genreLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: Layout.doubleStandard).activate()
    genreLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    genreLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()

    playTrackButton.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: Layout.doubleStandard).activate()
    playTrackButton.centerXAnchor.constraint(equalTo: centerXAnchor).activate()

    showMusicianButton.topAnchor.constraint(equalTo: playTrackButton.bottomAnchor, constant: Layout.doubleStandard).activate()
    showMusicianButton.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
  }

  func configure(track: Track) {
    titleLabel.text = track.title
    userNameLabel.text = track.userName
    genreLabel.text = track.genre ?? Track.unknownGenre
  }

  func changeBackgroundColor() {
    TrackDetailBackgroundColor.toggle()
    backgroundColor = TrackDetailBackgroundColor.current.uiColor
  }
}
