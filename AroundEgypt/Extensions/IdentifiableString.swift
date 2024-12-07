//
//  IdentifiableString.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import Foundation

extension String: @retroactive Identifiable {
    public var id: Int {
        return hash
    }
}
