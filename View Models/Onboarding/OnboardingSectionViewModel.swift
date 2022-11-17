//
//  OnboardingSectionViewModel.swift
//  Bank.io
//

import Foundation

extension OnboardingSectionView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Private properties:
        
        /// Section to display:
        private let section: IO_OnboardingSection
        
        init(section: IO_OnboardingSection) {
            
            /// Properties initialization:
            self.section = section
        }
        
        // MARK: - Computed properties:
        
        /// Title of the section:
        var title: String {
            section.title
        }
        
        /// Text of the section:
        var text: String {
            section.text
        }
        
        /// Color of the section:
        var color: String {
            section.color
        }
        
        /// Icon of the section:
        var icon: String {
            section.icon
        }
        
        /// Title of the section's badge:
        var badgeTitle: String {
            section.badgeTitle
        }
    }
}
