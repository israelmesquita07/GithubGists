//
//  GithubGistsViewController.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol GithubGistsDisplayLogic: class {
    func displaySomething(viewModel: GithubGists.List.ViewModel)
}

final class GithubGistsViewController: UIViewController, GithubGistsDisplayLogic {
    
    var interactor: GithubGistsBusinessLogic?
    var router: (NSObjectProtocol & GithubGistsRoutingLogic & GithubGistsDataPassing)?
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let interactor = GithubGistsInteractor()
        let presenter = GithubGistsPresenter()
        let router = GithubGistsRouter()
        self.interactor = interactor
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGists()
    }
    
    // MARK: - Load Gists
    
    func loadGists() {
        let request = GithubGists.List.Request()
        interactor?.loadGists(request: request)
    }
    
    func displaySomething(viewModel: GithubGists.List.ViewModel) {

    }
}
