//
//  GithubGistsInteractorSpy.swift
//  GithubGistsTests
//
//  Created by Israel on 20/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
@testable import GithubGists

final class GithubGistsInteractorSpy {
    
    var loadGistsCalled: Bool
    var refreshGistsCalled: Bool
    var fillGistToDetailsCalled: Bool
    
    init() {
        loadGistsCalled = false
        refreshGistsCalled = false
        fillGistToDetailsCalled = false
    }
}

//MARK: - GithubGistsBusinessLogic
extension GithubGistsInteractorSpy: GithubGistsBusinessLogic {
    func loadGists() {
        loadGistsCalled = true
    }
    
    func refreshGists() {
        refreshGistsCalled = true
    }
    
    func fillGistToDetails(gistId: String, description: String) {
        fillGistToDetailsCalled = true
    }
}
