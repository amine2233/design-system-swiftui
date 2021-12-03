//
//  Typography.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct DesignSystemTypography: ViewModifier {
    
    public enum Style {
        
        /// Titles
        case h1, h2, h3, h4, h5, h6
        
        /// Subtitles
        case s1, s2
        
        /// Paragraphs
        case p1, p2
        
        /// Captions
        case c1, c2
    }
    
    var style: Style
    
    public func body(content: Content) -> some View {
        switch style {
        case .h1: return content
            .font(.system(size: 36, weight: .bold))
        case .h2: return content
            .font(.system(size: 32, weight: .bold))
        case .h3: return content
            .font(.system(size: 30, weight: .bold))
        case .h4: return content
            .font(.system(size: 26, weight: .bold))
        case .h5: return content
            .font(.system(size: 22, weight: .bold))
        case .h6: return content
            .font(.system(size: 18, weight: .bold))
            
        case .s1: return content
            .font(.system(size: 15, weight: .semibold))
        case .s2: return content
            .font(.system(size: 13, weight: .semibold))
            
        case .p1: return content
            .font(.system(size: 15, weight: .regular))
        case .p2: return content
            .font(.system(size: 13, weight: .regular))
            
        case .c1: return content
            .font(.system(size: 12, weight: .regular))
        case .c2: return content
            .font(.system(size: 12, weight: .bold))
        }
    }
}

extension View {
    public func designSystemTypography(_ style: DesignSystemTypography.Style) -> some View {
        self
            .modifier(DesignSystemTypography(style: style))
    }
    
    public func designSystemTypography(_ style: DesignSystemTypography.Style, color: Color) -> some View {
        self
            .modifier(DesignSystemTypography(style: style))
            .foregroundColor(color)
    }
}


struct Typography_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            Group {
                Text("Typography h1").designSystemTypography(.h1, color: .designSystemPrimary)
                Text("Typography h1").designSystemTypography(.h1, color: .designSystemSuccess)
                Text("Typography h1").designSystemTypography(.h1, color: .designSystemDanger)
            
                Text("Typography h1").designSystemTypography(.h1)
                Text("Typography h2").designSystemTypography(.h2)
                Text("Typography h3").designSystemTypography(.h3)
                Text("Typography h4").designSystemTypography(.h4)
                Text("Typography h5").designSystemTypography(.h5)
                Text("Typography h6").designSystemTypography(.h6)
            }
            Group {
                Text("Typography h1").designSystemTypography(.s1)
                Text("Typography h2").designSystemTypography(.s2)
                
                Text("Typography p1").designSystemTypography(.p1)
                Text("Typography p2").designSystemTypography(.p2)
                
                Text("Typography c1").designSystemTypography(.c1)
                Text("Typography c2").designSystemTypography(.c2)
            }
        }
    }
}
