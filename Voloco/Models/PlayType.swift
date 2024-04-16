// Copyright © 2024 Josh Adams. All rights reserved.

enum PlayType: String, CaseIterable {
  case file
  case stream

  static var current: PlayType = .file

  func urlString(track: Track) -> String {
    switch self {
    case .file:
      return track.trackURL
    case .stream:
      return track.streamURL
    }
  }

  var displayName: String {
    switch self {
    case .file:
      return "File"
    case .stream:
      return "Stream"
    }
  }
}
