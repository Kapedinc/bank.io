//
//  IO_TransactionsGroup.swift
//  Bank.io
//

import Foundation

enum IO_TransactionsGroup: Int, CaseIterable {
    
    // MARK: - Cases:
    
    case day
    case week
    case month
    case year
    
    // MARK: - Computed properties:
    
    /// Identifier of the group:
    var id: Int {
        rawValue
    }
    
    /// Title of the group:
    var title: String {
        switch self {
        case .day: return "Day"
        case .week: return "Week"
        case .month: return "Month"
        case .year: return "Year"
        }
    }
    
    /// Shortened title of the group:
    var shortTitle: String {
        switch self {
        case .day: return "D"
        case .week: return "W"
        case .month: return "M"
        case .year: return "Y"
        }
    }
}

// MARK: - Identifiable:

extension IO_TransactionsGroup: Identifiable {  }
