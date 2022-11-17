//
//  IO_Transaction.swift
//  Bank.io
//

import Foundation

struct IO_Transaction {
    
    /// Identifier of the transaction:
    var id: String
    
    /// Title of the transaction:
    var title: String
    
    /// Details of the transaction:
    var details: String
    
    /// Time of the transaction:
    var time: Date
    
    /// Amount of the transaction:
    var amount: Double
    
    /// Type of the transaction:
    var type: IO_TransactionType
    
    /// Category of the transaction:
    var category: IO_Category
    
    init(
        id: String,
        title: String,
        details: String,
        time: Date,
        amount: Double,
        type: IO_TransactionType,
        category: IO_Category
    ) {
        
        /// Properties initialization:
        self.id = id
        self.title = title
        self.details = details
        self.time = time
        self.amount = amount
        self.type = type
        self.category = category
    }
}

// MARK: - Identifiable:

extension IO_Transaction: Identifiable {  }

// MARK: - Equatable:

extension IO_Transaction: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_Transaction,
        rhs: IO_Transaction
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.details == rhs.details
        && lhs.time == rhs.time
        && lhs.amount == rhs.amount
        && lhs.type == rhs.type
        && lhs.category == rhs.category
    }
}

// MARK: - Hashable:

extension IO_Transaction: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the transaction's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(details)
        hasher.combine(time)
        hasher.combine(amount)
        hasher.combine(type)
        hasher.combine(category)
    }
}

// MARK: - Sendable:

extension IO_Transaction: Sendable {  }

// MARK: - Decodable:

/// Needed for decoding any data that you receive from the server (Please add your own implementation):
extension IO_Transaction: Decodable {  }

// MARK: - Date - 1:

extension IO_Transaction {
    
    // MARK: - Computed properties:
    
    /// Sample transactions for one of the dates:
    static var dateOneSample: [IO_Transaction] {
        [
            .init(
                id: "transaction.Weekly.Groceries",
                title: "Weekly Groceries",
                details: "Outgoing card transaction",
                time: Date().dateWithComponents(
                    withHour: 10,
                    withMinute: 17
                ),
                amount: 135.0,
                type: .outgoingCardTransactions,
                category: .groceries
            ),
            .init(
                id: "transaction.Rent.For.August",
                title: "Rent for August",
                details: "Great Street 1, Apartment 8",
                time: Date().dateWithComponents(
                    withHour: 8,
                    withMinute: 52
                ),
                amount: 550.0,
                type: .outgoingTransfer,
                category: .housing
            ),
            .init(
                id: "transaction.Youtube.Premium",
                title: "Youtube Premium",
                details: "Recurring card transaction",
                time: Date().dateWithComponents(
                    withHour: 23,
                    withMinute: 59
                ),
                amount: 15.0,
                type: .outgoingCardTransactions,
                category: .subscriptions
            ),
            .init(
                id: "transaction.Salary.For.July",
                title: "Salary for July",
                details: "Incoming transfer",
                time: Date().dateWithComponents(
                    withHour: 12,
                    withMinute: 30
                ),
                amount: 5036.75,
                type: .incomingTransfer,
                category: .income
            ),
            .init(
                id: "transaction.Electricity",
                title: "Electricity",
                details: "Invoice number: INV-123",
                time: Date().dateWithComponents(
                    withHour: 16,
                    withMinute: 33
                ),
                amount: 50.0,
                type: .outgoingTransfer,
                category: .utilities
            ),
            .init(
                id: "transaction.Cinema.Tickets",
                title: "Cinema Tickets",
                details: "Outgoing card transaction",
                time: Date().dateWithComponents(
                    withHour: 14,
                    withMinute: 52
                ),
                amount: 15.0,
                type: .outgoingCardTransactions,
                category: .entertainment
            ),
            .init(
                id: "transaction.Car.Insurance",
                title: "Car Insurance",
                details: "Recurring card transaction",
                time: Date().dateWithComponents(
                    withHour: 12,
                    withMinute: 05
                ),
                amount: 375.0,
                type: .outgoingCardTransactions,
                category: .transportation
            )
        ]
    }
}

