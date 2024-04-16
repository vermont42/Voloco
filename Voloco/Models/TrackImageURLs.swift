// Copyright © 2024 Josh Adams. All rights reserved.

import Foundation

struct TrackImageURLs: Decodable {
  let small: String
  let large: String

  enum CodingKeys: String, CodingKey {
    case small = "100"
    case large = "800"
  }
}
