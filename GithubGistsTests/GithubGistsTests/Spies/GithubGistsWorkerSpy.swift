//
//  GithubGistsWorkerSpy.swift
//  GithubGistsTests
//
//  Created by Israel on 20/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
@testable import GithubGists

final class GithubGistsWorkerSpy {
    
    var fetchGistsCalled: Bool
    
    init() {
        fetchGistsCalled = false
    }
}

//MARK: - ListGistsServicing
extension GithubGistsWorkerSpy: ListGistsServicing {
    func fetchGists(request: GithubGists.List.Request, completion: @escaping (Result<[Gist], RepositoryError>) -> Void) {
        fetchGistsCalled = true
    }
}
