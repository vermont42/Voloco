// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class TrackDetailVC: UIViewController {
  private let track: Track
  private weak var trackDetailDelegate: TrackDetailDelegate?

  private var trackDetailView: TrackDetailView {
    if let castedView = view as? TrackDetailView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: TrackDetailView.self))
    }
  }

  init(track: Track, trackDetailDelegate: TrackDetailDelegate) {
    self.track = track
    self.trackDetailDelegate = trackDetailDelegate
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override func loadView() {
    view = TrackDetailView(frame: UIScreen.main.bounds)
    trackDetailView.configure(track: track)

    Task {
      if let url = URL(string: track.trackImageURLs.large) {
        await trackDetailView.photoImageView.image = ImageCacheLoader.requestImage(url: url)
      }
    }

    trackDetailView.playTrackButton.addTarget(self, action: #selector(playTrack), for: .touchUpInside)
    trackDetailView.showMusicianButton.addTarget(self, action: #selector(showMusician), for: .touchUpInside)
  }

  @objc func playTrack() {
    trackDetailDelegate?.openURL(string: PlayType.current.urlString(track: track))
  }

  @objc func showMusician() {
    trackDetailDelegate?.openURL(string: track.profileImageURLs.large)
  }
}
