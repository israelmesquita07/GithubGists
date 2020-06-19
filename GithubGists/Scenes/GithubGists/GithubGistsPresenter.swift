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
}

final class GithubGistsPresenter: GithubGistsPresentationLogic {
    
    weak var viewController: GithubGistsDisplayLogic?
    
    // MARK: - Present Gists
    
    func presentGists(response: GithubGists.List.Response) {
        let viewModel = GithubGists.List.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
