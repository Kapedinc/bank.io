//
//  IO_Setting.swift
//  Bank.io
//

import Foundation

struct IO_Setting {
    
    // MARK: - Properties:
    
    /// Identifier of the setting:
    var id: String
    
    /// Title of the setting:
    var title: String
    
    /// Any additional text of the setting:
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

extension IO_Setting: Identifiable {  }

// MARK: - Equatable:

extension IO_Setting: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_Setting,
        rhs: IO_Setting
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.text == rhs.text
        && lhs.color == rhs.color
        && lhs.icon == rhs.icon
    }
}

// MARK: - Hashable:

extension IO_Setting: Hashable {
    
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

// MARK: - Example:

extension IO_Setting {
    
    // MARK: - Computed properties:
    
    /// An example setting used for SwiftUI previews:
    static var example: IO_Setting {
        .init(
            id: "example.Setting",
            title: "Example Setting",
            text: "Example setting",
            color: Colors.blue,
            icon: Icons.gearShape
        )
    }
}

// MARK: - General:

extension IO_Setting {
    
    // MARK: - Computed properties:
    
    /// An array of settings for the general section:
    static var general: [IO_Setting] {
        [
            .init(
                id: SettingsIdentifiers.personalDetails,
                title: "Personal Details",
                text: "View and update your personal details",
                color: Colors.orange,
                icon: Icons.person
            ),
            .init(
                id: SettingsIdentifiers.notifications,
                title: "Notifications",
                text: "Manage your notification preferences",
                color: Colors.indigo,
                icon: Icons.bell
            ),
            .init(
                id: SettingsIdentifiers.statements,
                title: "Statements",
                text: "View and download your statements",
                color: Colors.gray,
                icon: Icons.docText
            ),
            .init(
                id: SettingsIdentifiers.help,
                title: "Help",
                text: "Get help with anything you need",
                color: Colors.green,
                icon: Icons.questionMarkCircle
            ),
            .init(
                id: SettingsIdentifiers.marketingPreferences,
                title: "Marketing Preferences",
                text: "Control the way you receive marketing communications",
                color: Colors.pink,
                icon: Icons.megaphone
            )
        ]
    }
}

// MARK: - Application:

extension IO_Setting {
    
    // MARK: - Computed properties:
    
    /// An array of settings for the application section:
    static var application: [IO_Setting] {
        [
            .init(
                id: SettingsIdentifiers.appIcon,
                title: "App Icon",
                text: "Update the default app icon",
                color: Colors.orange,
                icon: Icons.app
            ),
            .init(
                id: SettingsIdentifiers.tintColor,
                title: "Tint Color",
                text: "Choose the tint color you like",
                color: Colors.pink,
                icon: Icons.paintbrush
            ),
            .init(
                id: SettingsIdentifiers.appearance,
                title: "Appearance",
                text: "Customize the appearance of the app",
                color: Colors.purple,
                icon: Icons.moon
            ),
            .init(
                id: SettingsIdentifiers.hapticFeedback,
                title: "Haptic Feedback",
                text: "Turn the haptic feedback on or off",
                color: Colors.gray,
                icon: Icons.handTap
            )
        ]
    }
}

// MARK: - Legal:

extension IO_Setting {
    
    // MARK: - Computed properties:
    
    /// An array of settings for the legal section:
    static var legal: [IO_Setting] {
        [
            .init(
                id: SettingsIdentifiers.privacyPolicy,
                title: "Privacy Policy",
                text: "See how we manage your data",
                color: Colors.green,
                icon: Icons.handRaised
            ),
            .init(
                id: SettingsIdentifiers.termsOfService,
                title: "Terms of Service",
                text: "Read the terms of service",
                color: Colors.blue,
                icon: Icons.docPlanText
            ),
            .init(
                id: SettingsIdentifiers.closeAccount,
                title: "Close Account",
                text: "If you wish, you can close your account here",
                color: Colors.red,
                icon: Icons.xMarkCircle
            )
        ]
    }
}
