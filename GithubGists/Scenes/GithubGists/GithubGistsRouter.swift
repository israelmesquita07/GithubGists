//
//  GithubGistsRouter.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

@objc protocol GithubGistsRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol GithubGistsDataPassing {
    var dataStore: GithubGistsDataStore? { get }
}

final class GithubGistsRouter: NSObject, GithubGistsRoutingLogic, GithubGistsDataPassing {
    
    weak var viewController: GithubGistsViewController?
    var dataStore: GithubGistsDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: GithubGistsViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: GithubGistsDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
