//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by mo3taz on 8/11/21.
//  Copyright © 2021 VL. All rights reserved.
//

import XCTest
@testable import NewsApp
import OHHTTPStubs


class NewsAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        //MARK: - Given
        stub(condition: { (requestURl) -> Bool in
            return requestURl.url?.absoluteString.contains("headlines")  ?? false
        }) { (response) -> HTTPStubsResponse in

            let jsonObject:HeadlinesModel.Response =  HeadlinesModel.Response(status: "ok", totalResults: 70, articles: [HeadlinesModel.Article(source: HeadlinesModel.Source(name: ""), author: "", title: "", articleDescription: "", url: "", urlToImage: "", publishedAt: "", content: "")])

            return HTTPStubsResponse(jsonObject: jsonObject, statusCode: 200, headers: nil)
        }
        var expectedResponse: HeadlinesModel.Response?  = nil
        let exception = self.expectation(description: "calling Api failed !")
        
        //MARK: - When
        let worker: IHeadlinesWorker? = HeadlinesWorker()
        worker?.getFirstFav( complition: { (error, status, response) in
            expectedResponse = response
            exception.fulfill()
        })
        
        //MARK: - Then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(expectedResponse)

//        XCTAssertTrue(expectedResponse?.articles?[0].title == "")
//        XCTAssertEqual(expectedResponse?.teams?.count , 20)
//        XCTAssertEqual(expectedResponse?.teams?[0].name , "")
       
    }
    
    
}
