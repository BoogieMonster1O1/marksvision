// The Swift Programming Language
// https://docs.swift.org/swift-book

import CoreGraphics
import Vision

public struct MarksVision {
    public static func read(image: CGImage, handler: @escaping ([String]) -> Void) {
        let requestHandler: VNImageRequestHandler = .init(cgImage: image)
        let request: VNRecognizeTextRequest = .init { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                fatalError("Received invalid observations")
            }
            
            let recognizedText = observations.compactMap { observation in
                observation.topCandidates(1).first?.string
            }
            
            handler(recognizedText)
        }
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        
        do {
            try requestHandler.perform([request])
        } catch {
            print("Error: \(error)")
        }
    }
    
    public static func read(image: CGImage) async -> [String] {
        await withCheckedContinuation { continuation in
            read(image: image) { text in
                continuation.resume(returning: text)
            }
        }
    }
}
