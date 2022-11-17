//
//  IO_Card.swift
//  Bank.io
//

import Foundation

struct IO_Card {
    
    // MARK: - Properties:
    
    /// Identifier of the card:
    var id: String
    
    /// Title of the card:
    var title: String
    
    /// Number of the card:
    var number: String
    
    /// Expiry date of the card:
    var expiryDate: Date
    
    /// Name of the cardholder:
    var cardholderName: String
    
    /// Color of the card:
    var color: String
    
    /// Provider of the card:
    var provider: IO_CardProvider
    
    init(
        id: String,
        title: String,
        number: String,
        expiryDate: Date,
        cardholderName: String,
        color: String,
        provider: IO_CardProvider
    ) {
        
        /// Properties initialization:
        self.id = id
        self.title = title
        self.number = number
        self.expiryDate = expiryDate
        self.cardholderName = cardholderName
        self.color = color
        self.provider = provider
    }
}

// MARK: - Identifiable:

extension IO_Card: Identifiable {  }

// MARK: - Equatable:

extension IO_Card: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_Card,
        rhs: IO_Card
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.number == rhs.number
        && lhs.expiryDate == rhs.expiryDate
        && lhs.cardholderName == rhs.cardholderName
        && lhs.color == rhs.color
        && lhs.provider == rhs.provider
    }
}

// MARK: - Hashable:

extension IO_Card: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the card's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(number)
        hasher.combine(expiryDate)
        hasher.combine(cardholderName)
        hasher.combine(color)
        hasher.combine(provider)
    }
}

// MARK: - Sendable:

extension IO_Card: Sendable {  }

// MARK: - Decodable:

/// Needed for decoding any data that you receive from the server (Please add your own implementation):
extension IO_Card: Decodable {  }

// MARK: - Sample:

extension IO_Card {
    
    // MARK: - Computed properties:
    
    /// An array of sample cards:
    static var sample: [IO_Card] {
        [
            .init(
                id: "card.Debit",
                title: "Debit Card",
                number: "4408  7726  3147  9901",
                expiryDate: Date().dateWithComponents(
                    withYear: 2025,
                    withMonth: 6,
                    withDay: 30
                ),
                cardholderName: "John Smith",
                color: Colors.blue,
                provider: .mastercard
            ),
            .init(
                id: "card.Credit",
                title: "Credit Card",
                number: "7451  2963  5443  7289",
                expiryDate: Date().dateWithComponents(
                    withYear: 2027,
                    withMonth: 1,
                    withDay: 31
                ),
                cardholderName: "John Smith",
                color: Colors.gray,
                provider: .visa
            )
        ]
    }
}

// MARK: - Example:

extension IO_Card {
    
    // MARK: - Computed properties:
    
    /// An example of the card used for SwiftUI previews:
    static var example: IO_Card {
        .init(
            id: "example.Card",
            title: "Example Card",
            number: "1234  4321  1234  4321",
            expiryDate: Date().dateWithComponents(
                withYear: 2025,
                withMonth: 6,
                withDay: 30
            ),
            cardholderName: "Example Cardholder Name",
            color: Colors.blue,
            provider: .mastercard
        )
    }
}
