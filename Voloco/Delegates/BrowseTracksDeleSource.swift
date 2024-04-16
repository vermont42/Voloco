// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class BrowseTracksDeleSource: NSObject, UITableViewDelegate, UITableViewDataSource {
  var tracks: [Track] = []
  weak var browseTracksDelegate: BrowseTracksDelegate?
  private var didBeginLoading = false
  private var offset = 0
  private var didReachEnd = false
  private var tableView: UITableView?

  init(browseTracksDelegate: BrowseTracksDelegate) {
    self.browseTracksDelegate = browseTracksDelegate
  }

  func beginLoading(tableView: UITableView) {
    self.tableView = tableView
    tableView.reloadData()
    if !didBeginLoading {
      didBeginLoading = true
      loadTracks()
    }
  }

  private func loadTracks() {
    Task {
      await loadTracksAsync()
    }
  }

  private func loadTracksAsync() async {
    let page = await PageLoader.loadPage(offset: offset)
    let pageSize = 20
    offset += pageSize
    if let page {
      tracks.append(contentsOf: page.tracks)
      if page.isDone {
        didReachEnd = true
      }
    } else {
      didReachEnd = true
    }
    tableView?.reloadData()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if didBeginLoading {
      if didReachEnd {
        return tracks.count
      } else {
        return tracks.count + 1
      }
    } else {
      return 0
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row < tracks.count {
      let cell = tableView.dequeueReusableCell(withIdentifier: "\(TrackCell.self)") as? TrackCell ?? TrackCell()
      let track = tracks[indexPath.row]
      cell.configure(track: track)
      Task {
        if let url = URL(string: track.trackImageURLs.small) {
          let image = await ImageCacheLoader.requestImage(url: url)
          if
            let image,
            let updateCell = tableView.cellForRow(at: indexPath) as? TrackCell
          {
            updateCell.photoImageView.image = image
          }
        }
      }
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "\(LoadingCell.self)") as? LoadingCell ?? LoadingCell()
      loadTracks()
      return cell
    }
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row < tracks.count {
      browseTracksDelegate?.showDetails(track: tracks[indexPath.row])
    }
  }
}
