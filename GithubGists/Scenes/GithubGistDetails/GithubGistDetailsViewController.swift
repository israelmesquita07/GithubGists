//
//  GithubGistDetailsViewController.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol GithubGistDetailsDisplayLogic: class {
    func displayGistDetails(viewModel: GithubGistDetails.Details.ViewModel)
    func displayError(title: String, message: String)
    func toggleLoading(_ bool: Bool)
}

final class GithubGistDetailsViewController: UIViewController {
    
    var interactor: GithubGistDetailsBusinessLogic?
    var router: (NSObjectProtocol & GithubGistDetailsDataPassing)?
    lazy var viewScreen = GithubGistDetailsViewScreen()
    
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
        let interactor = GithubGistDetailsInteractor()
        let presenter = GithubGistDetailsPresenter()
        let router = GithubGistDetailsRouter()
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
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadGistDetails()
    }
    
    // MARK: - Setup View

    private func configureView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        setupViewScreen()
    }
    
    private func setupViewScreen() {
        viewScreen.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewScreen)
        NSLayoutConstraint.activate([
            viewScreen.topAnchor.constraint(equalTo: view.topAnchor),
            viewScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Load Gist Details
    
    func loadGistDetails() {
        interactor?.loadGistDetails()
    }
    
    // MARK: - Show Message

    private func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true) {
            self.popViewController()
        }
    }
    
    private func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - GithubGistDetailsDisplayLogic
extension GithubGistDetailsViewController: GithubGistDetailsDisplayLogic {
    func displayGistDetails(viewModel: GithubGistDetails.Details.ViewModel) {
        title = viewModel.gist.owner?.login
        viewScreen.setupViewScreen(gist: viewModel.gist, gistImage: viewModel.gistImage)
    }
    
    func displayError(title: String, message: String) {
        showMessage(title: title, message: message)
    }
    
    func toggleLoading(_ bool: Bool) {
        viewScreen.toggleLoading(bool)
    }
}
