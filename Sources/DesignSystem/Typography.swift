//
//  Typography.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct DesignSystemTypography: ViewModifier {

    @Environment(\.colorTheme) private var colorTheme: ColorTheme
    
    var typography: DesignSystem.Typography
    var style: DesignSystem.Typography.Style
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: typography.size, weight: typography.weight))
            .foregroundColor(style.color(colorTheme))
    }
}

extension View {
    public func designSystemTypography(
        _ typography: DesignSystem.Typography,
        style: DesignSystem.Typography.Style = .default
    ) -> some View {
        self.modifier(DesignSystemTypography(typography: typography, style: style))
    }
}


struct Typography_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:0) {
            Group {
                Text("Typography h1").designSystemTypography(.h1, style: .primary)
                Text("Typography h1").designSystemTypography(.h1, style: .success)
                Text("Typography h1").designSystemTypography(.h1, style: .danger)
            
                Text("Typography h1").designSystemTypography(.h1)
                Text("Typography h2").designSystemTypography(.h2)
                Text("Typography h3").designSystemTypography(.h3)
                Text("Typography h4").designSystemTypography(.h4)
                Text("Typography h5").designSystemTypography(.h5)
                Text("Typography h6").designSystemTypography(.h6)
            }
            .padding()
            Group {
                Text("Typography h1").designSystemTypography(.s1)
                Text("Typography h2").designSystemTypography(.s2)
                
                Text("Typography p1").designSystemTypography(.p1)
                Text("Typography p2").designSystemTypography(.p2)
                
                Text("Typography c1").designSystemTypography(.c1)
                Text("Typography c2").designSystemTypography(.c2)
            }
            .padding()
        }
        .padding()
        .frame(height: 960.0)
    }
}
