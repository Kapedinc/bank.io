//
//  IO_TransactionsDate.swift
//  Bank.io
//

import Foundation

struct IO_TransactionsDate {
    
    // MARK: - Properties:
    
    /// Identifier of the date:
    var id: String
    
    /// An actual date:
    var date: Date
    
    /// Transactions for this date:
    var transactions: [IO_Transaction]
    
    init(
        id: String,
        date: Date,
        transactions: [IO_Transaction]
    ) {
        
        /// Properties initialization:
        self.id = id
        self.date = date
        self.transactions = transactions
    }
    
    // MARK: - Computed properties:
    
    /// Title of the date:
    var title: String {
        date.formatted(
            date: .abbreviated,
            time: .omitted
        )
    }
}

// MARK: - Identifiable:

extension IO_TransactionsDate: Identifiable {  }

// MARK: - Equatable:

extension IO_TransactionsDate: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_TransactionsDate,
        rhs: IO_TransactionsDate
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.date == rhs.date
        && lhs.transactions == rhs.transactions
    }
}

// MARK: - Hashable:

extension IO_TransactionsDate: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the date's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(date)
        hasher.combine(transactions)
    }
}

// MARK: - Sendable:

extension IO_TransactionsDate: Sendable {  }

// MARK: - Decodable:

/// Needed for decoding any data that you receive from the server (Please add your own implementation):
extension IO_TransactionsDate: Decodable {  }

// MARK: - Sample:

extension IO_TransactionsDate {
    
    // MARK: - Computed properties:
    
    /// An array of sample transaction dates:
    static var sample: [IO_TransactionsDate] {
        [
            .dateOne,
            .dateTwo,
            .dateThree
        ]
    }
    
    /// One of the sample transaction dates:
    static var dateOne: IO_TransactionsDate {
        .init(
            id: "transactions.Date.28th.July.2022",
            date: Date().dateWithComponents(
                withYear: 2022,
                withMonth: 7,
                withDay: 28
            ),
            transactions: IO_Transaction.dateOneSample
        )
    }
    
    /// One of the sample transaction dates:
    static var dateTwo: IO_TransactionsDate {
        .init(
            id: "transactions.Date.3rd.August.2022",
            date: Date().dateWithComponents(
                withYear: 2022,
                withMonth: 8,
                withDay: 3
            ),
            transactions: IO_Transaction.dateTwoSample
        )
    }
    
    /// One of the sample transaction dates:
    static var dateThree: IO_TransactionsDate {
        .init(
            id: "transactions.Date.12th.August.2022",
            date: Date().dateWithComponents(
                withYear: 2022,
                withMonth: 8,
                withDay: 12
            ),
            transactions: IO_Transaction.dateThreeSample
        )
    }
}

// MARK: - Example:

extension IO_TransactionsDate {
    
    // MARK: - Computed properties:
    
    /// An example of the date used for SwiftUI previews:
    static var example: IO_TransactionsDate {
        .init(
            id: "example.Transactions.Date",
            date: Date().dateWithComponents(
                withYear: 2022,
                withMonth: 7,
                withDay: 31
            ),
            transactions: [.example]
        )
    }
}
