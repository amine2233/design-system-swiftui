//
//  File.swift
//  
//
//  Created by work on 02/12/2022.
//

import SwiftUI

public struct DesignSystem {
    public enum Style {
        case `default`, primary, disabled, success, warning, danger, info

        func color(_ theme: ColorTheme) -> Color {
            switch self {
                case .default: return theme.basic
                case .primary: return theme.primary
                case .disabled: return theme.fontDisabled
                case .danger: return theme.danger
                case .warning: return theme.warning
                case .info: return theme.info
                case .success: return theme.success
            }
        }
    }

    public enum ContentMode {
        case fill, outline, ghost
    }

    public enum Size {
        case extraLarge, large, medium, small, tiny

        public var frameWidth: CGFloat {
            switch self {
            case .extraLarge: return 60
            case .large: return 52
            case .medium: return 44
            case .small: return 36
            case .tiny: return 28
            }
        }

        public var iconScale: CGFloat {
            switch self {
            case .extraLarge: return 26
            case .large: return 22
            case .medium: return 18
            case .small: return 14
            case .tiny: return 10
            }
        }

        public var fontSize: CGFloat {
            switch self {
            case .extraLarge: return 36
            case .large: return 32
            case .medium: return 24
            case.small: return 20
            case .tiny: return 16
            }
        }
    }

    public enum Typography {

        /// Titles
        case h1, h2, h3, h4, h5, h6

        /// Subtitles
        case s1, s2

        /// Paragraphs
        case p1, p2

        /// Captions
        case c1, c2

        var size: CGFloat {
            switch self {
                case .h1: return 36.0
                case .h2: return 32.0
                case .h3: return 30.0
                case .h4: return 26.0
                case .h5: return 22.0
                case .h6: return 18.0
                case .s1: return 15.0
                case .s2: return 13.0
                case .p1: return 15.0
                case .p2: return 13.0
                case .c1: return 12.0
                case .c2: return 12.0
            }
        }

        var weight: Font.Weight {
            switch self {
                case .h1, .h2, .h3, .h4, .h5, .h6: return .bold
                case .s1, .s2: return .semibold
                case .p1, .p2: return .regular
                case .c1: return .medium
                case .c2: return .regular
            }
        }

        public enum Style {
            case `default`, button, primary, disabled, success, warning, danger, info

            func color(_ theme: ColorTheme) -> Color {
                switch self {
                    case .default: return theme.fontStd
                    case .button: return theme.fontBtn
                    case .primary: return theme.primary
                    case .disabled: return theme.fontDisabled
                    case .danger: return theme.danger
                    case .warning: return theme.warning
                    case .info: return theme.info
                    case .success: return theme.success
                }
            }
        }
    }
}
