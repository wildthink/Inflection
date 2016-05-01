//
//  Inflection_Tests.swift
//  Inflection Tests
//
//  Created by Christoffer Winterkvist on 3/2/15.
//
//

import UIKit
import XCTest

class Inflection_Tests: XCTestCase {
    
    func testRubyToSwift() {
        let subjectString = "createdAt".rubyCase()
        let expectedString = "created_at"
        
        XCTAssertEqual(subjectString, expectedString, "New string should be 'created_at'")
    }
    
    func testSwiftToRuby() {
        let subjectString = "updated_at".swiftCase()
        let expectedString = "updatedAt"
        
        XCTAssertEqual(subjectString, expectedString, "New string should be 'createdAt'")
    }
    
    func testDictionaryInflection() {
        let remoteDictionary = ["created_at":"", "updated_at":""]
        let localDictionary = ["createdAt":"", "updatedAt":""]

        XCTAssertEqual((remoteDictionary as NSDictionary).swiftCase(), localDictionary as NSDictionary)
    }

    func testCases()
    {
        let input: String = "SomeOldHorse"

        func p(type: String, _ str: String) {
//            let output = input.performSelector(sel)
            Swift.print ("\(input).\(type) -> \(str)")
        }

        p ("ruby", input.rubyCase())
        p ("snakeCase", input.snakeCase())
        p ("humanize", input.humanize())
//        p ("upperCamelCase", input.upperCamelCase())
        p ("camelCase", input.camelCase())
//        p ("classify", input.classify())
        p ("dashedCase", input.dashedCase())
//        p ("dotNetCase", input.dotNetCase())
        p ("javascriptCase", input.javascriptCase())
        p ("lispCase", input.lispCase())
        p ("objcCase", input.objcCase())
        p ("pythonCase", input.pythonCase())
        p ("swiftCase", input.swiftCase())
        p ("underscoreCase", input.underscoreCase())
//        p ("upperCamelCase", input.upperCamelCase())

    }
}


