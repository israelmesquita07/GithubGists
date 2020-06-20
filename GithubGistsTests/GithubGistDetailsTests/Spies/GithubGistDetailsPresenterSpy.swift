//
//  GithubGistDetailsPresenterSpy.swift
//  GithubGistsTests
//
//  Created by Israel on 20/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
@testable import GithubGists

final class GithubGistDetailsPresenterSpy {
    
    var presentGistDetailsCalled: Bool
    var presentErrorCalled: Bool
    var toggleLoadingCalled: Bool
    
    init() {
        presentGistDetailsCalled = false
        presentErrorCalled = false
        toggleLoadingCalled = false
    }
}

//MARK: - GithubGistDetailsPresentationLogic
extension GithubGistDetailsPresenterSpy: GithubGistDetailsPresentationLogic {
    func presentGistDetails(response: GithubGistDetails.Details.Response) {
        presentGistDetailsCalled = true
    }
    
    func presentError(title: String, message: String) {
        presentErrorCalled = true
    }
    
    func toggleLoading(_ bool: Bool) {
        toggleLoadingCalled = true
    }
}
