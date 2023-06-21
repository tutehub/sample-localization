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
        guard let url = Bundle.main.url(forResource: "JiJingListQuestionsOneData", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                XCTFail("shark-JiJingListQuestionsOneData: get bundle failed")
                return
        }
        
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(JiJingListQuestionsOneDTO.self, from: data) else {
            XCTFail("shark-JiJingListQuestionsOneData: decode failed")
            return
        }
        
        XCTAssertEqual(result.code, "810")
        XCTAssertEqual(result.information, "Question is successfully fetched!")
        XCTAssertEqual(result.object[0].slug, "ra-697")
        XCTAssertEqual(result.object[0].title, "Supermassive Black Hole")
        XCTAssertEqual(result.object[0].isCollected, true )
        XCTAssertEqual(result.object[0].star, 1 )
        XCTAssertEqual(result.object[0].hasCourse, false )


    }
    
    func testTmp1Decoding() throws {
        guard let url = Bundle.main.url(forResource: "Tmp1", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                XCTFail("shark-TmpDTO: get bundle failed")
                return
        }
        
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TmpOneDTO.self, from: data) else {
            XCTFail("shark-TmpDTO: decode failed")
            return
        }
        
        XCTAssertEqual(result.code, "810")
        XCTAssertEqual(result.information, "Question is successfully fetched!")
        XCTAssertEqual(result.object.content, "content")

    }
    
    
    func testTmp2Decoding() throws {
        guard let url = Bundle.main.url(forResource: "Tmp2", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                XCTFail("shark-TmpDTO: get bundle failed")
                return
        }
        
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(TmpTwoDTO.self, from: data) else {
            XCTFail("shark-TmpDTO: decode failed")
            return
        }
        
        XCTAssertEqual(result.code, "810")
        XCTAssertEqual(result.information, "Question is successfully fetched!")
        XCTAssertEqual(result.object[0].id, 1)
        XCTAssertEqual(result.object[0].title, "Domestication")

    }
}
