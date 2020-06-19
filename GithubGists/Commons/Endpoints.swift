//
//  Endpoints.swift
//  GithubGists
//
//  Created by Israel on 19/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation

// Endpoint https://api.github.com/gists/public
// Endpoint Detalhes https://api.github.com/gists/:id

struct Endpoints {
    static let baseUrl = "https://api.github.com/gists"
    static let publicGists = "\(Endpoints.baseUrl)/public?page="
}
