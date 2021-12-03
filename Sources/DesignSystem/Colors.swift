//
//  Typography.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public extension Color {
    
    // MARK: Basic Colors
    
    static let designSystemBackground = Color("background", bundle: .module)
    static let designSystemBasic = Color("basic", bundle: .module)
    static let designSystemPrimary = Color("primary", bundle: .module)
    
    // MARK: Font Colors
    
    /// Standard Font Color
    static let designSystemFontStd = Color("font_std", bundle: .module)
    /// Hint Font Color
    static let designSystemFontHint = Color("font_hint", bundle: .module)
    /// Disabled Font Color
    static let designSystemFontDisabled = Color("font_disabled", bundle: .module)
    /// Button Font Color
    static let designSystemFontBtn = Color("font_button", bundle: .module)
    
    // MARK: Semantic Colors
    
    static let designSystemDanger = Color("danger", bundle: .module)
    static let designSystemInfo = Color("info", bundle: .module)
    static let designSystemSuccess = Color("success", bundle: .module)
    static let designSystemWarning = Color("warning", bundle: .module)
    
    // MARK: State Colors
    
    /// Active State Color - Primary Style
    static let designSystemActivePrimary = Color("activePrimary", bundle: .module)
    /// Active State Color - Basic Style
    static let designSystemActiveBasic = Color("activeBasic", bundle: .module)
}

struct Color_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack{
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.designSystemBasic)
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.designSystemPrimary)
                Rectangle().size(CGSize(width: 50, height: 50))
                    .foregroundColor(.designSystemSuccess)
                Rectangle().size(CGSize(width: 50, height: 50))
                .foregroundColor(.designSystemInfo)
                Rectangle().size(CGSize(width: 50, height: 50))
                .foregroundColor(.designSystemWarning)
                Rectangle().size(CGSize(width: 50, height: 50))
                .foregroundColor(.designSystemDanger)
            }
            Text("Hello, World!")
                .foregroundColor(.designSystemActivePrimary)
                .background(Color.designSystemActiveBasic)
                .environment(\.colorScheme, .dark)
        }
    .padding()
    }
}
