//
//  GithubGistDetailsViewControllerTests.swift
//  GithubGists
//
//  Created by Israel on 20/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import XCTest
@testable import GithubGists

final class GithubGistDetailsViewControllerTests: XCTestCase {
    
    var sut: GithubGistDetailsViewController!
    var interactorSpy: GithubGistDetailsInteractorSpy!
    
    override func setUp() {
        super.setUp()
        sut = GithubGistDetailsViewController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testLoadGistDetailsCalledInViewWillAppear() {
        //Arranje
        setupSpies()
        //ACT
        sut.viewWillAppear(false)
        //Assert
        XCTAssertTrue(interactorSpy.loadGistDetailsCalled, "loadGistDetails() should be called in viewDidLoad() from GithubGistDetailsViewController")
    }
}

//MARK: - Spies
extension GithubGistDetailsViewControllerTests {
    func setupSpies() {
        interactorSpy = GithubGistDetailsInteractorSpy()
        sut.interactor = interactorSpy
    }
}
