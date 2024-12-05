//
//  NetworkingService.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import Foundation

struct NetworkingService {
    func request<T: Decodable>(_ request: URLRequest) async -> Result<T, Error> {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(error)
        }
    }
}
