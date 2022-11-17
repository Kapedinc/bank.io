//
//  CardSettingsIdentifiers.swift
//  Bank.io
//

import Foundation

struct CardSettingsIdentifiers {
    
    // MARK: - Properties:
    
    /// Settings:
    static let blockCard: String = defaultIdentifier + "Block.Card"
    static let viewPIN: String = defaultIdentifier + "View.PIN"
    static let limits: String = defaultIdentifier + "Limits"
    static let cancelCard: String = defaultIdentifier + "Cancel.Card"
    
    // MARK: - Private properties:
    
    /// Default identifier prefix used in every card setting's identifier:
    static private let defaultIdentifier: String = "card.Setting."
}
