//
//  App+URL.swift
//  TemplateTests
//
//  Created by Gyeongtae Nam on 2022/05/04.
//

import XCTest

class App_URLTests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testExample() throws {
        
        
//        let expeteedCache = "file:///Users/gyeongtaenam/Library/Developer/CoreSimulator/Devices/A5CA8BCE-73DD-4F98-A27E-19F9953C8393/data/Containers/Data/Application/C1A78432-7D21-4F1F-AE22-1411846ACADE/Library/Caches/"
//
//        let expectedDocument = "file:///Users/gyeongtaenam/Library/Developer/CoreSimulator/Devices/A5CA8BCE-73DD-4F98-A27E-19F9953C8393/data/Containers/Data/Application/C1A78432-7D21-4F1F-AE22-1411846ACADE/Documents/"
        
        
        let expectedCache = "Caches"
        let expectedDocument = "Documents"
        
        
        let cache = AppURLs.cacheDirectory()

//    file:///Users/gyeongtaenam/Library/Developer/CoreSimulator/Devices/A5CA8BCE-73DD-4F98-A27E-19F9953C8393/data/Containers/Data/Application/B0203287-283B-4EC0-B595-948BC1E439C3/Library/Caches/
//    file:///Users/gyeongtaenam/Library/Developer/CoreSimulator/Devices/A5CA8BCE-73DD-4F98-A27E-19F9953C8393/data/Containers/Data/Application/C1A78432-7D21-4F1F-AE22-1411846ACADE/Library/Caches/
        let doc = AppURLs.documentDirectory()

        XCTAssertEqual(cache.lastPathComponent , expectedCache)
        XCTAssertEqual(doc.lastPathComponent , expectedDocument)

    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
