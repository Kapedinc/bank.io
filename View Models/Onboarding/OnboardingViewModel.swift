//
//  OnboardingViewModel.swift
//  Bank.io
//

import SwiftUI

extension OnboardingView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// Current section that is displayed:
        @Published var current: IO_OnboardingSection = .first
        
        /// 'Bool' value indicating whether or not the 'Sing Up' view is presented:
        @Published var isSignUpPresented: Bool = false
        
        // MARK: - Private properties:
        
        /// Manager responsible for the navigation within the app:
        private let navigationManager: NavigationManager
        
        /// Service that handles the data throughout the app:
        private let dataService: DataService
        
        init(
            navigationManager: NavigationManager,
            dataService: DataService
        ) {
            
            /// Properties initialization:
            self.navigationManager = navigationManager
            self.dataService = dataService
        }
        
        // MARK: - Computed properties:
        
        /// Title of the 'Next' button:
        var nextButtonTitle: String {
            switch current {
            case .first: return "Next"
            case .second: return "Next"
            case .third: return "Get Started"
            }
        }
        
        // MARK: - Functions:
        
        /// Moves the user to the next screen:
        func next() {
            switch current {
            case .first:
                
                /// Moving the user to the second section of the onboarding:
                current = .second
            case .second:
                
                /// Moving the user to the third section of the onboarding:
                current = .third
            case .third:
                
                /// Showing the 'Sign Up' view:
                isSignUpPresented = true
            }
        }
        
        /// Moves the user to screen with the demo mode enabled:
        func showDemoMode() {
            
            /// Creating an async task to fetch the demo user:
            Task {
                
                /// Trying to fetch the demo use:
                try? await dataService.fetchUser(
                    withUsername: "demo.User",
                    withPassword: "123456"
                )
            }
            
            /// Adding an animation to the action:
            withAnimation {
                
                /// Setting the 'didSeeOnboarding' property to true to hide the onboarding:
                navigationManager.didSeeOnboarding = true
            }
        }
        
        /// Gets called whenever current user changes:
        func currentUserOnChange(_ currentUser: IO_User?) {
            
            /// Making sure the current user is no 'nil':
            if currentUser != nil {
                
                /// Hiding the 'Onboarding' view:
                navigationManager.didSeeOnboarding = true
            }
        }
    }
}
