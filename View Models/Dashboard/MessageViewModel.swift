//
//  MessageViewModel.swift
//  Bank.io
//

import SwiftUI

extension MessageView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// 'Bool' value indicating whether or not the message should be shown:
        @Published var isShowing: Bool = true
        
        // MARK: - Private properties:
        
        /// Message to display:
        private let message: IO_Message
        
        init(message: IO_Message) {
            
            /// Properties initialization:
            self.message = message
        }
        
        // MARK: - Computed properties:
        
        /// Text of the message to display:
        var title: String {
            message.title
        }
        
        /// Text of the message to display:
        var text: String {
            message.text
        }
        
        /// Color of the message to display:
        var color: String {
            message.color
        }
        
        /// Icon of the message to display:
        var icon: String {
            message.icon
        }
        
        // MARK: - Functions:
        
        /// Dismisses the message:
        func dismiss() {
            
            /// Adding an animation to the dismiss action:
            withAnimation {
                
                /// Setting 'isShowing' to 'false' to hide the message:
                isShowing = false
            }
            
            /// Triggering the soft feedback:
            HapticFeedbacks.soft()
        }
    }
}
