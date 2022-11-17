//
//  BarsChartView.swift
//  Bank.io
//

import SwiftUI
import Charts

struct TransactionsChartView: View {
    
    // MARK: - Private properties:
    
    /// Size of the dynamic type selected by the user:
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    /// Manager that is responsible for currencies throughout the app:
    @EnvironmentObject private var currencyManager: CurrencyManager
    
    /// Group to group transactions by:
    @State private var group: IO_TransactionsGroup = .day
    
    /// Title of the chart:
    private var title: String
    
    /// Transactions to display on the chart:
    private var transactions: [IO_Transaction]
    
    init(
        title: String,
        transactions: [IO_Transaction]
    ) {
        
        /// Properties initialization:
        self.title = title
        self.transactions = transactions
    }
    
    // MARK: - Private computed properties:
    
    /// 'Bool' value indicating whether or not the content should be moved (When dynamic type's size is too large):
    private var shouldMoveContent: Bool {
        dynamicTypeSize >= .accessibility1
    }
    
    /// An amount of all transactions:
    private var amount: Double {
        transactions.map {
            $0.amount
        }.reduce(0.0, +)
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        item
            .padding(.vertical, 8)
            .onChange(
                of: group,
                perform: groupOnChange
            )
    }
}

// MARK: - Item:

private extension TransactionsChartView {
    private var item: some View {
        VStack(
            alignment: .leading,
            spacing: 24
        ) {
            itemContent
        }
    }
    
    @ViewBuilder
    private var itemContent: some View {
        header
        chart
    }
}

// MARK: - Header:

private extension TransactionsChartView {
    @ViewBuilder
    private var header: some View {
        if shouldMoveContent {
            verticalHeader
        } else {
            horizontalHeader
        }
    }
    
    private var verticalHeader: some View {
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            headerContent
        }
    }
    
    private var horizontalHeader: some View {
        HStack(
            alignment: .top,
            spacing: 16
        ) {
            headerContent
        }
    }
    
    @ViewBuilder
    private var headerContent: some View {
        titleAmount
        headerSpacer
        groupPicker
    }
    
    @ViewBuilder
    private var headerSpacer: some View {
        if !shouldMoveContent {
            Spacer(minLength: 0)
        }
    }
}

// MARK: - Title & amount:

private extension TransactionsChartView {
    private var titleAmount: some View {
        VStack(
            alignment: .leading,
            spacing: 6
        ) {
            titleAmountContent
        }
    }
    
    @ViewBuilder
    private var titleAmountContent: some View {
        titleContent
        amountContent
    }
    
    private var titleContent: some View {
        Text(title)
            .font(Font.footnote.bold())
            .textCase(.uppercase)
            .multilineTextAlignment(.leading)
            .foregroundColor(.secondary)
    }
    
    private var amountContent: some View {
        Text(amount.formatted(.currency(code: currencyManager.current.code)))
            .font(Font.title2.bold())
            .multilineTextAlignment(.leading)
            .foregroundColor(.primary)
    }
}

// MARK: - Group picker:

private extension TransactionsChartView {
    private var groupPicker: some View {
        groupPickerContent
            .pickerStyle(.segmented)
            .labelsHidden()
            .frame(maxWidth: 144)
    }
    
    private var groupPickerContent: some View {
        Picker(
            "Group By",
            selection: $group
        ) {
            groups
        }
    }
    
    private var groups: some View {
        ForEach(
            IO_TransactionsGroup.allCases,
            content: group
            
        )
    }
    
    private func group(_ group: IO_TransactionsGroup) -> some View {
        Text(group.shortTitle)
            .tag(group)
    }
}

// MARK: - Chart:

private extension TransactionsChartView {
    private var chart: some View {
        chartContent
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .frame(height: 200)
            .padding(.horizontal)
    }
    
    private var chartContent: some View {
        Chart {
            chartData
        }
    }
    
    private var chartData: some ChartContent {
        ForEach(
            transactions,
            content: chartBar
        )
    }
    
    private func chartBar(
        forTransaction transaction: IO_Transaction
    ) -> some ChartContent {
        chartBarContent(forTransaction: transaction)
            .foregroundStyle(Color.accentColor)
            .cornerRadius(6)
    }
    
    private func chartBarContent(
        forTransaction transaction: IO_Transaction
    ) -> some ChartContent {
        
        /// For now, transactions are grouped by their categories, but you can change the grouping by updating the value of the x-axis below:
        BarMark(
            x: .value("Category", transaction.category.rawValue),
            y: .value("Amount", transaction.amount),
            width: 20
        )
    }
}

// MARK: - Functions:

private extension TransactionsChartView {
    
    // MARK: - Private functions:
    
    /// Gets called whenever selected transactions group changes:
    private func groupOnChange(_ group: IO_TransactionsGroup) {
        
        /// Triggering haptic feedback to notify the user that the selection has changed:
        HapticFeedbacks.selectionChanges()
    }
}

// MARK: - Preview:

struct BarsChartView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsChartView(
            title: "Expenses",
            transactions: [IO_Transaction.example]
        )
        .environmentObject(CurrencyManager())
    }
}
