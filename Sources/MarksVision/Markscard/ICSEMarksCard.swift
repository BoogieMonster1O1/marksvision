//
//  ICSEMarksCard.swift
//
//
//  Created by Shrish Deshpande on 25/03/24.
//

import Foundation

public struct ICSEMarksCard: MarksCard {
    public var type: MarksCardType {
        return .icse
    }
    
    public let name: String
    
    public let school: String
    
    public let dob: Date
    
    public let yearOfPassing: Int

    public let uniqueID: String
    
    public let indexNumber: String
    
    public init(name: String, school: String, dob: Date, yearOfPassing: Int, uniqueID: String, indexNumber: String) {
        self.name = name
        self.dob = dob
        self.school = school
        self.uniqueID = uniqueID
        self.yearOfPassing = yearOfPassing
        self.indexNumber = indexNumber
    }
}
