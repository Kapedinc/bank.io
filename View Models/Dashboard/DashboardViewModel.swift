//
//  DashboardViewModel.swift
//  Bank.io
//

import Foundation

extension DashboardView {
    final class ViewModel: ObservableObject {

        // MARK: - Properties:
        
        /// State that the view is in:
        @Published var viewState: IO_ViewState = .defaultState
        
        /// Sheet that is currently presented ('nil' if no sheet is presented)
        @Published var currentSheet: IO_DashboardSheet? = nil
        
        // MARK: - Private properties:
        
        /// Service responsible for fetching user's data:
        private let dataService: DataService
        
        init(dataService: DataService) {
            
            /// Properties initialization:
            self.dataService = dataService
        }
        
        // MARK: - Functions:
        
        /// Fetches all the data needed for this view:
        func fetchData() async {
            
            /// Updating the UI on the main thread:
            await MainActor.run {
                
                /// Setting the view state to '.loading':
                updateViewState(withState: .loading)
            }
            
            /// Making sure we have the current user:
            if let currentUser: IO_User = dataService.currentUser {
                
                /// Fetching and updating the accounts for the current user:
                try? await dataService.fetchAccounts(forUser: currentUser)
            }
            
            /// Updating the UI on the main thread:
            await MainActor.run {
                
                /// Setting the view state to either '.loaded' or '.empty' based on the accounts array:
                updateViewState(withState: dataService.isAccountsEmpty ? .empty : .loaded)
            }
        }
        
        /// Shows the 'Settings' view:
        func showSettings() {
            
            /// Showing 'Settings' view as a sheet:
            currentSheet = .settings
        }
        
        // MARK: - Private functions:
        
        /// Updates the view state based on the state provided:
        private func updateViewState(withState state: IO_ViewState) {
            
            /// Updating the view state:
            self.viewState = state
        }
    }
}
