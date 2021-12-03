//
//  ButtonGroupStyle.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct DesignSystemButtonGroupStyle: ButtonStyle {

    var sizesStyle: SizeStyle
    var colorStyle: Style
    var icon: Image? = nil
    var action: ()->() = {}
    
    public init(
        sizesStyle: DesignSystemButtonGroupStyle.SizeStyle,
        colorStyle: DesignSystemButtonGroupStyle.Style,
        icon: Image? = nil,
        action: @escaping () -> () = {}
    ) {
        self.sizesStyle = sizesStyle
        self.colorStyle = colorStyle
        self.icon = icon
        self.action = action
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            
            .font(.system(size: sizesStyle.fontSize, weight: .bold))
            .frame(width: sizesStyle.frameWidth, height: sizesStyle.frameWidth)
            .foregroundColor(configuration.isPressed ? colorStyle.activeForeground : colorStyle.defaultForeground)
            .background(configuration.isPressed ? colorStyle.activeBackground : colorStyle.defaultBackground)
            .border(colorStyle.defaultForeground, width: (colorStyle == .outline && !configuration.isPressed) ? 1 : 0)
    }
}

struct DesignSystemButtonGroupStyle_Previews: PreviewProvider {
    typealias designSystemSize = DesignSystemButtonGroupStyle.SizeStyle
    
    static var previews: some View {
        
        VStack(spacing : 20) {
            
            HStack(spacing: 20) {
                
                Button(action : {  }, label: {Text("G")})
                    .buttonStyle(DesignSystemButtonGroupStyle(sizesStyle: .giant, colorStyle: .primary))
                
                Button(action : {}, label: {Text("L")})
                    .buttonStyle(DesignSystemButtonGroupStyle(sizesStyle: .large, colorStyle: .basic ))
            }
        
            HStack(spacing: 20) {
                Button(action : {}, label: {Text("M")})
                    .buttonStyle(DesignSystemButtonGroupStyle(sizesStyle: .medium, colorStyle: .outline ))
                
                Button(action : {}, label: {Text("S")})
                    .buttonStyle(DesignSystemButtonGroupStyle(sizesStyle: .small, colorStyle: .basic ))
            }
            
            HStack(spacing: 20) {
                
                Button(action : {}, label: {Text("T")})
                    .buttonStyle(DesignSystemButtonGroupStyle(sizesStyle: .tiny, colorStyle: .primary ))
            }
            
            HStack(spacing: 20) {
                
                Button(action : {}, label: {Image(systemName: "star.fill").designSystemSquare(width: designSystemSize.large.iconScale)})
                    .buttonStyle(DesignSystemButtonGroupStyle(sizesStyle: .medium, colorStyle: .basic))
                
                Button(action : {}, label: {Image(systemName: "person").designSystemSquare(width: designSystemSize.large.iconScale)})
                    .buttonStyle(DesignSystemButtonGroupStyle(sizesStyle: .medium, colorStyle: .outline))
                
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
                            sizesStyle: .medium,
                            colorStyle: .primary
                        )
                    )
            }
        }
    }
}
