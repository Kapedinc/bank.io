//
//  IO_Account.swift
//  Bank.io
//

import Foundation

struct IO_Account {
    
    // MARK: - Properties:
    
    /// Identifier of the account:
    var id: String

    /// Title of the account:
    var title: String
    
    /// Number of the account:
    var number: String
    
    /// Color of the account:
    var color: String
    
    /// Icon of the account:
    var icon: String
    
    /// An array of transaction dates this account has:
    var transactionsDates: [IO_TransactionsDate]
    
    init(
        id: String,
        title: String,
        number: String,
        color: String,
        icon: String,
        transactionsDates: [IO_TransactionsDate]
    ) {
        
        /// Properties initialization:
        self.id = id
        self.title = title
        self.number = number
        self.color = color
        self.icon = icon
        self.transactionsDates = transactionsDates
    }
    
    // MARK: - Computed properties:
    
    /// Balance of the account:
    var balance: Double {
        transactionsDates.map {
            $0.transactions.map {
                switch $0.type {
                case .incomingCardTransactions:
                    return +$0.amount
                case .outgoingCardTransactions:
                    return -$0.amount
                case .incomingTransfer:
                    return +$0.amount
                case .outgoingTransfer:
                    return -$0.amount
                }
            }.reduce(0, +)
        }.reduce(0, +)
    }
}

// MARK: - Identifiable:

extension IO_Account: Identifiable {  }

// MARK: - Equatable:

extension IO_Account: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_Account,
        rhs: IO_Account
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.number == rhs.number
        && lhs.color == rhs.color
        && lhs.icon == rhs.icon
        && lhs.transactionsDates == rhs.transactionsDates
    }
}

// MARK: - Hashable:

extension IO_Account: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the account's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(number)
        hasher.combine(color)
        hasher.combine(icon)
        hasher.combine(transactionsDates)
    }
}

// MARK: - Sendable:

extension IO_Account: Sendable {  }

// MARK: - Decodable:

/// Needed for decoding any data that you receive from the server (Please add your own implementation):
extension IO_Account: Decodable {  }

// MARK: - Sample:

extension IO_Account {
    
    // MARK: - Computed properties:
    
    /// An array of sample accounts:
    static var sample: [IO_Account] {
        [
            .init(
                id: "account.Checking",
                title: "Checking",
                number: "344-271-986",
                color: Colors.orange,
                icon: Icons.buildingColumns,
                transactionsDates: IO_TransactionsDate.sample
            ),
            .init(
                id: "account.Savings",
                title: "Savings",
                number: "543-902-717",
                color: Colors.green,
                icon: Icons.buildingColumns,
                transactionsDates: [.dateThree]
            ),
            .init(
                id: "account.Credit.Card",
                title: "Credit Card",
                number: "600-001-408",
                color: Colors.pink,
                icon: Icons.creditCard,
                transactionsDates: [.dateTwo]
            )
        ]
    }
}

// MARK: - Example:

extension IO_Account {
    
    // MARK: - Computed properties:
    
    /// An example of the account used for SwiftUI previews:
    static var example: IO_Account {
        .init(
            id: "example.Account",
            title: "Example Account",
            number: "000-000-000",
            color: Colors.blue,
            icon: Icons.creditCard,
            transactionsDates: [.example]
        )
    }
}
