//
//  IconBackgroundView.swift
//  Bank.io
//

import SwiftUI

struct IconBackgroundView: View {
    
    // MARK: - Private properties:
    
    /// Icon to display:
    private var icon: String
    
    /// Symbol variant of the icon ('.fill', etc.):
    private var symbolVariant: SymbolVariants
    
    /// Font of the icon:
    private var font: Font
    
    /// Color of the icon:
    private var color: Color
    
    /// Frame of the icon:
    private var frame: Double
    
    /// Padding around the icon:
    private var padding: Double
    
    /// Color of the icon's background:
    private var backgroundColor: Color
    
    /// Corner radius of the icon's background:
    private var cornerRadius: Double
    
    init(
        icon: String,
        symbolVariant: SymbolVariants = .fill,
        font: Font = .system(size: 80, weight: .bold, design: .default),
        color: Color = .accentColor,
        frame: Double = 120,
        padding: Double = 40,
        backgroundColor: Color = .accentColor.opacity(0.12),
        cornerRadius: Double = 48
    ) {
        
        /// Properties initialization:
        self.icon = icon
        self.symbolVariant = symbolVariant
        self.font = font
        self.color = color
        self.frame = frame
        self.padding = padding
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        Image(systemName: icon)
            .symbolVariant(symbolVariant)
            .font(font)
            .foregroundColor(color)
            .frame(
                width: frame,
                height: frame
            )
            .padding(padding)
            .background(backgroundColor)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
                )
            )
    }
}

// MARK: - Preview:

struct IconBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        IconBackgroundView(
            icon: Icons.creditCard,
            symbolVariant: .fill,
            font: .system(size: 80, weight: .bold, design: .default),
            color: .accentColor,
            frame: 120,
            padding: 40,
            backgroundColor: .accentColor.opacity(0.12),
            cornerRadius: 48
        )
    }
}
