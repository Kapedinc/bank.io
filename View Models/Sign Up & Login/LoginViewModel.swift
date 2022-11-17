//
//  LoginViewModel.swift
//  Bank.io
//

import Foundation

extension LoginView {
    final class ViewModel: ObservableObject {
    
        // MARK: - Properties:
        
        /// Username entered by the user:
        @Published var username: String = ""
        
        /// Password entered by the user:
        @Published var password: String = ""
        
        /// 'Bool' value indicating whether or not the 'Login' button should display the loading indicator:
        @Published var isLoading: Bool = false
        
        /// 'Bool' value indicating whether or not the error alert is presented:
        @Published var isErrorAlertPresented: Bool = false
        
        // MARK: - Private properties:
        
        /// Service used for fetching the data from the server (Including authenticating the users, etc.):
        private let dataService: DataService
        
        init(dataService: DataService) {
            
            /// Properties initialization:
            self.dataService = dataService
        }
        
        // MARK: - Computed properties:
        
        /// 'Bool' value indicating whether or not the 'Login' button is disabled:
        var isLoginButtonDisabled: Bool {
            username.isEmpty
            || password.count < 6
        }
        
        // MARK: - Functions:
        
        /// Logs the user in:
        func login() {
            
            /// Setting 'isLoading' property to 'true':
            isLoading = true
            
            /// Creating an async task to log the user in:
            Task {
                do {
                    
                    /// Trying to fetch the user:
                    try await dataService.fetchUser(
                        withUsername: username,
                        withPassword: password
                    )
                    
                    /// Updating the UI on the main thread:
                    await MainActor.run {
                        
                        /// Setting 'isLoading' property to 'false':
                        isLoading = false
                    }
                } catch {
                    
                    /// Updating the UI on the main thread:
                    await MainActor.run {
                        
                        /// Presenting an error alert in case of a failure:
                        isErrorAlertPresented = true
                        
                        /// Setting 'isLoading' property to 'false':
                        isLoading = false
                    }
                }
            }
        }
    }
}
