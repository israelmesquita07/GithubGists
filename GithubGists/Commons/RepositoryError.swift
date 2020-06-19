//
//  RepositoryError.swift
//  GithubGists
//
//  Created by Israel on 19/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation

enum RepositoryError: Error {
    case invalidUrl
    case internetFailure
    case decodeError(Error)
    
    var localizedDescription: String {
        switch self {
        case .internetFailure:
            return "Sua internet está instável"
        default:
            return "Ocorreu um erro!"
        }
    }
}
