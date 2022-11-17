//
//  TabBarViewModel.swift
//  Bank.io
//

import Foundation

extension TabBarView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// Tab that is currently selected:
        @Published var currentTab: IO_Tab = .dashboard
        
        // MARK: - Functions:
        
        /// Gets called whenever the current tab changes:
        func currentTabOnChange(_ currentTab: IO_Tab) {
            
            /// Triggering the selection changes haptic feedback:
            HapticFeedbacks.selectionChanges()
        }
    }
}
