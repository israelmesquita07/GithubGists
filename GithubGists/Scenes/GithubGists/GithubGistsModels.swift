//
//  GithubGistsModels.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

enum GithubGists {
    // MARK: Use cases
    
    enum List {
        
        struct Request {
            let page: Int
        }
        
        struct Response {
            let gists: [Gist]
        }
        
        struct ViewModel {
            let gists: [Gist]
        }
    }
}
