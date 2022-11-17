//
//  TitleTextView.swift
//  Bank.io
//

import SwiftUI

struct TitleTextView: View {
    
    // MARK: - Private properties:
    
    /// Title of display:
    private var title: String
    
    /// 'Bool' value indicating whether or not the title should be localized:
    private var isTitleLocalized: Bool
    
    /// Font of the title:
    private var titleFont: Font
    
    /// Text case of the title:
    private var titleTextCase: Text.Case?
    
    /// Alignment of the title:
    private var titleAlignment: TextAlignment
    
    /// Color of the title:
    private var titleColor: Color
    
    /// Text of display:
    private var text: String
    
    /// 'Bool' value indicating whether or not the text should be localized:
    private var isTextLocalized: Bool
    
    /// Font of the text:
    private var textFont: Font
    
    /// Text case of the text:
    private var textTextCase: Text.Case?
    
    /// Alignment of the text:
    private var textAlignment: TextAlignment
    
    /// Color of the text:
    private var textColor: Color
    
    /// Alignment of the title and the text:
    private var alignment: HorizontalAlignment
    
    /// Spacing between the title and the text:
    private var spacing: Double
    
    init(
        title: String,
        isTitleLocalized: Bool = true,
        titleFont: Font = Font.title2.bold(),
        titleTextCase: Text.Case? = .none,
        titleAlignment: TextAlignment = .center,
        titleColor: Color = .primary,
        text: String,
        isTextLocalized: Bool = true,
        textFont: Font = .body,
        textTextCase: Text.Case? = .none,
        textAlignment: TextAlignment = .center,
        textColor: Color = .secondary,
        alignment: HorizontalAlignment = .center,
        spacing: Double = 12
    ) {
        
        /// Properties initialization:
        self.title = title
        self.isTitleLocalized = isTitleLocalized
        self.titleFont = titleFont
        self.titleTextCase = titleTextCase
        self.titleAlignment = titleAlignment
        self.titleColor = titleColor
        self.text = text
        self.isTextLocalized = isTextLocalized
        self.textFont = textFont
        self.textTextCase = textTextCase
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.alignment = alignment
        self.spacing = spacing
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        VStack(
            alignment: alignment,
            spacing: spacing
        ) {
            item
        }
    }
}

// MARK: - Item:

private extension TitleTextView {
    @ViewBuilder
    private var item: some View {
        titleContent
        textContent
    }
}

// MARK: - Title:

private extension TitleTextView {
    private var titleContent: some View {
        titleItem
            .font(titleFont)
            .textCase(titleTextCase)
            .multilineTextAlignment(titleAlignment)
            .foregroundColor(titleColor)
    }
    
    @ViewBuilder
    private var titleItem: some View {
        if isTitleLocalized {
            Text(LocalizedStringKey(title))
        } else {
            Text(title)
        }
    }
}

// MARK: - Text:

private extension TitleTextView {
    private var textContent: some View {
        textItem
            .font(textFont)
            .textCase(textTextCase)
            .multilineTextAlignment(textAlignment)
            .foregroundColor(textColor)
    }
    
    @ViewBuilder
    private var textItem: some View {
        if isTextLocalized {
            Text(LocalizedStringKey(text))
        } else {
            Text(text)
        }
    }
}

// MARK: - Preview:

struct TitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        TitleTextView(
            title: "Title",
            isTitleLocalized: true,
            titleFont: Font.title2.bold(),
            titleTextCase: .none,
            titleAlignment: .center,
            titleColor: .primary,
            text: "Text",
            isTextLocalized: true,
            textFont: .body,
            textTextCase: .none,
            textAlignment: .center,
            textColor: .secondary,
            alignment: .center,
            spacing: 12
        )
    }
}
