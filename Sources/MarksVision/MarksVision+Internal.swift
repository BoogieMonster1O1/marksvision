//
//  MarksVision+Internal.swift
//
//
//  Created by Shrish Deshpande on 25/03/24.
//

import Foundation
import Vision
import CoreGraphics

internal extension MarksVision {
    static func read(image: CGImage, handler: @escaping ([String]) -> Void) {
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
}
