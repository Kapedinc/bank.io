//
//  MessageView.swift
//  Bank.io
//

import SwiftUI

struct MessageView: View {
    
    // MARK: - Private properties:
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(message: IO_Message) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(message: message)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// Color of the message:
    private var color: Color {
        Color(viewModel.color)
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.isShowing {
            item
        }
    }
}

// MARK: - Item:

private extension MessageView {
    private var item: some View {
        Section {
            itemContent
        }
    }
    
    private var itemContent: some View {
        IconBackgroundTitleTextContentView(
            icon: viewModel.icon,
            iconColor: color,
            iconBackgroundColor: color.opacity(0.12),
            title: viewModel.title,
            text: viewModel.text,
            verticalPadding: 4,
            horizontalPadding: 0
        ) {
            dismissButton
        }
    }
}

// MARK: - Dismiss button:

private extension MessageView {
    private var dismissButton: some View {
        ButtonView(
            title: "Dismiss",
            icon: Icons.xMark,
            font: Font.subheadline.bold(),
            color: Color(.tertiaryLabel),
            style: .iconOnly,
            verticalPadding: 0,
            horizontalPadding: 0,
            isFullWidth: false,
            backgroundColor: .clear,
            cornerRadius: 0,
            action: viewModel.dismiss
        )
    }
}

// MARK: - Preview:

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: .dashboard)
    }
}
