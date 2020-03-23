//
//  IntrasonicsTask_iOSTests.swift
//  IntrasonicsTask-iOSTests
//

import XCTest
@testable import IntrasonicsTask_iOS

class IntrasonicsTask_iOSTests: XCTestCase {

    var vc: ViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vc = ViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vc = nil
    }

    func testIsNumeric() {
        let string = "34"
        XCTAssert(vc.isNumeric(str: string))
    }
    
    func testIfNotValidNumber() {
        let str = "abc"
        XCTAssert(vc.isNumeric(str: str), " \(str) is not a valid input")
    }

    func testPerformanceExample() {
        self.measure {
            let numbers = "-67, 0, 456, -43, 3, 99"
            vc.rawNumberList = numbers
            let sortedList = vc.sortNumbers()
            print(sortedList)
        }
    }
}
