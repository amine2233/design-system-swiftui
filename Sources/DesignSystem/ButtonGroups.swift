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
    var colorStyle : ColorStyle
    var size : Size
    
    public enum Size {
        case giant, large, medium, small, tiny
        
        public var style: DesignSystemButtonGroupStyle.SizeStyle {
            switch self {
            case .giant: return DesignSystemButtonGroupStyle.SizeStyle.giant
            case .large: return DesignSystemButtonGroupStyle.SizeStyle.large
            case .medium: return  DesignSystemButtonGroupStyle.SizeStyle.medium
            case .small: return  DesignSystemButtonGroupStyle.SizeStyle.small
            case .tiny: return DesignSystemButtonGroupStyle.SizeStyle.tiny
            }
        }
    }
    
    public typealias ColorStyle = DesignSystemButtonGroupStyle.Style
    
    public init(icon: Image? = nil, buttonItems: Int, text: String = "", colorStyle: DesignSystemButtonGroup.ColorStyle, size: DesignSystemButtonGroup.Size) {
        self.icon = icon
        self.buttonItems = buttonItems
        self.text = text
        self.colorStyle = colorStyle
        self.size = size
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
                                    self.icon!.designSystemSquare(width: self.size.style.iconScale)
                                } else {
                                    Text(self.text)
                                }
                            }
                        }
                    ).buttonStyle(DesignSystemButtonGroupStyle(sizesStyle: self.size.style, colorStyle: self.colorStyle))
                }
                
            }.cornerRadius(self.size.style.frameWidth / 10)
                .overlay(RoundedRectangle(cornerRadius: ((colorStyle == ColorStyle.outline)) ? (self.size.style.frameWidth / 10) : 0).stroke(Color.designSystemActiveBasic, lineWidth:(colorStyle == ColorStyle.outline) ? 1 : 0))
        }
    }
}


struct ButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        VStack {

            DesignSystemButtonGroup(icon: Image(systemName: "star"), buttonItems: 5, text: "won't read me", colorStyle: .primary, size: .giant)

            DesignSystemButtonGroup(icon: nil, buttonItems: 5, text: "L", colorStyle: .basic, size: .large)
            
            DesignSystemButtonGroup(icon: Image(systemName: "person"), buttonItems: 5, text: "hi", colorStyle: .outline, size: .medium)

            DesignSystemButtonGroup(icon: nil, buttonItems: 5, text: "S", colorStyle: .primary, size: .small)

            DesignSystemButtonGroup(icon: Image(systemName: "umbrella.fill"), buttonItems: 5, text: "T", colorStyle: .basic, size: .tiny)
        }
    }
}
