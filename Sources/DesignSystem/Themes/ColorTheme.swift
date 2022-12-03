//
//  File.swift
//
//
//  Created by Amine Bensalah on 08/12/2021.
//

import SwiftUI

public struct ColorThemeEnvironmentKey: EnvironmentKey {
    public static let defaultValue: ColorTheme = ColorThemeDefault()
}

extension EnvironmentValues {
    public var colorTheme: ColorTheme {
        get { self[ColorThemeEnvironmentKey.self] }
        set { self[ColorThemeEnvironmentKey.self] = newValue }
    }
}

extension View {
    func colorThemeValue(_ colorThemeValue: ColorTheme) -> some View {
        environment(\.colorTheme, colorThemeValue)
    }

    func designSystemBackground(_ colorThemeKey: KeyPath<ColorTheme, Color>) -> some View {
        background(Environment(\.colorTheme).wrappedValue[keyPath: colorThemeKey])
    }

    func designSystemForegroundColor(_ colorThemeKey: KeyPath<ColorTheme, Color>) -> some View {
        foregroundColor(Environment(\.colorTheme).wrappedValue[keyPath: colorThemeKey])
    }
}

public protocol ColorTheme {
    // MARK: Basic Colors

    var background: Color { get }
    var basic: Color { get }
    var primary: Color { get }

    // MARK: Font Colors

    /// Standard Font Color
    var fontStd: Color { get }
    /// Hint Font Color
    var fontHint: Color { get }
    /// Disabled Font Color
    var fontDisabled: Color { get }
    /// Button Font Color
    var fontBtn: Color { get }

    // MARK: Semantic Colors

    var danger: Color { get }
    var info: Color { get }
    var success: Color { get }
    var warning: Color { get }

    // MARK: State Colors

    /// Active State Color - Primary Style
    var activePrimary: Color { get }
    /// Active State Color - Basic Style
    var activeBasic: Color { get }
}

struct ColorThemeDefault: ColorTheme {
    // MARK: Basic Colors

    let background = Color("background", bundle: .module)
    let basic = Color("basic", bundle: .module)
    let primary = Color("primary", bundle: .module)

    // MARK: Font Colors

    /// Standard Font Color
    let fontStd = Color("font_std", bundle: .module)
    /// Hint Font Color
    let fontHint = Color("font_hint", bundle: .module)
    /// Disabled Font Color
    let fontDisabled = Color("font_disabled", bundle: .module)
    /// Button Font Color
    let fontBtn = Color("font_button", bundle: .module)

    // MARK: Semantic Colors

    let danger = Color("danger", bundle: .module)
    let info = Color("info", bundle: .module)
    let success = Color("success", bundle: .module)
    let warning = Color("warning", bundle: .module)

    // MARK: State Colors

    /// Active State Color - Primary Style
    let activePrimary = Color("activePrimary", bundle: .module)
    /// Active State Color - Basic Style
    let activeBasic = Color("activeBasic", bundle: .module)
}

struct ColorThemeDefault2: ColorTheme {
    // MARK: Basic Colors

    let background = Color.red
    let basic = Color.red
    let primary = Color.red

    // MARK: Font Colors

    /// Standard Font Color
    let fontStd = Color("font_std", bundle: .module)
    /// Hint Font Color
    let fontHint = Color("font_hint", bundle: .module)
    /// Disabled Font Color
    let fontDisabled = Color("font_disabled", bundle: .module)
    /// Button Font Color
    let fontBtn = Color("font_button", bundle: .module)

    // MARK: Semantic Colors

    let danger = Color("danger", bundle: .module)
    let info = Color("info", bundle: .module)
    let success = Color("success", bundle: .module)
    let warning = Color("warning", bundle: .module)

    // MARK: State Colors

    /// Active State Color - Primary Style
    let activePrimary = Color("activePrimary", bundle: .module)
    /// Active State Color - Basic Style
    let activeBasic = Color("activeBasic", bundle: .module)
}
