import UIKit

extension UIImage {

    public static func download(from url: URL, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
        
        let cacheKey = url.absoluteString
        if let image = ImageCache.shared.image(key: cacheKey) {
            completion(image, nil)
        } else {
            DispatchQueue.global().async {
                do {
                    let imageData = try Data(contentsOf: url)
                    if let image = UIImage(data: imageData) {
                        ImageCache.shared.store(image: image, key: cacheKey)
                        DispatchQueue.main.async {
                            completion(image, nil)
                        }
                    } else {
                        DispatchQueue.main.async {
                            completion(nil, nil)
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
    }
    
}
