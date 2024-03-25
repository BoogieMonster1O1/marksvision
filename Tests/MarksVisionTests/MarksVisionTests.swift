import XCTest
@testable import MarksVision

final class MarksVisionTests: XCTestCase {
    func testICSE() async throws {
        let path = "/Users/shrishdeshpande/PycharmProjects/marksvision/example/icse_10_1.jpg"
        let image: CGImage? = NSImage.init(contentsOfFile: path)!.cgImage
        guard let cgImage = image else {
            XCTFail("Could not load image")
            return
        }
        let card = try! await MarksVision.readICSE(image: cgImage)
        print(card.name)
        print(card.school)
        print(card.dob.formatted())
        print(card.yearOfPassing)
        print(card.uniqueID)
        print(card.indexNumber)
    }
}

extension NSImage {
    fileprivate var cgImage: CGImage? {
        return self.cgImage(forProposedRect: nil, context: nil, hints: nil)
    }
}
