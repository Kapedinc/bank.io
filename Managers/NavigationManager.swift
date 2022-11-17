//
//  NavigationManager.swift
//  Bank.io
//

import Foundation

final class NavigationManager: ObservableObject {
    
    // MARK: - Properties:
    
    /// 'Bool' value indicating whether or not the user saw the onboarding:
    @Published var didSeeOnboarding: Bool = false
}
