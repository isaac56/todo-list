//
//  ToDoListAppTests.swift
//  ToDoListAppTests
//
//  Created by 지북 on 2021/04/16.
//

import XCTest

class ToDoListAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func test_날짜변환스트링에서데이트() {
        let date = "2021-04-14T21:57:38"
        let stringToDate = DateManager.toDate(date)
        XCTAssertEqual("2021-04-14T21:57:38", stringToDate.description)
    }
    
    func test_시간차() {
        let date = "2021-04-14T21:57:38"
        let stringToDate = DateManager.toDate(date)
        print(DateManager.intervalTime(historyTime: stringToDate))
    }
}
