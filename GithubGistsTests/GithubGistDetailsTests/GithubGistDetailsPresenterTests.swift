//
//  GithubGistDetailsPresenterTests.swift
//  GithubGists
//
//  Created by Israel on 20/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import XCTest
@testable import GithubGists

final class GithubGistDetailsPresenterTests: XCTestCase {
    
    var sut: GithubGistDetailsPresenter!
    var viewControllerSpy: GithubGistDetailsViewControllerSpy!
    
    override func setUp() {
        super.setUp()
        sut = GithubGistDetailsPresenter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDisplayGistDetailsCalledInPresentGistDetails() {
        //Arranje
        setupSpies()
        let gist = Gist(id: "", description: "", owner: nil)
        let response = GithubGistDetails.Details.Response(gist: gist, gistImage: UIImage())
        //ACT
        sut.presentGistDetails(response: response)
        //Assert
        XCTAssertTrue(viewControllerSpy.displayGistDetailsCalled, "displayGistDetails() should be called in presentGistDetails() from GithubGistDetailsPresenter")
    }
    
    func testDisplayErrorCalledInPresentError() {
        //Arranje
        setupSpies()
        //ACT
        sut.presentError(title: "", message: "")
        //Assert
        XCTAssertTrue(viewControllerSpy.displayErrorCalled, "displayError() should be called in presentError() from GithubGistDetailsPresenter")
    }
    
    func testToggleLoadingCalledInToggleLoading() {
        //Arranje
        setupSpies()
        //ACT
        sut.toggleLoading(false)
        //Assert
        XCTAssertTrue(viewControllerSpy.toggleLoadingCalled, "toggleLoading() should be called in toggleLoading() from GithubGistDetailsPresenter")
    }
}

//MARK: - Spies
extension GithubGistDetailsPresenterTests {
    func setupSpies() {
        viewControllerSpy = GithubGistDetailsViewControllerSpy()
        sut.viewController = viewControllerSpy
    }
}
