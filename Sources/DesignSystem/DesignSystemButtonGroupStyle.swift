//
//  ButtonGroupStyle.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct DesignSystemButtonGroupStyle: ButtonStyle {
    var size: DesignSystem.Size
    var style: DesignSystem.Style
    var design: DesignSystem.ContentMode
    var icon: Image? = nil
    var action: ()->() = {}

    @Environment(\.colorTheme) private var colorTheme

    public init(
        size: DesignSystem.Size,
        style: DesignSystem.Style,
        design: DesignSystem.ContentMode = .fill,
        icon: Image? = nil,
        action: @escaping () -> () = {}
    ) {
        self.size = size
        self.style = style
        self.design = design
        self.icon = icon
        self.action = action
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: size.fontSize, weight: .bold))
            .frame(width: size.frameWidth, height: size.frameWidth)
            .foregroundColor(configuration.isPressed ? colorTheme.activePrimary : colorTheme.activeBasic)
            .background(configuration.isPressed ? style.color(colorTheme).opacity(0.5): style.color(colorTheme))
            .border(style.color(colorTheme), width: (design == .outline && !configuration.isPressed) ? 1 : 0)
    }
}

struct DesignSystemButtonGroupStyle_Previews: PreviewProvider {
    typealias designSystemSize = DesignSystem.Size
    
    static var previews: some View {
        
        VStack(spacing : 20) {
            
            HStack(spacing: 20) {
                
                Button(action : {  }, label: {Text("G")})
                    .buttonStyle(DesignSystemButtonGroupStyle(
                        size: .extraLarge, style: .primary
                    ))
                
                Button(action : {}, label: {Text("L")})
                    .buttonStyle(DesignSystemButtonGroupStyle(
                        size: .large, style: .default
                    ))
            }
        
            HStack(spacing: 20) {
                Button(action : {}, label: {Text("M")})
                    .buttonStyle(DesignSystemButtonGroupStyle(
                        size: .medium, style: .default, design: .outline
                    ))
                
                Button(action : {}, label: {Text("S")})
                    .buttonStyle(DesignSystemButtonGroupStyle(
                        size: .small, style: .default
                    ))
            }
            
            HStack(spacing: 20) {
                
                Button(action : {}, label: {Text("T")})
                    .buttonStyle(DesignSystemButtonGroupStyle(
                        size: .tiny, style: .primary
                    ))
            }
            
            HStack(spacing: 20) {
                
                Button(action : {}, label: {Image(systemName: "star.fill").designSystemSquare(width: designSystemSize.large.iconScale)})
                    .buttonStyle(DesignSystemButtonGroupStyle(
                        size: .medium, style: .default
                    ))
                
                Button(action : {}, label: {Image(systemName: "person").designSystemSquare(width: designSystemSize.large.iconScale)})
                    .buttonStyle(DesignSystemButtonGroupStyle(
                        size: .medium, style: .default
                    ))
                
                Button(action : {},
                       label: {
                        Image(
                            systemName: "umbrella")
                            .designSystemSquare(
                                width: designSystemSize.large.iconScale
                            )
                       })
                    .buttonStyle(
                        DesignSystemButtonGroupStyle(
                            size: .medium,
                            style: .primary
                        )
                    )
            }
        }
    }
}
