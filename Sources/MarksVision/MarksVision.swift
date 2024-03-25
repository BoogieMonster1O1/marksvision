// The Swift Programming Language
// https://docs.swift.org/swift-book

import CoreGraphics

public struct MarksVision {
    // MARK: completion handlers
    
    public static func readICSE(image: CGImage, handler: @escaping (Result<ICSEMarksCard, ParserError>) -> Void) {
        let parser: ICSEParser = .init()
        read(image: image) { data in
            do {
                handler(.success(try parser.parse(data: data)))
            } catch let error as ParserError {
                handler(.failure(error))
            } catch {
                fatalError("Unexpected error! This is a bug!")
            }
        }
    }
    
    // MARK: async/await
    
    public static func read(image: CGImage) async -> [String] {
        await withCheckedContinuation { continuation in
            read(image: image) { text in
                continuation.resume(returning: text)
            }
        }
    }
    
    public static func readICSE(image: CGImage) async throws -> ICSEMarksCard {
        try await withCheckedThrowingContinuation { continuation in
            readICSE(image: image) { result in
                switch result {
                case .success(let card):
                    continuation.resume(returning: card)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
