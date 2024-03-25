//
//  Parser.swift
//
//
//  Created by Shrish Deshpande on 25/03/24.
//

import Foundation

internal protocol Parser {
    associatedtype ParsedType: MarksCard
    
    func parse(data: [String]) throws -> ParsedType
}
