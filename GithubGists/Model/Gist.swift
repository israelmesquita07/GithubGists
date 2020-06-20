//
//  Gist.swift
//  GithubGists
//
//  Created by Israel on 19/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation

struct Gist: Decodable {
    let id: String?
    let description: String?
    let owner: Owner?
}

struct Owner: Decodable {
    let login: String
    let avatarUrl: String
}
