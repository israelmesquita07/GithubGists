//
//  GithubGistsPresenterSpy.swift
//  GithubGistsTests
//
//  Created by Israel on 20/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
@testable import GithubGists

final class GithubGistsPresenterSpy {
    
    var presentGistsCalled: Bool
    var presentErrorCalled: Bool
    var toggleLoadingCalled: Bool
    
    init() {
        presentGistsCalled = false
        presentErrorCalled = false
        toggleLoadingCalled = false
    }
}

//MARK: - GithubGistsPresentationLogic
extension GithubGistsPresenterSpy: GithubGistsPresentationLogic {
    func presentGists(response: GithubGists.List.Response) {
        presentGistsCalled = true
    }
    
    func presentError(title: String, message: String) {
        presentErrorCalled = true
    }
    
    func toggleLoading(_ bool: Bool) {
        toggleLoadingCalled = true
    }
}
