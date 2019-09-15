import Quick
import Nimble
@testable import Common

class UIImageTintSpec: QuickSpec {

    override func spec() {

        describe("Extension methods") {

            let testBundle = Bundle(for: UIImageTintSpec.self)
            let yellowImage = UIImage(named: "ImageTintColor", in: testBundle, compatibleWith: nil)
            let redImage = UIImage(named: "ImageTintColorRed", in: testBundle, compatibleWith: nil)

            it("Applying tint to an image must produce the same Image as expected") {
                let tintedImage = yellowImage?.tint(with: UIColor.red)

                let compareImagePngData = redImage?.pngData()
                let tintedImagePngData = tintedImage?.pngData()

                expect(compareImagePngData).to(equal(tintedImagePngData))
            }

        }

    }

}
