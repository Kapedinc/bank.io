//
//  AvatarViewModel.swift
//  Bank.io
//

import Foundation

extension AvatarView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Private properties:
        
        /// Service responsible for data within the app:
        private let dataService: DataService
        
        init(dataService: DataService) {
            
            /// Properties initialization:
            self.dataService = dataService
        }
        
        // MARK: - Computed properties:
        
        /// Initials of the current user:
        var initials: String {
            
            /// Checking whether or not we have a current user:
            if let currentUser {
                
                /// First letter of the current user's first name:
                let firstNameFirstLetter: Character = currentUser.firstName.first ?? Character("")
                
                /// First letter of the current user's last name:
                let lastNameFirstLetter: Character = currentUser.lastName.first ?? Character("")
                
                /// Initials of the user:
                let initials: String = "\(firstNameFirstLetter)" + "\(lastNameFirstLetter)"
                
                /// Returning the initials of the current user:
                return initials
            } else {
                return ""
            }
        }
        
        /// 'Bool' value indicating whether or not the indicator should be shown (Please add your own implementation):
        var isShowingIndicator: Bool {
            currentUser != nil
        }
        
        // MARK: - Private computed properties:
        
        /// User that is currently logged in:
        private var currentUser: IO_User? {
            dataService.currentUser
        }
    }
}
