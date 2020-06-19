//
//  Gist.swift
//  GithubGists
//
//  Created by Israel on 19/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation

struct Gist: Decodable {
    let id: String
    let description: String?
    let owner: Owner
}

struct Owner: Decodable {
    let login: String
    let avatarUrl: String
}

/*
 "id": "360e3cf6431f36f60605fc2d3e0b1fcc",
 "description": "Parsing of URLs using bash sh scripting",
 owner": {
    "login": "tamalsaha",
    "avatar_url": "https://avatars1.githubusercontent.com/u/94814?v=4",
 }
 */


// Endpoint https://api.github.com/gists/public
// Endpoint Detalhes https://api.github.com/gists/:id

/*
 "description": "Parsing of URLs using bash sh scripting",
 owner": {
    "login": "joshisa",
    "avatar_url": "https://avatars3.githubusercontent.com/u/1133849?v=4"
 }
 */
