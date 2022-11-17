//
//  CardSettingRowViewModel.swift
//  Bank.io
//

import Foundation

extension CardSettingRowView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// An actual setting:
        let setting: IO_CardSetting
        
        init(setting: IO_CardSetting) {
            
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
    }
}
