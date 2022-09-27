//
//  DataApi.swift
//  GitHubUsers
//
//  Created by CHRISTOPHE LEHOUSSINE on 27/09/2022.
//

import Foundation

struct User: Decodable {
    let avatar_url: String
    let name: String
    let public_repos: Int
    let public_gists: Int
    let followers: Int
    let following: Int
}


func getUserDetail(userName: String) async throws -> (User) {
    guard let url = URL(string: "https://api.github.com/users/\(userName)")
    else {
        fatalError("Missing URL")
    }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    guard (response as? HTTPURLResponse)?.statusCode == 200
    else {
        fatalError("Error while fetching data")
    }
    let user = try JSONDecoder().decode(User.self, from: data)
    print(user)
    return user
    
}
