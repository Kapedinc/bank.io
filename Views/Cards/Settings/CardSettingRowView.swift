//
//  CardSettingRowView.swift
//  Bank.io
//

import SwiftUI

struct CardSettingRowView: View {
    
    // MARK: - Private properties:
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(setting: IO_CardSetting) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(setting: setting)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// Color of the setting:
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
                for: IO_CardSetting.self,
                destination: setting
            )
    }
}

// MARK: - Item:

private extension CardSettingRowView {
    private var item: some View {
        NavigationLink(value: viewModel.setting) {
            label
        }
    }
}

// MARK: - Label:

private extension CardSettingRowView {
    private var label: some View {
        IconBackgroundTitleTextView(
            icon: viewModel.icon,
            iconColor: color,
            iconBackgroundColor: color.opacity(0.12),
            title: viewModel.title,
            text: viewModel.text,
            verticalPadding: 4,
            horizontalPadding: 0
        )
    }
}

// MARK: - Setting:

private extension CardSettingRowView {
    private func setting(_ setting: IO_CardSetting) -> some View {
        
        /*
         
         NOTE: For now, this view simply displays the title of the setting, you can add your own implementation for the setting item details here.
         
         */
        
        Text(setting.title)
            .foregroundColor(.secondary)
            .padding()
    }
}

// MARK: - Preview:

struct CardSettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        CardSettingRowView(setting: .example)
    }
}
