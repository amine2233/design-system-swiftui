//
//  Selection.swift
//  DesignSystem
//
//  Created by Carlos Bystron on 04.05.20.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import Foundation
import SwiftUI

struct DesignSystemSelection: View {

    var placeholder: String
    var style: DesignSystem.Style = .default
    var icon: Image? = nil
    var commit: () -> Void = { }
    @State private var focused: Bool = false
    @State var input: String = ""

    @Environment(\.colorTheme) private var colorTheme: ColorTheme
    
    // MARK:  Body
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(colorTheme.basic) }
                TextField("", text: $input, onEditingChanged: { (editingChanged) in
                    if editingChanged {
                        self.focused = true
                    } else {
                        self.focused = false
                    }
                }, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(style.color(colorTheme))
            }
            if focused == true { icon.imageScale(.large).foregroundColor(style.color(colorTheme)) }
            else { icon.imageScale(.large).foregroundColor(colorTheme.basic) }
        }
         .padding()
         .background(RoundedRectangle(cornerRadius: 5).foregroundColor(self.focused ? colorTheme.basic.opacity(0) : colorTheme.basic.opacity(0.1)))
         .overlay(RoundedRectangle(cornerRadius: 5).stroke(self.focused ? style.color(colorTheme) : colorTheme.basic.opacity(0.4), lineWidth: 1))
    }
}

// MARK: Preview

struct Selection_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack(spacing: 20) {
            DesignSystemSelection(placeholder: "Test")
            DesignSystemSelection(placeholder: "Default style", style: .primary, icon: nil, commit: {}, input: "")
        }
        .padding()
    }
}
