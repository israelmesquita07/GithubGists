//
//  GithubGistDetailsViewControllerSpy.swift
//  GithubGistsTests
//
//  Created by Israel on 20/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
@testable import GithubGists

final class GithubGistDetailsViewControllerSpy {
    
    var displayGistDetailsCalled: Bool
    var displayErrorCalled: Bool
    var toggleLoadingCalled: Bool
    
    init() {
        displayGistDetailsCalled = false
        displayErrorCalled = false
        toggleLoadingCalled = false
    }
}

//MARK: - GithubGistDetailsDisplayLogic
extension GithubGistDetailsViewControllerSpy: GithubGistDetailsDisplayLogic {
    func displayGistDetails(viewModel: GithubGistDetails.Details.ViewModel) {
        displayGistDetailsCalled = true
    }
    
    func displayError(title: String, message: String) {
        displayErrorCalled = true
    }
    
    func toggleLoading(_ bool: Bool) {
        toggleLoadingCalled = true
    }
}
