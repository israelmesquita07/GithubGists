//
//  GithubGistDetailsWorker.swift
//  GithubGists
//
//  Created by Israel on 18/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol FetchGistDetailsServicing {
    func fetchGistDetails(request: GithubGistDetails.Details.Request, completion: @escaping(Result<Gist,RepositoryError>) -> Void)
    func fetchGistImage(url: String, completion: @escaping(Result<UIImage,RepositoryError>) -> Void)
}

final class GithubGistDetailsWorker: FetchGistDetailsServicing {
    
    func fetchGistDetails(request: GithubGistDetails.Details.Request, completion: @escaping(Result<Gist,RepositoryError>) -> Void) {
        guard let url = URL(string: "\(Endpoints.baseUrl)\(request.id)") else {
            completion(.failure(.invalidUrl))
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.internetFailure))
                }
                return
            }
            do {
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion(.failure(.internetFailure))
                    }
                    return
                }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decoded = try decoder.decode(Gist.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(.decodeError(error)))
                }
            }
        }
        dataTask.resume()
    }
    
    func fetchGistImage(url: String, completion: @escaping(Result<UIImage,RepositoryError>) -> Void) {
        guard let urlImage = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        let dataTask = URLSession.shared.dataTask(with: urlImage, completionHandler: { (data, _, error) in
            if error == nil, let data = data {
                guard let image = UIImage(data: data) else {
                    completion(.failure(.internetFailure))
                    return
                }
                DispatchQueue.main.async {
                    completion(.success(image))
                }
            } else {
                completion(.failure(.internetFailure))
            }
        })
        dataTask.resume()
    }
}
