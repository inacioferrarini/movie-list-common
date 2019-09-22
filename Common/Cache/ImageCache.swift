import Foundation

/// Provides a Cache to store images
public class ImageCache {

    public static let shared = ImageCache()

    private let imageCache = NSCache<NSString, UIImage>()


    // MARK: - Initialization

    private init() {
        loadCache()
    }

    deinit {
        saveCache()
    }

    func store(image: UIImage, key: String) {
        imageCache.setObject(image, forKey: key as NSString)
    }

    func image(key: String) -> UIImage? {
        return imageCache.object(forKey: key as NSString)
    }

    private func saveCache() {
        print("saving cache do disk")
    }

    private func loadCache() {
        print("loading cache from disk")
    }

}
