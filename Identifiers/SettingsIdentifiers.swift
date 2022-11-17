//
//  SettingsIdentifiers.swift
//  Bank.io
//

import Foundation

struct SettingsIdentifiers {
    
    // MARK: - Properties:
    
    /// Sections:
    static let generalSection: String = defaultSectionIdentifier + "General"
    static let applicationSection: String = defaultSectionIdentifier + "Application"
    static let legalSection: String = defaultSectionIdentifier + "Legal"
    
    /// General item:
    static let personalDetails: String = defaultItemIdentifier + "Personal.Details"
    static let notifications: String = defaultItemIdentifier + "Notifications"
    static let statements: String = defaultItemIdentifier + "Statements"
    static let help: String = defaultItemIdentifier + "Help"
    static let marketingPreferences: String = defaultItemIdentifier + "Marketing.Preferences"
    
    /// Application items:
    static let appIcon: String = defaultItemIdentifier + "App.Icon"
    static let tintColor: String = defaultItemIdentifier + "Tint.Color"
    static let appearance: String = defaultItemIdentifier + "Appearance"
    static let hapticFeedback: String = defaultItemIdentifier + "Haptic.Feedback"
    
    /// Legal items:
    static let privacyPolicy: String = defaultItemIdentifier + "Privacy.Policy"
    static let termsOfService: String = defaultItemIdentifier + "Terms.Of.Service"
    static let closeAccount: String = defaultItemIdentifier + "Close.Account"
    
    // MARK: - Private properties:
    
    /// Default identifier prefix used in every section's identifier:
    static private let defaultSectionIdentifier: String = "settings.Section."
    
    /// Default identifier prefix used in every item's identifier:
    static private let defaultItemIdentifier: String = "setting."
}
