//
//  NetworkError.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 06/12/2024.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noInternetConnection
    case unknownError(message: String)

    var errorDescription: String? {
        switch self {
            case .invalidURL:
                return "The URL provided is invalid."
            case .noInternetConnection:
                return "Please reconnect to the internet."
            case .unknownError(let message):
                return "Unknown error: \(message)"
        }
    }
}