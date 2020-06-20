//
//  GithubGistDetailsPresenter.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol GithubGistDetailsPresentationLogic {
    func presentGistDetails(response: GithubGistDetails.Details.Response)
    func presentError(title: String, message: String)
    func toggleLoading(_ bool: Bool)
}

class GithubGistDetailsPresenter: GithubGistDetailsPresentationLogic {
    
    weak var viewController: GithubGistDetailsDisplayLogic?
    
    // MARK: - Present Gist Details
    
    func presentGistDetails(response: GithubGistDetails.Details.Response) {
        let viewModel = GithubGistDetails.Details.ViewModel(gist: response.gist, gistImage: response.gistImage)
        viewController?.displayGistDetails(viewModel: viewModel)
    }
    
    // MARK: - Present Error
    
    func presentError(title: String, message: String) {
        viewController?.displayError(title: title, message: message)
    }
    
    // MARK: - Toggle Loading
    
    func toggleLoading(_ bool: Bool) {
        viewController?.toggleLoading(bool)
    }
}
