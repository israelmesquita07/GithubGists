//
//  GithubGistDetailsInteractor.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol GithubGistDetailsBusinessLogic {
    func loadGistDetails()
}

protocol GithubGistDetailsDataStore {
    var gistId: String? { get set }
    var description: String? { get set }
}

final class GithubGistDetailsInteractor: GithubGistDetailsBusinessLogic, GithubGistDetailsDataStore {
    
    var presenter: GithubGistDetailsPresentationLogic?
    var worker: FetchGistDetailsServicing?
    var gistId: String?
    var description: String?
    
    // MARK: - Load Gist Details
    
    func loadGistDetails() {
        self.presenter?.toggleLoading(true)
        guard let gistId = gistId, !gistId.isEmpty else {
            self.presenter?.presentError(title: "Ops!", message: "Ocorreu um erro")
            self.presenter?.toggleLoading(false)
            return
        }
        let request = GithubGistDetails.Details.Request(id: gistId)
        worker = worker ?? GithubGistDetailsWorker()
        worker?.fetchGistDetails(request: request, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let gist):
                self.loadGistImage(gist)
            case .failure(let error):
                self.presenter?.presentError(title: "Ops!", message: error.localizedDescription)
                self.presenter?.toggleLoading(false)
            }
        })
    }
    
    private func loadGistImage(_ gist: Gist) {
        guard let owner = gist.owner, let description = description else {
            presenter?.presentError(title: "Ops!", message: "Ocorreu um erro!")
            presenter?.toggleLoading(false)
            return
        }
        worker = worker ?? GithubGistDetailsWorker()
        worker?.fetchGistImage(url: owner.avatarUrl) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let image):
                let gistDetails = Gist(id: gist.id, description: description, owner: gist.owner)
                let response = GithubGistDetails.Details.Response(gist: gistDetails, gistImage: image)
                self.presenter?.presentGistDetails(response: response)
                self.presenter?.toggleLoading(false)
            case .failure(let error):
                self.presenter?.presentError(title: "Ops!", message: error.localizedDescription)
                self.presenter?.toggleLoading(false)
            }
        }
    }
}
