//
//  Bank_ioApp.swift
//  Bank.io
//

import SwiftUI

@main
struct Bank_ioApp: App {
    
    // MARK: - Private properties:
    
    /// Manager responsible for navigation in the app:
    @StateObject private var navigationManager: NavigationManager
    
    /// Manager that is responsible for currencies throughout the app:
    @StateObject private var currencyManager: CurrencyManager
    
    /// Service responsible for fetching user's data:
    @StateObject private var dataService: DataService
    
    init() {
        
        /// Properties initialization:
        let navigationManager: NavigationManager = NavigationManager()
        _navigationManager = StateObject(wrappedValue: navigationManager)
        
        let currencyManager: CurrencyManager = CurrencyManager()
        _currencyManager = StateObject(wrappedValue: currencyManager)
        
        let dataService: DataService = DataService()
        _dataService = StateObject(wrappedValue: dataService)
    }
    
    // MARK: - Scene:
    
    var body: some Scene {
        WindowGroup {
            content
        }
    }
    
    private var content: some View {
        ContentView()
            .environmentObject(navigationManager)
            .environmentObject(currencyManager)
            .environmentObject(dataService)
    }
}
