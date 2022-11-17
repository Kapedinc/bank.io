//
//  IO_SettingsSection.swift
//  Bank.io
//

import Foundation

struct IO_SettingsSection {
    
    // MARK: - Properties:
    
    /// Identifier of the section:
    var id: String
    
    /// Title of the section:
    var title: String
    
    /// Setting in the section:
    var settings: [IO_Setting]
    
    init(
        id: String,
        title: String,
        settings: [IO_Setting]
    ) {
        
        /// Properties initialization:
        self.id = id
        self.title = title
        self.settings = settings
    }
}

// MARK: - Identifiable:

extension IO_SettingsSection: Identifiable {  }

// MARK: - Equatable:

extension IO_SettingsSection: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_SettingsSection,
        rhs: IO_SettingsSection
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.settings == rhs.settings
    }
}

// MARK: - Hashable:

extension IO_SettingsSection: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the section's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(settings)
    }
}

// MARK: - Sections:

extension IO_SettingsSection {
    
    /// An example section used for SwiftUI previews:
    static var example: IO_SettingsSection {
        .init(
            id: "example.Section",
            title: "Title",
            settings: [.example]
        )
    }
}

// MARK: - Sections:

extension IO_SettingsSection {
    
    // MARK: - Computed properties:
    
    /// An array of all sections:
    static var sections: [IO_SettingsSection] {
        [
            .init(
                id: SettingsIdentifiers.generalSection,
                title: "General",
                settings: IO_Setting.general
            ),
            .init(
                id: SettingsIdentifiers.applicationSection,
                title: "Application",
                settings: IO_Setting.application
            ),
            .init(
                id: SettingsIdentifiers.legalSection,
                title: "Legal",
                settings: IO_Setting.legal
            )
        ]
    }
}
