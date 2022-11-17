//
//  IO_Category.swift
//  Bank.io
//

import Foundation

enum IO_Category: Int, CaseIterable {
    
    // MARK: - Cases:
    
    case groceries
    case eatingOut
    case housing
    case utilities
    case transportation
    case medical
    case shopping
    case subscriptions
    case entertainment
    case miscellaneous
    case income
    
    // MARK: - Computed properties:
    
    /// Identifier of the category:
    var id: Int {
        rawValue
    }
    
    /// Title of the category:
    var title: String {
        switch self {
        case .groceries: return "Groceries"
        case .eatingOut: return "Eating Out"
        case .housing: return "Housing"
        case .utilities: return "Utilities"
        case .transportation: return "Transportation"
        case .medical: return "Medical"
        case .shopping: return "Shopping"
        case .subscriptions: return "Subscriptions"
        case .entertainment: return "Entertainment"
        case .miscellaneous: return "Miscellaneous"
        case .income: return "Income"
        }
    }
    
    /// Color of the category:
    var color: String {
        switch self {
        case .groceries: return Colors.green
        case .eatingOut: return Colors.pink
        case .housing: return Colors.blue
        case .utilities: return Colors.indigo
        case .transportation: return Colors.brown
        case .medical: return Colors.cyan
        case .shopping: return Colors.orange
        case .subscriptions: return Colors.purple
        case .entertainment: return Colors.red
        case .miscellaneous: return Colors.gray
        case .income: return Colors.green
        }
    }
    
    /// Icon of the category:
    var icon: String {
        switch self {
        case .groceries: return Icons.bag
        case .eatingOut: return Icons.forkKnife
        case .housing: return Icons.house
        case .utilities: return Icons.gearShape
        case .transportation: return Icons.car
        case .medical: return Icons.pills
        case .shopping: return Icons.cart
        case .subscriptions: return Icons.repeats
        case .entertainment: return Icons.tv
        case .miscellaneous: return Icons.rectangleStack
        case .income: return Icons.plusCircle
        }
    }
}

// MARK: - Identifiable:

extension IO_Category: Identifiable {  }

// MARK: - Equatable:

extension IO_Category: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_Category,
        rhs: IO_Category
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.color == rhs.color
        && lhs.icon == rhs.icon
    }
}

// MARK: - Hashable:

extension IO_Category: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the category's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(color)
        hasher.combine(icon)
    }
}

// MARK: - Sendable:

extension IO_Category: Sendable {  }

// MARK: - Decodable:

/// Needed for decoding any data that you receive from the server (Please add your own implementation):
extension IO_Category: Decodable {  }
