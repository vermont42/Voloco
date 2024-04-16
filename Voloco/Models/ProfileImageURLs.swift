// Copyright © 2024 Josh Adams. All rights reserved.

import Foundation

struct ProfileImageURLs: Decodable {
  let large: String

  enum CodingKeys: String, CodingKey {
    case large = "800"
  }
}
