//
//  SettingsView.swift
//  Bank.io
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Private properties:
    
    /// Dismisses the view:
    @Environment (\.dismiss) private var dismiss
    
    // MARK: - View:
    
    var body: some View {
        navigationStack
    }
    
    private var navigationStack: some View {
        NavigationStack {
            content
        }
    }
    
    private var content: some View {
        list
            .navigationTitle("Settings")
            .toolbar {
                doneToolbar
            }
    }
}

// MARK: - List:

private extension SettingsView {
    private var list: some View {
        listContent
            .listStyle(.insetGrouped)
    }
    
    private var listContent: some View {
        List {
            sections
        }
    }
}

// MARK: - Sections:

private extension SettingsView {
    private var sections: some View {
        ForEach(
            IO_SettingsSection.sections,
            content: section
        )
    }
    
    private func section(_ section: IO_SettingsSection) -> some View {
        sectionContent(section)
            .headerProminence(.increased)
    }
    
    private func sectionContent(_ section: IO_SettingsSection) -> some View {
        Section(section.title) {
            settings(forSection: section)
        }
    }
    
    private func settings(forSection section: IO_SettingsSection) -> some View {
        ForEach(
            section.settings,
            content: SettingRowView.init
        )
    }
}

// MARK: - Done toolbar:

private extension SettingsView {
    private var doneToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            doneButton
        }
    }
    
    private var doneButton: some View {
        ButtonView(
            title: "Done",
            color: .accentColor,
            verticalPadding: 0,
            horizontalPadding: 0,
            isFullWidth: false,
            backgroundColor: .clear,
            cornerRadius: 0,
            action: dismiss.callAsFunction
        )
    }
}

// MARK: - Preview:

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
