//
//  GithubGistDetailsViewScreen.swift
//  GithubGists
//
//  Created by Israel on 19/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import UIKit

final class GithubGistDetailsViewScreen: UIView {
    
    // MARK: - View Code
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    lazy var gistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var gistLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 26.0, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup View
    
    private func setupView() {
        addSubview(gistImageView)
        addSubview(gistLabel)
        addSubview(activityIndicator)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gistImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            gistImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            gistImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gistImageView.heightAnchor.constraint(equalToConstant: 400.0),
            
            gistLabel.topAnchor.constraint(equalTo: gistImageView.bottomAnchor, constant: 24.0),
            gistLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            gistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0),
            gistLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setupViewScreen(gist: Gist, gistImage: UIImage) {
        gistImageView.image = gistImage
        gistLabel.text = gist.description
    }
    
    // MARK: - Animation Loading
    
    func toggleLoading(_ bool: Bool) {
        bool ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
}
