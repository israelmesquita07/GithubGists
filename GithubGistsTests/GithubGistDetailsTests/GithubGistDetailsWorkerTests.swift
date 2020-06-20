//
//  GithubGistDetailsWorkerTests.swift
//  GithubGists
//
//  Created by Israel on 20/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import XCTest
@testable import GithubGists

final class GithubGistDetailsWorkerTests: XCTestCase {
    
    var sut: GithubGistDetailsWorker!
    
    override func setUp() {
        super.setUp()
        sut = GithubGistDetailsWorker()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchGistsSuccess() {
        //Arranje
        let expectation = XCTestExpectation(description: "gistsExpectation")
        let request = GithubGistDetails.Details.Request(id: "e969824d6937204c11879f6c04a4f07b")
        //ACT
        sut.fetchGistDetails(request: request) { result in
            switch result {
            case .success(let gists):
                //Assert
                XCTAssertNotNil(gists, "gists should not be nil")
                expectation.fulfill()
            default:
                break
            }
        }
        wait(for: [expectation], timeout: 20.0)
    }
    
//    func testFetchGistsDecodeError() {
//        //Arranje
//        let expectation = XCTestExpectation(description: "gistsExpectation")
//        let request = GithubGistDetails.Details.Request(id: "AAAAA")
//        //ACT
//        sut.fetchGistDetails(request: request) { result in
//            switch result {
//            case .failure(let error):
//                if case RepositoryError.invalidUrl = error {
//                    //Assert
//                    XCTAssertNotNil(error, "error invalidUrl should not be nil")
//                    expectation.fulfill()
//                }
//            default:
//                break
//            }
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
    
    func testFetchGistImageSuccess() {
        //Arranje
        let expectation = XCTestExpectation(description: "gistsExpectation")
        //ACT
        sut.fetchGistImage(url: "https://avatars3.githubusercontent.com/u/53276111?v=4") { result in
            switch result {
            case .success(let image):
                //Assert
                XCTAssertNotNil(image, "image should not be nil")
                expectation.fulfill()
            default:
                break
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFetchGistImageError() {
        //Arranje
        let expectation = XCTestExpectation(description: "gistsExpectation")
        //ACT
        sut.fetchGistImage(url: "") { result in
            switch result {
            case .failure(let error):
                if case RepositoryError.invalidUrl = error {
                    //Assert
                    XCTAssertNotNil(error, "error invalidUrl should not be nil")
                    expectation.fulfill()
                }
            default:
                break
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
