//
//  GithubGistsRouter.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

@objc protocol GithubGistsRoutingLogic {
    func routeToDetails()
}

protocol GithubGistsDataPassing {
    var dataStore: GithubGistsDataStore? { get }
}

final class GithubGistsRouter: NSObject, GithubGistsRoutingLogic, GithubGistsDataPassing {
    
    weak var viewController: GithubGistsViewController?
    var dataStore: GithubGistsDataStore?
    
    // MARK: - Routing
    
    func routeToDetails() {
        let destinationVC = GithubGistDetailsViewController()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToDetails(source: dataStore!, destination: &destinationDS)
        navigateToDetails(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation
    
    func navigateToDetails(source: GithubGistsViewController,
                           destination: GithubGistDetailsViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToDetails(source: GithubGistsDataStore, destination: inout GithubGistDetailsDataStore) {
        destination.gistId = source.gistId
        destination.description = source.description
    }
}
