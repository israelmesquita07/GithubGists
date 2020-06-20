//
//  GithubGistsViewControllerSpy.swift
//  GithubGistsTests
//
//  Created by Israel on 20/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
@testable import GithubGists

final class GithubGistsViewControllerSpy {
    
    var displayGistsCalled: Bool
    var displayErrorCalled: Bool
    var toggleLoadingCalled: Bool
    
    init() {
        displayGistsCalled = false
        displayErrorCalled = false
        toggleLoadingCalled = false
    }
}

//MARK: - GithubGistsDisplayLogic
extension GithubGistsViewControllerSpy: GithubGistsDisplayLogic {
    func displayGists(viewModel: GithubGists.List.ViewModel) {
        displayGistsCalled = true
    }
    
    func displayError(title: String, message: String) {
        displayErrorCalled = true
    }
    
    func toggleLoading(_ bool: Bool) {
        toggleLoadingCalled = true
    }
}
