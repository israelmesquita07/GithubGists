//
//  GithubGistsInteractorTests.swift
//  GithubGists
//
//  Created by Israel on 20/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import XCTest
@testable import GithubGists

final class GithubGistsInteractorTests: XCTestCase {
    
    var sut: GithubGistsInteractor!
    var presenterSpy: GithubGistsPresenterSpy!
    var workerSpy: GithubGistsWorkerSpy!
    
    override func setUp() {
        super.setUp()
        sut = GithubGistsInteractor()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testToggleLoadingCalledInLoadGists() {
        //Arranje
        setupSpies()
        //ACT
        sut.loadGists()
        //Assert
        XCTAssertTrue(presenterSpy.toggleLoadingCalled, "toggleLoading() should be called in loadGists() from GithubGistsInteractor")
    }
    
    func testFetchGistsCalledInLoadGists() {
        //Arranje
        setupSpies()
        //ACT
        sut.loadGists()
        //Assert
        XCTAssertTrue(workerSpy.fetchGistsCalled, "fetchGists() should be called in loadGists() from GithubGistsInteractor")
    }
    
    func testFillGistToDetails() {
        //Arranje
        //ACT
        sut.fillGistToDetails(gistId: "", description: "")
        //Assert
        XCTAssertNotNil(sut.gistId, "gistId should be nil when fillGistToDetails() from GithubGistsInteractor is called")
        XCTAssertNotNil(sut.description, "description should be nil when fillGistToDetails() from GithubGistsInteractor is called")
    }
    
    func testResetVariablesInRefreshGists() {
        //Arranje
        //ACT
        sut.refreshGists()
        //Assert
        XCTAssertEqual(sut.page, 1, "sut.page should be equal to 1 in refreshGists() from GithubGistsInteractor")
        XCTAssertEqual(sut.gists.count, 0, "sut.gists.count should be equal to 0 in refreshGists() from GithubGistsInteractor")
    }
}

//MARK: - Spies
extension GithubGistsInteractorTests {
    func setupSpies() {
        workerSpy = GithubGistsWorkerSpy()
        sut.worker = workerSpy
        presenterSpy = GithubGistsPresenterSpy()
        sut.presenter = presenterSpy
    }
}
