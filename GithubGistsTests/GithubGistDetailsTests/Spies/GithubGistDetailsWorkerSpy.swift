//
//  GithubGistDetailsWorkerSpy.swift
//  GithubGistsTests
//
//  Created by Israel on 20/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import UIKit
@testable import GithubGists

final class GithubGistDetailsWorkerSpy {
    
    var fetchGistDetailsCalled: Bool
    var fetchGistImageCalled: Bool
    
    init() {
        fetchGistDetailsCalled = false
        fetchGistImageCalled = false
    }
}

//MARK: - FetchGistDetailsServicing
extension GithubGistDetailsWorkerSpy: FetchGistDetailsServicing {
    func fetchGistDetails(request: GithubGistDetails.Details.Request, completion: @escaping (Result<Gist, RepositoryError>) -> Void) {
        fetchGistDetailsCalled = true
    }
    
    func fetchGistImage(url: String, completion: @escaping (Result<UIImage, RepositoryError>) -> Void) {
        fetchGistImageCalled = true
    }
}
