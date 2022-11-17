//
//  IO_CardProvider.swift
//  Bank.io
//

import Foundation

enum IO_CardProvider: Int {
    
    // MARK: - Cases:
    
    /// You can add more card providers as the cases of enum if needed:
    case mastercard
    case visa
    
    // MARK: - Computed properties:
    
    /// Identifier of the provider:
    var id: Int {
        rawValue
    }
    
    /// Logo of the provider:
    var logo: String {
        switch self {
        case .mastercard: return Logos.mastercard
        case .visa: return Logos.visa
        }
    }
}

// MARK: - Identifiable:

extension IO_CardProvider: Identifiable {  }

// MARK: - Equatable:

extension IO_CardProvider: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_CardProvider,
        rhs: IO_CardProvider
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.logo == rhs.logo
    }
}

// MARK: - Hashable:

extension IO_CardProvider: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the provider's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(logo)
    }
}

// MARK: - Decodable:

/// Needed for decoding any data that you receive from the server (Please add your own implementation):
extension IO_CardProvider: Decodable {  }
