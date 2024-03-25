//
//  MarksCard.swift
//
//
//  Created by Shrish Deshpande on 25/03/24.
//

import Foundation

public protocol MarksCard: Codable, Hashable {
    var type: MarksCardType { get }
    
    var name: String { get }
    
    var dob: Date { get }
    
    var school: String { get }
    
    var uniqueID: String { get }
    
    var yearOfPassing: Int { get }
}
