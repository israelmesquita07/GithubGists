//
//  GithubGistsInteractor.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol GithubGistsBusinessLogic {
    func loadGists(request: GithubGists.List.Request)
}

protocol GithubGistsDataStore {
    //var name: String { get set }
}

final class GithubGistsInteractor: GithubGistsBusinessLogic, GithubGistsDataStore {
    
    var presenter: GithubGistsPresentationLogic?
    //var name: String = ""
    
    // MARK: Do something
    
    func loadGists(request: GithubGists.List.Request) {
        let worker = GithubGistsWorker()
        worker.fetchGists()
        
        let response = GithubGists.List.Response()
        presenter?.presentGists(response: response)
    }
}
