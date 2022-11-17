//
//  IO_Currency.swift
//  Bank.io
//

import Foundation

enum IO_Currency: Int, CaseIterable {
    
    // MARK: - Cases
    
    /// You can add more currencies as cases of the enum if needed:
    case usDollar
    
    // MARK: - Computed properties:
    
    /// Identifier of the currency:
    var id: Int {
        rawValue
    }
    
    /// Title of the currency:
    var title: String {
        switch self {
        case .usDollar: return "US Dollar"
        }
    }
    
    /// Symbol of the currency:
    var symbol: String {
        switch self {
        case .usDollar: return "$"
        }
    }
    
    /// Emoji of the currency:
    var emoji: String {
        switch self {
        case .usDollar: return "🇺🇸"
        }
    }
    
    /// Code of the currency:
    var code: String {
        switch self {
        case .usDollar: return "USD"
        }
    }
}

// MARK: - Identifiable:

extension IO_Currency: Identifiable {  }