// MARK: - Date - 2:

extension IO_Transaction {
    
    // MARK: - Computed properties:
    
    /// Sample transactions for one of the dates:
    static var dateTwoSample: [IO_Transaction] {
        [
            .init(
                id: "transaction.Medicine",
                title: "Medicine",
                details: "Outgoing card transaction",
                time: Date().dateWithComponents(
                    withHour: 10,
                    withMinute: 42
                ),
                amount: 9.50,
                type: .outgoingCardTransactions,
                category: .medical
            ),
            .init(
                id: "transaction.Gym.Membership",
                title: "Gym Membership",
                details: "Recurring card transaction",
                time: Date().dateWithComponents(
                    withHour: 9,
                    withMinute: 38
                ),
                amount: 20.0,
                type: .outgoingCardTransactions,
                category: .subscriptions
            ),
            .init(
                id: "transaction.Car.Oil.Change",
                title: "Car Oil Change",
                details: "Outgoing card transaction",
                time: Date().dateWithComponents(
                    withHour: 12,
                    withMinute: 56
                ),
                amount: 80.0,
                type: .outgoingCardTransactions,
                category: .transportation
            ),
            .init(
                id: "transaction.Samantha.Clarke",
                title: "Samantha Clarke",
                details: "Happy Birthday!",
                time: Date().dateWithComponents(
                    withHour: 7,
                    withMinute: 48
                ),
                amount: 25.0,
                type: .outgoingTransfer,
                category: .miscellaneous
            ),
            .init(
                id: "transaction.New.Clothing",
                title: "New Clothing",
                details: "Outgoing card transaction",
                time: Date().dateWithComponents(
                    withHour: 15,
                    withMinute: 10
                ),
                amount: 125.0,
                type: .outgoingCardTransactions,
                category: .shopping
            ),
            .init(
                id: "transaction.Dinner.With.Family",
                title: "Dinner with Family",
                details: "Outgoing card transaction",
                time: Date().dateWithComponents(
                    withHour: 22,
                    withMinute: 46
                ),
                amount: 55.0,
                type: .outgoingCardTransactions,
                category: .eatingOut
            )
        ]
    }
}

// MARK: - Date - 3:

extension IO_Transaction {
    
    // MARK: - Computed properties:
    
    /// Sample transactions for one of the dates:
    static var dateThreeSample: [IO_Transaction] {
        [
            .init(
                id: "transaction.Sketch.App",
                title: "Sketch App",
                details: "Recurring annual subscription",
                time: Date().dateWithComponents(
                    withHour: 9,
                    withMinute: 30
                ),
                amount: 99.0,
                type: .outgoingCardTransactions,
                category: .subscriptions
            ),
            .init(
                id: "transaction.Paul.Henderson",
                title: "Paul Henderson",
                details: "Thank you for the dinner!",
                time: Date().dateWithComponents(
                    withHour: 14,
                    withMinute: 26
                ),
                amount: 40.0,
                type: .outgoingTransfer,
                category: .eatingOut
            ),
            .init(
                id: "transaction.Water",
                title: "Water",
                details: "Invoice number: INV-981",
                time: Date().dateWithComponents(
                    withHour: 18,
                    withMinute: 35
                ),
                amount: 45.0,
                type: .outgoingTransfer,
                category: .utilities
            ),
            .init(
                id: "transaction.Savings.Interest",
                title: "Savings Interest",
                details: "Incoming transfer",
                time: Date().dateWithComponents(
                    withHour: 15,
                    withMinute: 46
                ),
                amount: 305.25,
                type: .incomingTransfer,
                category: .income
            )
        ]
    }
}

// MARK: - Example:

extension IO_Transaction {
    
    // MARK: - Computed properties:
    
    /// An example of the transaction used for SwiftUI previews:
    static var example: IO_Transaction {
        .init(
            id: "example.Transaction",
            title: "Example Transaction",
            details: "Example details",
            time: Date().dateWithComponents(
                withHour: 9,
                withMinute: 41
            ),
            amount: 75.0,
            type: .outgoingCardTransactions,
            category: .groceries
        )
    }
}
