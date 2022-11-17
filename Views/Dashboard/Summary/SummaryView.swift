//
//  SummaryView.swift
//  Bank.io
//

import SwiftUI
import Charts

struct SummaryView: View {
    
    // MARK: - Private properties:
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(dataService: DataService) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(dataService: dataService)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        if !viewModel.isTransactionsEmpty {
            item
        }
    }
}

// MARK: - Item:

private extension SummaryView {
    private var item: some View {
        itemContent
            .headerProminence(.increased)
    }
    
    private var itemContent: some View {
        Section("Summary") {
            chart
        }
    }
}

// MARK: - Chart:

private extension SummaryView {
    private var chart: some View {
        TransactionsChartView(
            title: "Expenses",
            transactions: viewModel.transactions
        )
    }
}

// MARK: - Preview:

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(dataService: DataService())
    }
}
