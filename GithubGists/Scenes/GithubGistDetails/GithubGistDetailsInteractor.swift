//
//  GithubGistDetailsInteractor.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol GithubGistDetailsBusinessLogic {
    func doSomething(request: GithubGistDetails.Something.Request)
}

protocol GithubGistDetailsDataStore {
    //var name: String { get set }
}

class GithubGistDetailsInteractor: GithubGistDetailsBusinessLogic, GithubGistDetailsDataStore {
    
    var presenter: GithubGistDetailsPresentationLogic?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: GithubGistDetails.Something.Request) {
        let worker = GithubGistDetailsWorker()
        worker.doSomeWork()
        
        let response = GithubGistDetails.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
