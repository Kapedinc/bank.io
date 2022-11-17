//
//  IO_Message.swift
//  Bank.io
//

import Foundation

enum IO_Message: Int, Identifiable, CaseIterable {
    
    // MARK: - Cases:
    
    /// You can add more cases here and use this message enum in various places in the app if needed:
    case dashboard
    
    // MARK: - Computed properties:
    
    /// Identifier of the message:
    var id: Int {
        rawValue
    }
    
    /// Title of the message:
    var title: String {
        switch self {
        case .dashboard: return "Apply Now 🚀"
        }
    }
    
    /// Text of the message:
    var text: String {
        switch self {
        case .dashboard: return "Our new exclusive credit card was just released."
        }
    }
    
    /// Color of the message:
    var color: String {
        switch self {
        case .dashboard: return Colors.blue
        }
    }
    
    /// Icon of the message:
    var icon: String {
        switch self {
        case .dashboard: return Icons.bolt
        }
    }
}
