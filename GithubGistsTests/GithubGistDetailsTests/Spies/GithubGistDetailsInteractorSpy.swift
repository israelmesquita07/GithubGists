//
//  GithubGistDetailsInteractorSpy.swift
//  GithubGistsTests
//
//  Created by Israel on 20/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
@testable import GithubGists

final class GithubGistDetailsInteractorSpy {
    
    var loadGistDetailsCalled: Bool
    
    init() {
        loadGistDetailsCalled = false
    }
}

//MARK: - GithubGistDetailsBusinessLogic
extension GithubGistDetailsInteractorSpy: GithubGistDetailsBusinessLogic {
    func loadGistDetails() {
        loadGistDetailsCalled = true
    }
}
