//
//  ButtonGroupContainer.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import Foundation
import SwiftUI


/// Struct to create a row of formatted buttons
public struct DesignSystemButtonGroup: View {

    var icon : Image?
    var buttonItems : Int
    var text: String = ""
    var style: DesignSystem.Style
    var size: DesignSystem.Size
    var contentMode: DesignSystem.ContentMode
    
    @Environment(\.colorTheme) private var colorTheme

    public init(
        icon: Image? = nil,
        buttonItems: Int,
        text: String = "",
        style: DesignSystem.Style,
        size: DesignSystem.Size,
        contentMode: DesignSystem.ContentMode = .fill
    ) {
        self.icon = icon
        self.buttonItems = buttonItems
        self.text = text
        self.style = style
        self.size = size
        self.contentMode = contentMode
    }
    
    public var body : some View {
        VStack {
            HStack(spacing: 1) {
                ForEach(0..<buttonItems) { i in
                    Button(
                        action: {},
                        label: {
                            Group {
                                if self.icon != nil {
                                    self.icon!.designSystemSquare(
                                        width: self.size.iconScale
                                    )
                                } else {
                                    Text(self.text)
                                }
                            }
                        }
                    )
                    .buttonStyle(
                        DesignSystemButtonGroupStyle(
                            size: size, style: style, design: contentMode
                        )
                    )
                }
            }
            .cornerRadius(self.size.frameWidth / 10)
            .overlay(
                RoundedRectangle(
                    cornerRadius: (contentMode == .outline) ? (self.size.frameWidth / 10) : 0
                )
                .stroke(
                    colorTheme.basic,
                    lineWidth:(contentMode == .outline) ? 1 : 0
                )
            )
        }
    }
}

struct ButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DesignSystemButtonGroup(
                icon: Image(systemName: "star"),
                buttonItems: 5,
                text: "won't read me",
                style: .primary,
                size: .extraLarge
            )

            DesignSystemButtonGroup(
                icon: nil,
                buttonItems: 5,
                text: "L",
                style: .default,
                size: .large
            )
            
            DesignSystemButtonGroup(
                icon: Image(systemName: "person"),
                buttonItems: 5,
                text: "hi",
                style: .primary,
                size: .medium,
                contentMode: .outline
            )

            DesignSystemButtonGroup(
                icon: nil,
                buttonItems: 5,
                text: "S",
                style: .primary,
                size: .small
            )

            DesignSystemButtonGroup(
                icon: Image(systemName: "umbrella.fill"),
                buttonItems: 5,
                text: "T",
                style: .default,
                size: .tiny
            )
        }
    }
}
