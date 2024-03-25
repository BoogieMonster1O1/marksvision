import XCTest
@testable import MarksVision

final class MarksVisionTests: XCTestCase {
    func testRead() async throws {
        let path = "/Users/shrishdeshpande/PycharmProjects/marksvision/example/icse_10_1.jpg"
        let image: CGImage? = NSImage.init(contentsOfFile: path)!.cgImage
        guard let cgImage = image else {
            XCTFail("Could not load image")
            return
        }
        let text = await MarksVision.read(image: cgImage)
        print(text)
    }
}

extension NSImage {
    fileprivate var cgImage: CGImage? {
        return self.cgImage(forProposedRect: nil, context: nil, hints: nil)
    }
}
