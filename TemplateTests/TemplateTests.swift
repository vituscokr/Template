//
//  TemplateTests.swift
//  TemplateTests
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import XCTest
import SwiftUI
import ViewInspector

//ViewInspector spm github 주소
// https://github.com/nalexn/ViewInspector

@testable import Template

class TemplateTests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
    
    func testViewInspectorBaseline() throws {
        let expected = "It lives"
        let sut = Text(expected)
        let value = try sut.inspect().text().string()
        
        XCTAssertEqual(value, expected)
        
    }
    
    
    func testLoginDefaultText() throws {
        
        
        let view = LoginView()
        let button = try view.inspect()
        
        
        
        print(button)
        
        
        //XCTAssertEqual(try button.id(), 1)

        
        
        
        
        
        
        
        
//        let view = LoginView(id:"test", pw: "pass" )
//
//
////        let button = try view.inspect().button().find(viewWithId: "login")
////
////        button.tap()
////
//
//        print(view.isLogin)
//
//
//
//        XCTAssert(view.isLogin)
//
        
        
  
//        view.id = "test"
//        view.pw = "pass"
        
        
        
        
        
//       let button = try view.inspect().button().find(viewWithId: "login")
//
//
//        button.tap()
        
        
//        //let id = try view.inspect().textField().find(viewWithId: "id")
//
//        button.tap()
//
//
//        let text = try view.inspect().text().find(viewWithId: "isLogin")
//
//
//        text.is
//        let pw = try view.inspect().textField(1)
//
//
//
//        //let tf = try view.inspect().textField()
//
//
//
//
//
//        print(view)
//
//        print(id)
//        print(pw)
        
        
        
        
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
