//
//  IO_CardSetting.swift
//  Bank.io
//

import Foundation

struct IO_CardSetting {
    
    // MARK: - Properties:
    
    /// Identifier of the setting:
    var id: String
    
    /// Title of the setting:
    var title: String
    
    /// An additional information of the setting:
    var text: String
    
    /// Color of the setting:
    var color: String
    
    /// Icon of the setting:
    var icon: String
    
    init(
        id: String,
        title: String,
        text: String,
        color: String,
        icon: String
    ) {
        
        /// Properties initialization:
        self.id = id
        self.title = title
        self.text = text
        self.color = color
        self.icon = icon
    }
}

// MARK: - Identifiable:

extension IO_CardSetting: Identifiable { }

// MARK: - Equatable:

extension IO_CardSetting: Equatable {

    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_CardSetting,
        rhs: IO_CardSetting
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.text == rhs.text
        && lhs.color == rhs.color
        && lhs.icon == rhs.icon
    }
}

// MARK: - Hashable:

extension IO_CardSetting: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the setting's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(text)
        hasher.combine(color)
        hasher.combine(icon)
    }
}

// MARK: - Settinga:

extension IO_CardSetting {
    
    // MARK: - Computed properties:
    
    /// An example card setting used for SwiftUI previews:
    static var example: IO_CardSetting {
        .init(
            id: "card.Setting.Example",
            title: "Example Setting",
            text: "Example setting",
            color: Colors.blue,
            icon: Icons.gearShape
        )
    }
}

// MARK: - Settinga:

extension IO_CardSetting {
    
    // MARK: - Computed properties:
    
    /// An array of all settings
    static var settings: [IO_CardSetting] {
        [
            .init(
                id: CardSettingsIdentifiers.blockCard,
                title: "Block Card",
                text: "You can block and unblock your card here",
                color: Colors.orange,
                icon: Icons.lock
            ),
            .init(
                id: CardSettingsIdentifiers.viewPIN,
                title: "View PIN",
                text: "View card's PIN in the app",
                color: Colors.blue,
                icon: Icons.key
            ),
            .init(
                id: CardSettingsIdentifiers.limits,
                title: "Limits",
                text: "Manage your card limits",
                color: Colors.green,
                icon: Icons.gaugeHigh
            ),
            .init(
                id: CardSettingsIdentifiers.cancelCard,
                title: "Cancel Card",
                text: "Cancel your card here",
                color: Colors.red,
                icon: Icons.xMarkCircle
            )
        ]
    }
}
