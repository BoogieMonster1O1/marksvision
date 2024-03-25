//
//  ICSEParser.swift
//
//
//  Created by Shrish Deshpande on 25/03/24.
//

import Foundation

internal struct ICSEParser: Parser {
    func parse(data: [String]) throws -> ICSEMarksCard {
        
    }
    
    func parseSchoolName(data: [String]) -> String? {
        guard let statementIndex = data.firstIndex(of: "STATEMENT OF MARKS") else {
            return nil
        }
        
        guard statementIndex + 2 < data.count else {
            return nil
        }
        
        let schoolLine = data[statementIndex + 2]
        
        let components = schoolLine.components(separatedBy: "of ")
        if components.count > 1 {
            return components[1].trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            return nil
        }
    }
    
    func parseYearOfPassing(data: [String]) -> Int? {
        guard let yearIndex = data.firstIndex(where: { $0.hasPrefix("INDIAN CERTIFICATE OF SECONDARY EDUCATION (CLASS - X) - YEAR") }) else {
            return nil // Line with year information not found
        }
        
        let yearLine = data[yearIndex]
        
        let words = yearLine.components(separatedBy: .whitespaces)
        if let lastWord = words.last {
            return Int(lastWord)
        } else {
            return nil
        }
    }
    
    func parseDob(data: [String]) -> Date? {
        guard let resultIndex = data.firstIndex(of: "RESULT - PASS CERTIFICATE AWARDED") else {
            return nil
        }
        
        guard resultIndex - 1 >= 0 else {
            return nil
        }
        
        let dateString = data[resultIndex - 1]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        return dateFormatter.date(from: dateString)
    }
    
    func parseName(data: [String]) -> String? {
        guard let statementIndex = data.firstIndex(of: "STATEMENT OF MARKS") else {
            return nil
        }
        
        guard statementIndex + 1 < data.count else {
            return nil
        }
        
        let nameLine = data[statementIndex + 1]
        
        let components = nameLine.components(separatedBy: " ")
        if components.count > 1 {
            return components.dropFirst().joined(separator: " ")
        } else {
            return nil
        }
    }
    
    func parseUniqueID(data: [String]) -> String? {
        guard let index = data.firstIndex(where: { $0.contains("Unique ID") }) else {
            return nil // Return nil if 'Unique ID' is not found in the array
        }
        
        let uniqueIDString = data[index]
        let components = uniqueIDString.components(separatedBy: CharacterSet.decimalDigits.inverted)
        
        if let uniqueID = components.first(where: { !$0.isEmpty }) {
            return uniqueID
        } else {
            return nil
        }
    }
    
    func parseIndexNumber(data: [String]) -> String? {
        guard let index = data.firstIndex(where: { $0.contains("No. TT") }) else {
            return nil
        }
        
        guard index + 1 < data.count else {
            return nil
        }
        
        let nextString = data[index + 1]
        let components = nextString.components(separatedBy: "/")
        
        guard components.count == 2 else {
            return nil
        }
        
        return components.joined(separator: "/")
    }
}
