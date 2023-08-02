//
//  NetworkHandler.swift
//  MVVMExample
//
//  Created by Parvendra Kumar on 02/08/23.
//

import Foundation

typealias Handler<T> = (Result<T,DataError>) -> Void

enum DataError : Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case network(Error?)
}

final class NetworkHandler {
    
    static var shared = NetworkHandler()
    private init(){}
    
    
    func request<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw DataError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
