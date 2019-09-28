//    The MIT License (MIT)
//
//    Copyright (c) 2019 Inácio Ferrarini
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

import UIKit

extension UIImage {

    ///
    /// Downloads an image from the given `URL`.
    /// - Parameter url: Image URL.
    /// - Parameter completion: Clojure to be executed when download is complete or fails
    ///
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
