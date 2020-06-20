//
//  GithubGistsPresenterTests.swift
//  GithubGists
//
//  Created by Israel on 20/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import XCTest
@testable import GithubGists

final class GithubGistsPresenterTests: XCTestCase {
    
    var sut: GithubGistsPresenter!
    var viewControllerSpy: GithubGistsViewControllerSpy!
    
    override func setUp() {
        super.setUp()
        sut = GithubGistsPresenter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDisplayGistsCalledInPresentGists() {
        //Arranje
        setupSpies()
        let gist = Gist(id: "", description: "", owner: nil)
        let response = GithubGists.List.Response(gists: [gist])
        //ACT
        sut.presentGists(response: response)
        //Assert
        XCTAssertTrue(viewControllerSpy.displayGistsCalled, "displayGists() should be called in presentGists() from GithubGistsPresenter")
    }
    
    func testDisplayErrorCalledInPresentError() {
        //Arranje
        setupSpies()
        //ACT
        sut.presentError(title: "", message: "")
        //Assert
        XCTAssertTrue(viewControllerSpy.displayErrorCalled, "displayError() should be called in presentError() from GithubGistsPresenter")
    }
    
    func testToggleLoadingCalledInToggleLoading() {
        //Arranje
        setupSpies()
        //ACT
        sut.toggleLoading(false)
        //Assert
        XCTAssertTrue(viewControllerSpy.toggleLoadingCalled, "toggleLoading() should be called in toggleLoading() from GithubGistsPresenter")
    }
}

//MARK: - Spies
extension GithubGistsPresenterTests {
    func setupSpies() {
        viewControllerSpy = GithubGistsViewControllerSpy()
        sut.viewController = viewControllerSpy
    }
}
