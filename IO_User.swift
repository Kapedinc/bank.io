//
//  IO_User.swift
//  Bank.io
//

import Foundation

struct IO_User {
    
    // MARK: - Properties:
    
    /// Identifier of the user:
    var id: String
    
    /// First name of the user:
    var firstName: String
    
    /// Last name of the user:
    var lastName: String
    
    /// Accounts belonging to this user:
    var accounts: [IO_Account]
    
    /// Cards belonging to this user:
    var cards: [IO_Card]
    
    /// Payment templates belonging to the current user:
    var paymentTemplates: [IO_PaymentTemplate]
    
    init(
        id: String,
        firstName: String,
        lastName: String,
        accounts: [IO_Account],
        cards: [IO_Card],
        paymentTemplates: [IO_PaymentTemplate]
    ) {
        
        /// Properties initilization:
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.accounts = accounts
        self.cards = cards
        self.paymentTemplates = paymentTemplates
    }
}

// MARK: - Identifiable:

extension IO_User: Identifiable {  }

// MARK: - Equatable:

extension IO_User: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_User,
        rhs: IO_User
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.firstName == rhs.firstName
        && lhs.lastName == rhs.lastName
        && lhs.accounts == rhs.accounts
        && lhs.cards == rhs.cards
        && lhs.paymentTemplates == rhs.paymentTemplates
    }
}

// MARK: - Hashable:

extension IO_User: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the user's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(firstName)
        hasher.combine(lastName)
        hasher.combine(accounts)
        hasher.combine(cards)
        hasher.combine(paymentTemplates)
    }
}

// MARK: - Sendable:

extension IO_User: Sendable {  }

// MARK: - Decodable:

/// Needed for decoding any data that you receive from the server (Please add your own implementation):
extension IO_User: Decodable {  }

// MARK: - Sample:

extension IO_User {
    
    // MARK: - Computed properties:
    
    /// Sample user data:
    static var sample: IO_User {
        .init(
            id: "john.Smith",
            firstName: "John",
            lastName: "Smith",
            accounts: IO_Account.sample,
            cards: IO_Card.sample,
            paymentTemplates: IO_PaymentTemplate.sample
        )
    }
}

// MARK: - Example:

extension IO_User {
    
    // MARK: - Computed properties:
    
    /// An example of the user used for SwiftUI previews:
    static var example: IO_User {
        .init(
            id: "example.User",
            firstName: "Example",
            lastName: "User",
            accounts: [.example],
            cards: [.example],
            paymentTemplates: [.example]
        )
    }
}
