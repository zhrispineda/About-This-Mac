//
//  MacInfo.swift
//  System Information
//

import Foundation

class MacInfo {
    // Use ProcessInfo to get memory in GB
    static var memory: String {
        let memory = ProcessInfo.processInfo.physicalMemory
        let formatted = memory / (1024 * 1024 * 1024)
        return String(formatted)
    }
    
    // Get `marketing-name` key value and then format it separately to model and year variables
    func model() -> (name: String, year: String) {
        let fullString = MGHelper.read(key: "Z/dqyWS6OZTRy10UcmUAhw") ?? "UNKNOWN"
        let trimmedString = fullString.trimmingCharacters(in: .whitespaces)
        
        if let openParenIndex = trimmedString.firstIndex(of: "("),
           let closeParenIndex = trimmedString.firstIndex(of: ")") {
            
            let modelName = trimmedString[..<openParenIndex].trimmingCharacters(in: .whitespaces)
            
            let modelYear = trimmedString[trimmedString.index(after: openParenIndex)..<closeParenIndex].trimmingCharacters(in: .whitespaces)
            
            let modelNameString = String(modelName)
            let modelYearString = String(modelYear)
            
            return (name: modelNameString, year: modelYearString)
        }
        return (name: "UNKNOWN".localize(table: "SPInfo"), year: "UNKNOWN".localize(table: "SPInfo"))
    }
    
    // Use regular expression to get and format OS information from operatingSystemVersionString
    func system() -> (version: String, build: String) {
        let fullString = ProcessInfo.processInfo.operatingSystemVersionString
        let pattern = "Version (\\d+\\.\\d+) \\(Build ([A-Za-z0-9]+)\\)"
        
        if let regex = try? NSRegularExpression(pattern: pattern, options: []) {
            let range = NSRange(fullString.startIndex..<fullString.endIndex, in: fullString)
            
            if let match = regex.firstMatch(in: fullString, options: [], range: range) {
                let versionRange = match.range(at: 1)
                let buildRange = match.range(at: 2)
                
                if let version = Range(versionRange, in: fullString),
                   let build = Range(buildRange, in: fullString) {
                    let versionString = fullString[version]
                    let buildString = fullString[build]
                    let buildSuffix = buildString.last
                    var systemName = String()
                    
                    switch versionString.prefix(2) {
                    case "15":
                        systemName = "Sequoia"
                    case "14":
                        systemName = "Sonoma"
                    case "13":
                        systemName = "Ventura"
                    default:
                        systemName = "UNKNOWN"
                    }
                    
                    return (version: "\(systemName) \(versionString)", build: "\(versionString) \(buildSuffix?.isNumber ?? false ? "Beta (\(buildString))" : "(\(buildString))")")
                }
            }
        }
        return (version: "UNKNOWN", build: "UNKNOWN")
    }
}
