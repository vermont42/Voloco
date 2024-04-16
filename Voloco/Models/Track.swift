// Copyright © 2024 Josh Adams. All rights reserved.

import Foundation

struct Track: Decodable {
  let title: String
  let genre: String?
  let userName: String
  let trackURL: String
  let streamURL: String
  let trackImageURLs: TrackImageURLs
  let profileImageURLs: ProfileImageURLs

  // convertFromSnakeCase fails to convert user_name to userName.
  enum CodingKeys: String, CodingKey {
    case title, genre
    case userName = "user_name"
    case trackURL = "signed_track_url"
    case streamURL = "signed_track_stream_url"
    case trackImageURLs = "signed_image_urls"
    case profileImageURLs = "user_profile_images"
  }

  static let unknownGenre = "Unknown Genre"
}
