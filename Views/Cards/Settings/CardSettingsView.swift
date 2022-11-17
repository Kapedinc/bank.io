//
//  CardSettingsView.swift
//  Bank.io
//

import SwiftUI

struct CardSettingsView: View {
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        item
            .headerProminence(.increased)
    }
}

// MARK: - Settings:

private extension CardSettingsView {
    private var item: some View {
        Section("Settings") {
            settings
        }
    }
}

// MARK: - Settings:

private extension CardSettingsView {
    private var settings: some View {
        ForEach(
            IO_CardSetting.settings,
            content: CardSettingRowView.init
        )
    }
}

// MARK: - Preview:

struct CardSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        CardSettingsView()
    }
}
