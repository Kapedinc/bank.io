//
//  IO_OnboardingSection.swift
//  Bank.io
//

import Foundation

enum IO_OnboardingSection: Int, CaseIterable {
    
    // MARK: - Cases:
    
    /// You can add more sections here:
    case first
    case second
    case third
    
    // MARK: - Computed properties:
    
    /// Identifier of the onboarding section:
    var id: Int {
        rawValue
    }
    
    /// Title of the onboarding section:
    var title: String {
        switch self {
        case .first: return "Fully Innovative Banking"
        case .second: return "All Your Cards in One Place"
        case .third: return "Lightning Fast Payments"
        }
    }
    
    /// Text of the onboarding section:
    var text: String {
        switch self {
        case .first: return "We are always looking for ways to take our banking services to the next level."
        case .second: return "View and manage all of your debit and credit cards in a single convenient place."
        case .third: return "Make transfers to your friends and family members with the speed of sound."
        }
    }
    
    /// Color of the onboarding section:
    var color: String {
        switch self {
        case .first: return Colors.orange
        case .second: return Colors.pink
        case .third: return Colors.blue
        }
    }
    
    /// Icon of the onboarding section:
    var icon: String {
        switch self {
        case .first: return Icons.bolt
        case .second: return Icons.creditCard
        case .third: return Icons.arrowLeftArrowRight
        }
    }
    
    /// Title of the section's badge:
    var badgeTitle: String {
        switch self {
        case .first: return "Reliable"
        case .second: return "Secure"
        case .third: return "Innovative"
        }
    }
}

// MARK: - Identifiable:

extension IO_OnboardingSection: Identifiable {  }

// MARK: - Equatable:

extension IO_OnboardingSection: Equatable {
    
    // MARK: - Functions:
    
    /// Makes sure that the arguments on both sides are equal:
    static func == (
        lhs: IO_OnboardingSection,
        rhs: IO_OnboardingSection
    ) -> Bool {
        lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.text == rhs.text
        && lhs.color == rhs.color
        && lhs.icon == rhs.icon
        && lhs.badgeTitle == rhs.badgeTitle
    }
}

// MARK: - Hashable:

extension IO_OnboardingSection: Hashable {
    
    // MARK: - Functions:
    
    /// Hashes the section's values:
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(text)
        hasher.combine(color)
        hasher.combine(icon)
        hasher.combine(badgeTitle)
    }
}
