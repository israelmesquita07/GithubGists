//
//  GithubGistDetailsRouter.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol GithubGistDetailsDataPassing {
    var dataStore: GithubGistDetailsDataStore? { get }
}

final class GithubGistDetailsRouter: NSObject, GithubGistDetailsDataPassing {
    
    weak var viewController: GithubGistDetailsViewController?
    var dataStore: GithubGistDetailsDataStore?
}
