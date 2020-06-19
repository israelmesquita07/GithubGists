//
//  GithubGistsPresenter.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol GithubGistsPresentationLogic {
    func presentGists(response: GithubGists.List.Response)
    func presentError(title: String, message: String)
    func toggleLoading(_ bool: Bool)
}

final class GithubGistsPresenter: GithubGistsPresentationLogic {
    
    weak var viewController: GithubGistsDisplayLogic?
    
    // MARK: - Present Gists
    
    func presentGists(response: GithubGists.List.Response) {
        let viewModel = GithubGists.List.ViewModel(gists: response.gists)
        viewController?.displayGists(viewModel: viewModel)
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
