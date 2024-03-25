//
//  ParserError.swift
//
//
//  Created by Shrish Deshpande on 25/03/24.
//

import Foundation

public enum ParserError: Error {
    case couldNotParse(fieldName: String)
    
    var localizedDescription: String {
        switch self {
        case .couldNotParse(let fieldName):
            return "Could not parse \(fieldName)"
        }
    }
}
