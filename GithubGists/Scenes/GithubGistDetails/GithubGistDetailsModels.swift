//
//  GithubGistDetailsModels.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

enum GithubGistDetails {
    // MARK: Use cases
    
    enum Details {
        
        struct Request {
            let id: String
        }
        
        struct Response {
            let gist: Gist
            let gistImage: UIImage
        }
        
        struct ViewModel {
            let gist: Gist
            let gistImage: UIImage
        }
    }
}
