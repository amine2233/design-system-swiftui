//
//  GroupButton+Extensions.swift
//  DesignSystem
//
//  Created by Micaela Cavallo on 07/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI

extension DesignSystemButtonGroupStyle {
    public enum SizeStyle {
        case giant, large, medium, small, tiny
        
        public var frameWidth: CGFloat {
            switch self {
            case .giant: return 56
            case .large: return 48
            case .medium: return 40
            case .small: return 32
            case .tiny: return 24
            }
        }
        
        public var iconScale: CGFloat {
            switch self {
            case .giant: return 26
            case .large: return 22
            case .medium: return 18
            case.small: return 14
            case .tiny: return 10
            }
        }
        
        public var fontSize: CGFloat {
            switch self {
            case .giant: return 36
            case .large: return 32
            case .medium: return 24
            case.small: return 20
            case .tiny: return 16
            }
        }
    }
    
    public enum Style {
        case primary, basic, outline
        
        public var defaultBackground: Color {
            switch self {
            case .primary: return .designSystemPrimary
            case .basic: return .designSystemBasic
            case .outline: return .white
            }
        }
        
        public var activeBackground: Color {
            switch self {
            case .primary: return .designSystemActivePrimary
            case .basic: return .designSystemActiveBasic
            case .outline: return .designSystemPrimary
            }
        }
        
        public var defaultForeground: Color {
            switch self {
            case .primary: return .white
            case .basic: return .black
            case .outline: return .designSystemActiveBasic
            }
        }
        
        public var activeForeground: Color {
            switch self {
            case .basic: return .black
            default: return .white
            }
        }
    }
}
