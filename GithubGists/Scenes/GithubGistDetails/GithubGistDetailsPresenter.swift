//
//  GithubGistDetailsPresenter.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates and
//  edited by Israel Mesquita.
//  So you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol GithubGistDetailsPresentationLogic {
    func presentSomething(response: GithubGistDetails.Something.Response)
}

class GithubGistDetailsPresenter: GithubGistDetailsPresentationLogic {
    
    weak var viewController: GithubGistDetailsDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: GithubGistDetails.Something.Response) {
        let viewModel = GithubGistDetails.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
