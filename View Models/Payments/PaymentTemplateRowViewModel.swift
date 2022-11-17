//
//  PaymentTemplateRowViewModel.swift
//  Bank.io
//

import Foundation

extension PaymentTemplateRowView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// An actual template:
        let template: IO_PaymentTemplate
        
        init(template: IO_PaymentTemplate) {
            
            /// Properties initialization:
            self.template = template
        }
        
        // MARK: - Computed properties:
        
        /// Title of the template:
        var title: String {
            template.title
        }
        
        /// Notes for this template:
        var notes: String {
            template.notes
        }
        
        /// Color of the template:
        var color: String {
            template.color
        }
        
        /// Icon of the template:
        var icon: String {
            template.icon
        }
    }
}
