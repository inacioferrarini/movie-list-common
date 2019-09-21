import UIKit

extension UIImage {

    public static func download(from url: URL, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
        
        let cacheKey = url.absoluteString
        if let image = ImageCache.shared.image(key: cacheKey) {
            print("Image found in cache. key = \(cacheKey)")
            completion(image, nil)
        } else {
            DispatchQueue.global().async {
                do {
                    let imageData = try Data(contentsOf: url)
                    if let image = UIImage(data: imageData) {
                        ImageCache.shared.store(image: image, key: cacheKey)
                        DispatchQueue.main.async {
                            print("found image. key = \(cacheKey)")
                            completion(image, nil)
                        }
                    } else {
                        DispatchQueue.main.async {
                            print("Failed to parse Image. key = \(cacheKey)")
                            completion(nil, nil)
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("Failed to parse Image. key = \(cacheKey). Error = \(error)")
                        completion(nil, error)
                    }
                }
            }
        }
    }
    
}
