//
//  IO_PaymentTemplate.swift
//  Bank.io
//

import Foundation

struct IO_PaymentTemplate {
    
    // MARK: - Properties:
    
    /// Identifier of the template:
    var id: String
    
    /// Title of the template:
    var title: String
    
    /// Notes for the template:
    var notes: String
    
    /// Color of the template:
    var color: String
    
    /// Icon of the template:
    var icon: String
    
    init(
        id: String,
        title: String,
        notes: String,
        color: String,
        icon: String
    ) {
        
        /// Properties initialization:
        self.id = id
        self.title = title
        self.notes = notes
        self.color = color
        self.icon = icon
    }
}

// MARK: - Identifiable:

extension IO_PaymentTemplate: Identifiable {  }

// MARK: - Equatable:

extension IO_PaymentTemplate: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_PaymentTemplate,
        rhs: IO_PaymentTemplate
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.notes == rhs.notes
        && lhs.color == rhs.color
        && lhs.icon == rhs.icon
    }
}

// MARK: - Hashable:

extension IO_PaymentTemplate: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the card's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(notes)
        hasher.combine(color)
        hasher.combine(icon)
    }
}

// MARK: - Sendable:

extension IO_PaymentTemplate: Sendable {  }

// MARK: - Decodable:

/// Needed for decoding any data that you receive from the server (Please add your own implementation):
extension IO_PaymentTemplate: Decodable {  }

// MARK: - Sample:

extension IO_PaymentTemplate {
    
    // MARK: - Computed properties:
    
    /// An array of sample templates:
    static var sample: [IO_PaymentTemplate] {
        [
            .init(
                id: "payment.Template.Sean.Johnson",
                title: "Sean Johnson",
                notes: "Rent for August",
                color: Colors.pink,
                icon: Icons.house
            ),
            .init(
                id: "payment.Template.Business.Checking",
                title: "Business Checking",
                notes: "Recurring transfer of $250 each month",
                color: Colors.gray,
                icon: Icons.buildingColumns
            ),
            .init(
                id: "payment.Template.Daily.Savings",
                title: "Daily Savings",
                notes: "$50 to savings every week",
                color: Colors.indigo,
                icon: Icons.buildingColumns
            ),
            .init(
                id: "payment.Template.Samantha.Clarke",
                title: "Samantha Clarke",
                notes: "Happy Birthday!",
                color: Colors.yellow,
                icon: Icons.partyPopper
            ),
            .init(
                id: "payment.Template.Paul.Henderson",
                title: "Paul Henderson",
                notes: "$40 for the dinner last night",
                color: Colors.purple,
                icon: Icons.forkKnife
            )
        ]
    }
}

// MARK: - Example:

extension IO_PaymentTemplate {
    
    // MARK: - Computed properties:
    
    /// An example of the template used for SwiftUI previews:
    static var example: IO_PaymentTemplate {
        .init(
            id: "example.Payment.Template",
            title: "Example Template",
            notes: "Example template notes",
            color: Colors.blue,
            icon: Icons.creditCard
        )
    }
}
