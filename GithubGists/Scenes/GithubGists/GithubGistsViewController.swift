//
//  GithubGistsViewController.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol GithubGistsDisplayLogic: class {
    func displayGists(viewModel: GithubGists.List.ViewModel)
    func displayError(title: String, message: String)
    func toggleLoading(_ bool: Bool)
}

final class GithubGistsViewController: UIViewController {
    
    var interactor: GithubGistsBusinessLogic?
    var router: (NSObjectProtocol & GithubGistsRoutingLogic & GithubGistsDataPassing)?
    lazy var viewScreen = GithubGistsViewScreen(delegate: self)
    
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
        configureView()
        loadGists()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Setup View

    private func configureView() {
        title = "Gists Repositories"
        view.backgroundColor = .white
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
    
    // MARK: - Load Gists
    
    func loadGists() {
        interactor?.loadGists()
    }
   
    // MARK: - Show Message

    private func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


//MARK: - GithubGistsDisplayLogic
extension GithubGistsViewController: GithubGistsDisplayLogic {
    func displayGists(viewModel: GithubGists.List.ViewModel) {
        viewScreen.gists = viewModel.gists
    }
    
    func displayError(title: String, message: String) {
        showMessage(title: title, message: message)
    }
    
    func toggleLoading(_ bool: Bool) {
        if bool {
            viewScreen.startLoading()
            return
        }
        viewScreen.stopLoading()
    }
}

//MARK: - ViewScreenDelegating
extension GithubGistsViewController: ViewScreenDelegating {
    func notifyTableViewEnds() {
        loadGists()
    }
    
    func refreshGists() {
        interactor?.refreshGists()
    }
    
    func didSelectRowAt(gistsId: String, description: String) {
        interactor?.fillGistToDetails(gistId: gistsId, description: description)
        router?.routeToDetails()
    }
}
