//
//  SettingRowViewModel.swift
//  Bank.io
//

import Foundation

extension SettingRowView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// 'Bool' value indicating whether or not the haptic feedback enabled:
        @Published var isHapticFeedbackEnabled: Bool = true
        
        /// An actual setting
        let setting: IO_Setting
        
        init(setting: IO_Setting) {
            
            /// Properties initialization:
            self.setting = setting
        }
        
        // MARK: - Computed properties:
        
        /// Title of the setting:
        var title: String {
            setting.title
        }
        
        /// Text of the setting:
        var text: String {
            setting.text
        }
        
        /// Color of the setting:
        var color: String {
            setting.color
        }
        
        /// Icon of the setting:
        var icon: String {
            setting.icon
        }
        
        /// 'Bool' value indicating whether or not the setting is a haptic feedback:
        var isHapticFeedback: Bool {
            setting.id == SettingsIdentifiers.hapticFeedback
        }
    }
}
