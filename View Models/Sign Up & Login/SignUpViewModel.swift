//
//  SignUpViewModel.swift
//  Bank.io
//

import Foundation

extension SignUpView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// Full name entered by the user:
        @Published var fullName: String = ""
        
        /// Username entered by the user:
        @Published var username: String = ""
        
        /// Password entered by the user:
        @Published var password: String = ""
        
        /// Confirmed password entered by the user:
        @Published var confirmedPassword: String = ""
        
        /// First line of address entered by the user:
        @Published var firstLine: String = ""
        
        /// Second line of address entered by the user:
        @Published var secondLine: String = ""
        
        /// City entered by the user:
        @Published var city: String = ""
        
        /// State entered by the user:
        @Published var state: String = ""
        
        /// ZIP code entered by the user:
        @Published var zipCode: String = ""
        
        /// 'Bool' value indicating whether or not the loading indicator on the 'Sign Up' button should be shown:
        @Published var isLoading: Bool = false
        
        /// 'Bool' value indicating whether or not the error alert is presented:
        @Published var isErrorAlertPresented: Bool = false
        
        /// 'Bool' value indicating whether or not the 'Login' view is presented:
        @Published var isLoginPresented: Bool = false
        
        // MARK: - Private properties:
        
        /// Service used for fetching the data from the server (Including authenticating the users, etc.):
        private let dataService: DataService
        
        init(dataService: DataService) {
            
            /// Properties initialization:
            self.dataService = dataService
        }
        
        // MARK: - Computed properties:
        
        /// 'Bool' value indicating whether or not the 'Sign Up' button should be disabled:
        var isSignUpButtonDisabled: Bool {
            fullName.isEmpty
            || username.isEmpty
            || password.count < 6
            || confirmedPassword != password
            || firstLine.isEmpty
            || city.isEmpty
            || state.isEmpty
            || zipCode.isEmpty
        }
        
        // MARK: - Functions:
        
        /// Shows the 'Login' view:
        func login() {
            
            /// Showing the 'Login' view:
            isLoginPresented = true
        }
        
        /// Signs the user up:
        func signUp() {
            
            /// Setting 'isLoading' property to 'true':
            isLoading = true
            
            /// Creating an async task to create a user:
            Task {
                do {
                    
                    /// Trying to create a user:
                    try await dataService.createUser(
                        withFullName: fullName,
                        withUsername: username,
                        withPassword: password,
                        withAddressFirstLine: firstLine,
                        withAddressSecondLine: secondLine,
                        withCity: city,
                        withState: state,
                        withZIPCode: zipCode
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
        
        /// Gets called whenever current user changes:
        func currentUserOnChange(_ currentUser: IO_User?) {
            
            /// Making sure the current user is no 'nil':
            if currentUser != nil {
                
                /// Hiding the 'Login' view:
                isLoginPresented = false
            }
        }
    }
}
