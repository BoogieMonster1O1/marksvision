//
//  ICSEMarksCard.swift
//
//
//  Created by Shrish Deshpande on 25/03/24.
//

import Foundation

public struct ICSEMarksCard: MarksCard {
    public let type: MarksCardType = .icse
    
    public let name: String
    
    public let dob: Date
    
    public let school: String
    
    public let uniqueID: String
    
    public let yearOfPassing: Int
    
    public let indexNumber: String
    
    public init(name: String, dob: Date, school: String, uniqueID: String, yearOfPassing: Int, indexNumber: String) {
        self.name = name
        self.dob = dob
        self.school = school
        self.uniqueID = uniqueID
        self.yearOfPassing = yearOfPassing
        self.indexNumber = indexNumber
    }
}
