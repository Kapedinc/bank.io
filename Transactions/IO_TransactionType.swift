//
//  IO_TransactionType.swift
//  Bank.io
//

import Foundation

enum IO_TransactionType: Int, CaseIterable {
    
    // MARK: - Cases:
    
    case incomingCardTransactions
    case outgoingCardTransactions
    case incomingTransfer
    case outgoingTransfer
    
    // MARK: - Computed properties:
    
    /// Identifier of the type:
    var id: Int {
        rawValue
    }
}

// MARK: - Identifiable:

extension IO_TransactionType: Identifiable {  }

// MARK: - Equatable:

extension IO_TransactionType: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_TransactionType,
        rhs: IO_TransactionType
    ) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Hashable:

extension IO_TransactionType: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the transaction type's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Sendable:

extension IO_TransactionType: Sendable {  }

// MARK: - Decodable:

/// Needed for decoding any data that you receive from the server (Please add your own implementation):
extension IO_TransactionType: Decodable {  }
