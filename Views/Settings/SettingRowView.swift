//
//  SettingRowView.swift
//  Bank.io
//

import SwiftUI

struct SettingRowView: View {
    
    // MARK: - Private properties:
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(setting: IO_Setting) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(setting: setting)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// Color of the setting:
    private var color: Color {
        Color(viewModel.color)
    }
    
    /// 'Bool' value indicating whether or not the setting is a haptic feedback:
    private var isHapticFeedback: Bool {
        viewModel.isHapticFeedback
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.isHapticFeedback {
            label
        } else {
            item
        }
    }
}

// MARK: - Item:

private extension SettingRowView {
    private var item: some View {
        itemContent
            .navigationDestination(
                for: IO_Setting.self,
                destination: setting
            )
    }
    
    private var itemContent: some View {
        NavigationLink(value: viewModel.setting) {
            label
        }
    }
}

// MARK: - Label:

private extension SettingRowView {
    private var label: some View {
        IconBackgroundTitleTextContentView(
            icon: viewModel.icon,
            iconColor: color,
            iconBackgroundColor: color.opacity(0.12),
            title: viewModel.title,
            text: viewModel.text,
            verticalPadding: 4,
            horizontalPadding: 0
        ) {
            hapticFeedbackToggle
        }
    }
}

// MARK: - Haptic feedback toggle:

private extension SettingRowView {
    @ViewBuilder
    private var hapticFeedbackToggle: some View {
        if viewModel.isHapticFeedback {
            hapticFeedbackToggleContent
        }
    }
    
    private var hapticFeedbackToggleContent: some View {
        hapticFeedbackToggleItem
            .labelsHidden()
            .tint(Color.accentColor)
    }
    
    private var hapticFeedbackToggleItem: some View {
        Toggle(
            viewModel.title,
            isOn: $viewModel.isHapticFeedbackEnabled
        )
    }
}

// MARK: - Setting:

private extension SettingRowView {
    private func setting(_ setting: IO_Setting) -> some View {
        
        /*
         
         NOTE: For now, this view simply displays the title of the setting, you can add your own implementation for the setting item details here.
         
         */
        
        Text(setting.title)
            .foregroundColor(.secondary)
            .padding()
    }
}

// MARK: - Preview:

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(setting: .example)
    }
}
