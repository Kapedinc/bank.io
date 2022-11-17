//
//  PaymentTemplateRowView.swift
//  Bank.io
//

import SwiftUI

struct PaymentTemplateRowView: View {
    
    // MARK: - Private properties:
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(template: IO_PaymentTemplate) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(template: template)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// Color of the template:
    private var color: Color {
        Color(viewModel.color)
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        item
            .navigationDestination(
                for: IO_PaymentTemplate.self,
                destination: template
            )
    }
}

// MARK: - Item:

private extension PaymentTemplateRowView {
    private var item: some View {
        NavigationLink(value: viewModel.template) {
            label
        }
    }
}

// MARK: - Label:

private extension PaymentTemplateRowView {
    private var label: some View {
        IconBackgroundTitleTextView(
            icon: viewModel.icon,
            iconColor: color,
            iconBackgroundColor: color.opacity(0.12),
            title: viewModel.title,
            isTitleLocalized: false,
            text: viewModel.notes,
            isTextLocalized: false,
            verticalPadding: 4,
            horizontalPadding: 0
        )
    }
}

// MARK: - Payment template:

private extension PaymentTemplateRowView {
    private func template(_ template: IO_PaymentTemplate) -> some View {
        
        /*
         
         NOTE: For now, this view simply displays the title of the template, you can add your own implementation for the template details here.
         
         */
        
        Text(template.title)
            .foregroundColor(.secondary)
            .padding()
    }
}

// MARK: - Preview:

struct PaymentTemplateRowView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentTemplateRowView(template: .example)
    }
}
