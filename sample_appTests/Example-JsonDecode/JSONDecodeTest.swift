//
//  JiJingListQuestionsOneTest.swift
//  sample_appTests
//
//  Created by Work Mac on 20/6/2023.
//

import XCTest
@testable import sample_app


final class JSONDecodeTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testLaunchDecoding() throws {
        guard let url = Bundle.main.url(forResource: "Launch", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                XCTFail("shark-testLaunchDecoding: get bundle failed")
                return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        guard let launch = try? decoder.decode(LaunchDTO.self, from: data) else {
            XCTFail("shark-testLaunchDecoding: decode failed")
            return
        }
        
        XCTAssertEqual(launch.flightNumber, 65)
        XCTAssertEqual(launch.missionName, "Telstar 19V")
        XCTAssertEqual(launch.launchDateUnix, Date(timeIntervalSince1970: 1532238600))
        XCTAssertEqual(launch.launchSuccess, true)
    }
    
    
    
    func testFailed() {
        XCTAssertEqual(1, 5)
    }
    
    func testReviewDecoding() throws {
        guard let url = Bundle.main.url(forResource: "Review", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                XCTFail("shark-testReviewDecoding: get bundle failed")
                return
        }
        
        let decoder = JSONDecoder()
        guard let review = try? decoder.decode(ReviewDTO.self, from: data) else {
            XCTFail("shark-testReviewDecoding: decode failed")
            return
        }
        
        XCTAssertEqual(review.id, 1)
        XCTAssertEqual(review.userName, "Tester")
        XCTAssertEqual(review.fullName, "Jon Doe")
        XCTAssertEqual(review.reviewCount, 4)

        dump(review)

    }

    
    
    func testJiJingDecoding() throws {
        
    }
}
