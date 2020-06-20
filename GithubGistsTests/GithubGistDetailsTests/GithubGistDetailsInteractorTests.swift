//
//  GithubGistDetailsInteractorTests.swift
//  GithubGists
//
//  Created by Israel on 20/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import XCTest
@testable import GithubGists

final class GithubGistDetailsInteractorTests: XCTestCase {
    
    var sut: GithubGistDetailsInteractor!
    var presenterSpy: GithubGistDetailsPresenterSpy!
    var workerSpy: GithubGistDetailsWorkerSpy!
    
    override func setUp() {
        super.setUp()
        sut = GithubGistDetailsInteractor()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testToggleLoadingCalledInLoadGistsDetails() {
        //Arranje
        setupSpies()
        //ACT
        sut.loadGistDetails()
        //Assert
        XCTAssertTrue(presenterSpy.toggleLoadingCalled, "toggleLoading() should be called in loadGists() from GithubGistsInteractor")
    }
    
    func testPresentErrorCalledInLoadGistsDetails() {
        //Arranje
        setupSpies()
        //ACT
        sut.loadGistDetails()
        //Assert
        XCTAssertTrue(presenterSpy.presentErrorCalled, "presentError() should be called in loadGists() from GithubGistsInteractor when gistId is empty")
    }
    
    func testFetchGistDetailsCalledInLoadGistsDetails() {
        //Arranje
        setupSpies()
        sut.gistId = "e969824d6937204c11879f6c04a4f07b"
        //ACT
        sut.loadGistDetails()
        //Assert
        XCTAssertTrue(workerSpy.fetchGistDetailsCalled, "fetchGistDetails() should be called in loadGists() from GithubGistsInteractor")
    }
}

//MARK: - Spies
extension GithubGistDetailsInteractorTests {
    func setupSpies() {
        workerSpy = GithubGistDetailsWorkerSpy()
        sut.worker = workerSpy
        presenterSpy = GithubGistDetailsPresenterSpy()
        sut.presenter = presenterSpy
    }
}
