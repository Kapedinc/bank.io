//
//  BadgeView.swift
//  Bank.io
//

import SwiftUI

struct BadgeView: View {
    
    // MARK: - Private properties:
    
    /// Title of the badge:
    private var title: String
    
    /// 'Bool' value indicating whether or not the title of the badge should be localized:
    private var isTitleLocalized: Bool
    
    /// Font of the badge's title:
    private var titleFont: Font
    
    /// Text case of the title:
    private var titleTextCase: Text.Case?
    
    /// Alignment of the badge title:
    private var titleAlignment: TextAlignment
    
    /// Color of the badge's title:
    private var titleColor: Color
    
    /// Vertical padding of the badge's title:
    private var verticalPadding: Double
    
    /// Horizontal padding of the badge's title:
    private var horizontalPadding: Double
    
    /// Stroke width of the badge:
    private var strokeWidth: Double
    
    /// Color of the badge's stroke:
    private var strokeColor: Color
    
    /// Background color of the badge:
    private var backgroundColor: Color
    
    /// Corner radius of the badge:
    private var cornerRadius: Double
    
    init(
        title: String,
        isTitleLocalized: Bool = true,
        titleFont: Font = Font.headline.weight(.bold),
        titleTextCase: Text.Case? = .uppercase,
        titleAlignment: TextAlignment = .center,
        titleColor: Color = .white,
        verticalPadding: Double = 8,
        horizontalPadding: Double = 12,
        strokeWidth: Double = 2,
        strokeColor: Color = Color(.systemBackground),
        backgroundColor: Color = .accentColor,
        cornerRadius: Double = 14
    ) {
        
        /// Properties initialization:
        self.title = title
        self.isTitleLocalized = isTitleLocalized
        self.titleFont = titleFont
        self.titleTextCase = titleTextCase
        self.titleAlignment = titleAlignment
        self.titleColor = titleColor
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.strokeWidth = strokeWidth
        self.strokeColor = strokeColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        titleContent
            .padding(
                .vertical,
                verticalPadding
            )
            .padding(
                .horizontal,
                horizontalPadding
            )
            .background(backgroundColor)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
                )
            )
            .overlay(stroke)
    }
}

// MARK: Stroke:

private extension BadgeView {
    private var stroke: some View {
        RoundedRectangle(
            cornerRadius: cornerRadius,
            style: .continuous
        )
        .stroke(
            strokeColor,
            lineWidth: strokeWidth
        )
    }
}

// MARK: - Title:

private extension BadgeView {
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

// MARK: - Preview:

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(
            title: "Title",
            isTitleLocalized: true,
            titleFont: Font.headline.weight(.bold),
            titleTextCase: .uppercase,
            titleAlignment: .center,
            titleColor: .white,
            verticalPadding: 8,
            horizontalPadding: 12,
            strokeWidth: 2,
            strokeColor: Color(.systemBackground),
            backgroundColor: .accentColor,
            cornerRadius: 14
        )
    }
}
