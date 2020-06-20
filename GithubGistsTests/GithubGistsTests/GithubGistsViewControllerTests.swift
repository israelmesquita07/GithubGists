//
//  GithubGistsViewControllerTests.swift
//  GithubGists
//
//  Created by Israel on 20/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import XCTest
@testable import GithubGists

final class GithubGistsViewControllerTests: XCTestCase {
    
    var sut: GithubGistsViewController!
    var interactorSpy: GithubGistsInteractorSpy!
    
    override func setUp() {
        super.setUp()
        sut = GithubGistsViewController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testLoadGistsCalledInViewDidLoad() {
        //Arranje
        setupSpies()
        //ACT
        sut.viewDidLoad()
        //Assert
        XCTAssertTrue(interactorSpy.loadGistsCalled, "loadGists() should be called in viewDidLoad() from GithubGistsViewController")
    }
    
    func testRefreshGistsCalledInRefreshGists() {
        //Arranje
        setupSpies()
        //ACT
        sut.refreshGists()
        //Assert
        XCTAssertTrue(interactorSpy.refreshGistsCalled, "refreshGists() should be called in refreshGists() from GithubGistsViewController")
    }
    
    func testFillGistToDetailsCalledInDidSelectRowAt() {
        //Arranje
        setupSpies()
        //ACT
        sut.didSelectRowAt(gistsId: "", description: "")
        //Assert
        XCTAssertTrue(interactorSpy.fillGistToDetailsCalled, "fillGistToDetails() should be called in didSelectRowAt() from GithubGistsViewController")
    }
}

//MARK: - Spies
extension GithubGistsViewControllerTests {
    func setupSpies() {
        interactorSpy = GithubGistsInteractorSpy()
        sut.interactor = interactorSpy
    }
}
