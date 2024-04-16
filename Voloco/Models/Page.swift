// Copyright © 2024 Josh Adams. All rights reserved.

import Foundation

struct Page: Decodable {
  let nextOffset: Int
  let isDone: Bool
  var tracks: [Track]

  enum CodingKeys: String, CodingKey {
    case tracks = "data"
    case nextOffset = "next_offset"
    case isDone = "done"
  }
}
