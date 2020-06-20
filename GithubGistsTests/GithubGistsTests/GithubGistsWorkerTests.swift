//
//  GithubGistsWorkerTests.swift
//  GithubGists
//
//  Created by Israel on 20/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import XCTest
@testable import GithubGists

final class GithubGistsWorkerTests: XCTestCase {
    
    var sut: GithubGistsWorker!
    
    override func setUp() {
        super.setUp()
        sut = GithubGistsWorker()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchGistsSuccess() {
        //Arranje
        let expectation = XCTestExpectation(description: "gistsExpectation")
        let request = GithubGists.List.Request(page: 1)
        //ACT
        sut.fetchGists(request: request) { result in
            switch result {
            case .success(let gists):
                //Assert
                XCTAssertNotNil(gists, "gists should not be nil")
                expectation.fulfill()
            default:
                break
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFetchHeroImageDecodeError() {
        //Arranje
        let expectation = XCTestExpectation(description: "heroesExpectation")
        let request = GithubGists.List.Request(page: 100000000)
        //ACT
        sut.fetchGists(request: request) { result in
            switch result {
            case .failure(let error):
                if case RepositoryError.decodeError = error {
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
