//
//  DisplayNewyorkSchoolsTests.swift
//  DisplayNewyorkSchoolsTests
//
//  Created by Phanindra Kumar Tanniru on 2/22/24.
//

import XCTest
@testable import DisplayNewyorkSchools

final class DisplayNewyorkSchoolsTests: XCTestCase {
    
    var newyorkSchoolViewModel: NewYorkSchoolViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let mockDataManager = NewyorkSchoolsMockDataManager()
        newyorkSchoolViewModel = NewYorkSchoolViewModel(dataManager: mockDataManager)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        newyorkSchoolViewModel = nil
    }
    
    func testNewyorkSchoolsModelData() {
        
        newyorkSchoolViewModel?.fetchNewYorkSchools()
        XCTAssertEqual(newyorkSchoolViewModel?.newyorkSchoolModelList.count, 4)
        XCTAssertEqual(newyorkSchoolViewModel?.newyorkSchoolModelList.first?.school_name, "Clinton School Writers & Artists, M.S. 260")
       
    }
    
    func testNewyorkSchoolDetailData() {
        
        newyorkSchoolViewModel?.fetchNewYorkSchools()
        XCTAssertEqual(newyorkSchoolViewModel?.newyorkSchoolModelList.first?.dbn, "02M260")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
