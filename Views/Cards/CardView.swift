//
//  CardView.swift
//  Bank.io
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Private properties:
    
    /// Size of the dynamic type selected by the user:
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(card: IO_Card) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(card: card)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// Width of the card:
    private var width: CGFloat {
        
        /// Checking whether or not the user's device is iPad:
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            /// If yes, then returning a fixed with for the card:
            return 344
        } else {
            
            /// If not, then simply returning the .infinity width to take up the entire width:
            return .infinity
        }
    }
    
    /// 'Bool' value indicating whether or not the content should be moved (When dynamic type's size is too large):
    private var shouldMoveContent: Bool {
        dynamicTypeSize >= .accessibility1
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        Section {
            mainContent
        }
    }
    
    private var mainContent: some View {
        item
            .padding()
            .frame(
                height: shouldMoveContent ? 680 : 200,
                alignment: .leading
            )
            .frame(maxWidth: width)
            .background(Color(viewModel.color).gradient)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 16,
                    style: .continuous
                )
            )
            .padding(.horizontal, 8)
    }
}

// MARK: - Item:

private extension CardView {
    private var item: some View {
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            itemContent
        }
    }
    
    @ViewBuilder
    private var itemContent: some View {
        logo
        itemSpacer
        number
        itemSpacer
        footer
    }
    
    @ViewBuilder
    private var itemSpacer: some View {
        if !shouldMoveContent {
            Spacer(minLength: 0)
        }
    }
}

// MARK: - Logo:

private extension CardView {
    private var logo: some View {
        Text("Bank.io")
            .font(Font.title.bold())
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
    }
}

// MARK: - Number:

private extension CardView {
    private var number: some View {
        Text(viewModel.number)
            .font(Font.title2.bold())
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            /// Needed to fix the occasional truncation issues:
            .fixedSize(
                horizontal: false,
                vertical: true
            )
    }
}

// MARK: - Footer:

private extension CardView {
    @ViewBuilder
    private var footer: some View {
        if shouldMoveContent {
            verticalFooter
        } else {
            horizontalFooter
        }
    }
    
    private var verticalFooter: some View {
        VStack(
            alignment: .leading,
            spacing: 24
        ) {
            footerContent
        }
    }
    
    private var horizontalFooter: some View {
        HStack(
            alignment: .bottom,
            spacing: 24
        ) {
            footerContent
        }
    }
    
    @ViewBuilder
    private var footerContent: some View {
        expiryDate
        cardholder
        footerSpacer
        cardProviderLogo
    }
    
    @ViewBuilder
    private var footerSpacer: some View {
        if !shouldMoveContent {
            Spacer(minLength: 0)
        }
    }
}

// MARK: - Expiry date:

private extension CardView {
    private var expiryDate: some View {
        TitleTextView(
            title: "Expiry",
            titleFont: Font.footnote.bold(),
            titleColor: .white.opacity(0.48),
            text: viewModel.expiryDate,
            isTextLocalized: false,
            textFont: .headline,
            textColor: .white,
            alignment: .leading,
            spacing: 6
        )
    }
}

// MARK: - Cardholder:

private extension CardView {
    private var cardholder: some View {
        TitleTextView(
            title: "Cardholder",
            titleFont: Font.footnote.bold(),
            titleColor: .white.opacity(0.48),
            text: viewModel.cardholderName,
            isTextLocalized: false,
            textFont: .headline,
            textColor: .white,
            alignment: .leading,
            spacing: 6
        )
    }
}

// MARK: - Card provider logo:

private extension CardView {
    private var cardProviderLogo: some View {
        Image(viewModel.providerLogo)
    }
}

// MARK: - Preview:

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .example)
    }
}
