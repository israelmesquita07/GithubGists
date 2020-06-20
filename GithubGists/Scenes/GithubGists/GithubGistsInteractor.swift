//
//  GithubGistsInteractor.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol GithubGistsBusinessLogic {
    func loadGists()
    func refreshGists()
    func fillGistToDetails(gistId: String, description: String)
}

protocol GithubGistsDataStore {
    var gistId: String { get set }
    var description: String { get set }
}

final class GithubGistsInteractor: GithubGistsBusinessLogic, GithubGistsDataStore {
    
    var presenter: GithubGistsPresentationLogic?
    var worker: ListGistsServicing?
    var page = 1, totalPages = Constants.totalPages
    var gists: [Gist] = []
    var gistId = "", description = ""
    
    // MARK: - Load Gists
    
    func loadGists() {
        presenter?.toggleLoading(true)
        page = page > totalPages ? 1 : page
        let request = GithubGists.List.Request(page: page)
        worker = worker ?? GithubGistsWorker()
        worker?.fetchGists(request: request, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let gists):
                self.page += 1
                self.gists += gists
                let response = GithubGists.List.Response(gists: self.gists)
                self.presenter?.presentGists(response: response)
                self.presenter?.toggleLoading(false)
            case .failure(let error):
                print(error.localizedDescription)
                self.presenter?.presentError(title: "Ops!", message: error.localizedDescription)
                self.presenter?.toggleLoading(false)
            }
        })
    }
    
    func refreshGists() {
        page = 1
        gists = []
        loadGists()
    }
    
    func fillGistToDetails(gistId: String, description: String) {
        self.gistId = gistId
        self.description = !description.isEmpty ? description : "No description"
    }
}
