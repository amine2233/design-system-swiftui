//
//  Typography.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

extension Color {
    static let designSystem: ColorTheme = Environment(\.colorTheme).wrappedValue
}

private struct DSRectangle: View {
    @Environment(\.colorTheme) private var colorTheme
    let key: KeyPath<ColorTheme, Color>

    init(key: KeyPath<ColorTheme, Color>) {
        self.key = key
    }

    var body: some View {
        Rectangle()
            .foregroundColor(colorTheme[keyPath: key])
    }
}

struct Color_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack{
                DSRectangle(key: \.basic)
                DSRectangle(key: \.background)
                DSRectangle(key: \.primary)
                DSRectangle(key: \.success)
                DSRectangle(key: \.info)
                DSRectangle(key: \.warning)
                DSRectangle(key: \.danger)
            }

            HStack{
                DSRectangle(key: \.basic)
                DSRectangle(key: \.background)
                DSRectangle(key: \.primary)
                DSRectangle(key: \.success)
                DSRectangle(key: \.info)
                DSRectangle(key: \.warning)
                DSRectangle(key: \.danger)
            }
            .environment(\.colorTheme, ColorThemeDefault2())

            Text("Colors!")
                .environment(\.colorScheme, .dark)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
