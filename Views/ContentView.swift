//
//  ContentView.swift
//  Bank.io
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Private properties:
    
    /// Manager responsible for navigation within the app:
    @EnvironmentObject private var navigationManager: NavigationManager
    
    /// Service that handles the data throughout the app:
    @EnvironmentObject private var dataService: DataService
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        if navigationManager.didSeeOnboarding {
            TabBarView()
        } else {
            onboarding
        }
    }
}

// MARK: - Onboarding:

private extension ContentView {
    private var onboarding: some View {
        OnboardingView(
            navigationManager: navigationManager,
            dataService: dataService
        )
    }
}

// MARK: - Preview:

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NavigationManager())
            .environmentObject(DataService())
    }
}
