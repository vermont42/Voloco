// Copyright © 2024 Josh Adams. All rights reserved.

import UIKit

class ImageCacheLoader {
  private static let shared = ImageCacheLoader()
  private var cache: NSCache<NSString, UIImage>

  private init() {
    cache = NSCache()
  }

  static func requestImage(url: URL) async -> UIImage? {
    if let image = shared.cache.object(forKey: url.absoluteString as NSString) {
      return image
    } else {
      do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let image = UIImage(data: data)
        if let image {
          shared.cache.setObject(image, forKey: url.absoluteString as NSString)
        }
        return image
      } catch {
        return nil
      }
    }
  }
}
