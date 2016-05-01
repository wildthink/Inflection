
//  Inflection.swift
//  Inflection
//
//  Created by Christoffer Winterkvist on 3/2/15.
//
//

import Foundation

public extension NSDictionary {
    
    func swiftCase() -> NSDictionary {
        return self.inflectDictionaryKeys({ (string) -> String in string.swiftCase()})
    }
    
    func rubyCase() -> NSDictionary {
        return self.inflectDictionaryKeys({ (string) -> String in string.rubyCase()})
    }
    
    private func inflectDictionaryKeys(closure: (string: String) -> String) -> NSDictionary {
        let newDictionary = NSMutableDictionary()
        for (key, value) in self {
            newDictionary[closure(string: key as! String)] = value
        }
//        map { newDictionary[closure(string: $0 as! String)] = $1 }

        return newDictionary.copy() as! NSDictionary
    }
    
}

public extension String {
    
    func camelCase() -> String {
        return self.replaceIdentifierWithString("").lowerCaseFirstLetter()
    }
    
    func classify() -> String {
        return self.upperCamelCase()
    }
    
    func dashedCase() -> String {
        return self.lowerCaseFirstLetter().replaceIdentifierWithString("-")
    }
    
    func dotNetCase() -> String {
        return self.upperCamelCase()
    }
    
    func javascriptCase() -> String {
        return self.replaceIdentifierWithString("").lowerCaseFirstLetter()
    }
    
    func lispCase() -> String {
        return self.dashedCase()
    }
    
    func objcCase() -> String {
        return self.camelCase()
    }
    
    func pythonCase() -> String {
        return self.snakeCase()
    }
    
    func snakeCase() -> String {
        return self.underscoreCase()
    }
    
    func swiftCase() -> String {
        return self.camelCase()
    }
    
    func underscoreCase() -> String {
        return (self.lowerCaseFirstLetter() as String).replaceIdentifierWithString("_")
    }
    
    func upperCamelCase() -> String {
        return self.camelCase().upperCamelCase()
    }
    
    func rubyCase () -> String {
        return self.snakeCase()
    }
    
    func humanize() -> String {
        return self.replaceIdentifierWithString(" ").capitalizedString
    }
    
    private func lowerCaseFirstLetter() -> String {
        let mutableString = self.mutableCopy() as! NSMutableString
        mutableString.replaceCharactersInRange(NSMakeRange(0, 1), withString: self.firstLetter().lowercaseString as String)

        return mutableString.copy() as! String
    }
    
    private func upperCaseFirstLetter() -> String {
        let mutableString = self.mutableCopy() as! NSMutableString
        mutableString.replaceCharactersInRange(NSMakeRange(0, 1), withString: self.firstLetter().uppercaseString as String)
        
        return mutableString.copy() as! String
    }
    
    private func firstLetter() -> String {
        return (self as NSString).substringToIndex(1) as String
    }
    
    private func replaceIdentifierWithString(identifier: String) -> String {

        let scanner = NSScanner.init(string: self)
        let identifierSet = NSCharacterSet.init(charactersInString: identifier)
        let alphaNumericSet = NSCharacterSet.alphanumericCharacterSet()
        let uppercaseSet = NSCharacterSet.uppercaseLetterCharacterSet()
        let lowercaseSet = NSCharacterSet.lowercaseLetterCharacterSet()
        
        var buffer: NSString?
        let output: NSMutableString = NSMutableString()

        scanner.caseSensitive = true
        
        while !scanner.atEnd {
            if scanner.scanCharactersFromSet(identifierSet, intoString: &buffer) {
                continue
            } else if identifier.characters.count > 0 {
                let isUppercase: Bool = scanner.scanCharactersFromSet(uppercaseSet, intoString: &buffer)
                if isUppercase {
                    output.appendString(identifier)
                    output.appendString(buffer!.lowercaseString)
                }
                
                let isLowercase: Bool = scanner.scanCharactersFromSet(lowercaseSet, intoString: &buffer)
                if isLowercase {
                    output.appendString(buffer!.lowercaseString)
                }
            } else if scanner.scanCharactersFromSet(alphaNumericSet, intoString: &buffer) {
                if let b = buffer {
                    output.appendString(b.capitalizedString)
                }
            } else {
                scanner.scanLocation = scanner.scanLocation + 1
            }
            
        }

        return output.copy() as! String
    }
    
}