// Copyright © 2024 Josh Adams. All rights reserved.

import Foundation

enum PageLoader {
  static func loadPage(offset: Int) async -> Page? {
    guard
      let url = URL(string: "https://voloco.resonantcavity.com/top_tracks/public?type=hot&offset=\(offset)"),
      let (responseData, _) = try? await URLSession.shared.data(from: url),
      let page = try? JSONDecoder().decode(Page.self, from: responseData)
    else {
      return nil
    }

    return page
  }
}
