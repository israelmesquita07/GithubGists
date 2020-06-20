//
//  GithubGistsViewScreen.swift
//  GithubGists
//
//  Created by Israel on 19/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import UIKit

protocol ViewScreenDelegating: AnyObject {
    func didSelectRowAt(gistsId: String, description: String)
    func notifyTableViewEnds()
    func refreshGists()
}

final class GithubGistsViewScreen: UIView {

    weak var delegate: ViewScreenDelegating?
    var gists: [Gist] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - View Code

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Atualizando repositórios...")
        refreshControl.addTarget(self, action: #selector(refreshItems(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.refreshControl = refreshControl
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120.0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(GithubGistsTableViewCell.self, forCellReuseIdentifier: String(describing: GithubGistsTableViewCell.self))
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    // MARK: - Init
    
    init(delegate: ViewScreenDelegating) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(tableView)
        addSubview(activityIndicator)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    // MARK: - Animation Loading
    
    func startLoading() {
        activityIndicator.startAnimating()
        tableView.addSubview(activityIndicator)
        tableView.isUserInteractionEnabled = false
    }
    
    func stopLoading() {
        refreshControl.endRefreshing()
        activityIndicator.stopAnimating()
        tableView.isUserInteractionEnabled = true
    }
    
    @objc private func refreshItems(_ sender: Any) {
        delegate?.refreshGists()
    }
}

//MARK: - UITableViewDataSource
extension GithubGistsViewScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GithubGistsTableViewCell.self), for: indexPath) as? GithubGistsTableViewCell else {
            return UITableViewCell()
        }
        let gist = gists[indexPath.row]
        if let owner = gist.owner {
            cell.setupCell(owner)
        }
        return cell
    }
}

//MARK: - UITableViewDelegate
extension GithubGistsViewScreen: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gist = gists[indexPath.row]
        delegate?.didSelectRowAt(gistsId: gist.id ?? "", description: gist.description ?? "")
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == gists.count - 2 && !activityIndicator.isAnimating {
            delegate?.notifyTableViewEnds()
        }
    }
}
