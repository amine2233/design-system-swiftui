//
//  NavigationBars.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

#if os(iOS)
struct DesignSystemNavigationBarColor: ViewModifier {
    init(backgroundColor: UIColor, tintColor: UIColor) {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: tintColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = tintColor
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    public func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
        self.modifier(
            DesignSystemNavigationBarColor(
                backgroundColor: backgroundColor,
                tintColor: tintColor
            )
        )
    }
}

public struct DesignSystemNavigatorTop_Previews: PreviewProvider {
    public static var previews: some View {
        VStack() {
            NavigationView(content: {
                NavigationLink(destination: Text("Destination")) {
                    EmptyView()
                    Spacer()
                }
                .navigationBarTitle("Bar Title")
            })
            .navigationBarColor(backgroundColor: .systemTeal, tintColor: .white)
        }
    }
}

#endif

struct DesignSystemNavigatorTop: View {
    
    var title : String
    var subtitle: String = ""
    var leftIconString: String
    var rightIconStrings : [String]
    var buttonCommits : [()->()] = [{}, {}, {}]

    @Environment(\.colorTheme) private var colorTheme: ColorTheme

    init(
        title: String,
        subtitle: String = "",
        leftIconString: String,
        rightIconStrings: [String],
        buttonCommits: [() -> ()] = [{}, {}, {}]
    ) {
        self.title = title
        self.subtitle = subtitle
        self.leftIconString = leftIconString
        self.rightIconStrings = rightIconStrings
        self.buttonCommits = buttonCommits
    }
    
    
    var body: some View {
        
        HStack {
            Group {
                Button(action:
                        self.buttonCommits[0]
                ) {
                    HStack(spacing: 0) {
                        Image(systemName: self.leftIconString)
                            .designSystemSquare(width: 24)
                            .padding(.horizontal, 4)
                    }
                }
                .buttonStyle(LeftNavButtonStyle())
                Spacer()
                
                VStack {
                    Text(self.title).designSystemTypography(.h5, style: .info).offset(y: self.subtitle == "" ? 5: 0)
                    Text(self.subtitle).designSystemTypography(.p2)
                        .padding(.top, self.subtitle == "" ? 0: 5)
                }
                .offset(x: 23, y: 0)
                
                Spacer()
                
                HStack(spacing: 22){
                    Button(action: self.buttonCommits[1]) {
                        Image(systemName: self.rightIconStrings[0])
                            .designSystemSquare(width: 24)
                    }
                    Button(action: self.buttonCommits[2]) {
                        Image(systemName: self.rightIconStrings[1])
                            .designSystemSquare(width: 24)
                    }
                }
                .buttonStyle(RightNavButtonStyle())
                .padding(.horizontal, 4)
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        //.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(colorTheme.background)
        .foregroundColor(colorTheme.fontDisabled)
        .clipped()
        .shadow(color: colorTheme.primary, radius: 3, x: 0, y: 0)
        .animation(.default)
    }
    
}

public struct RightNavButtonStyle: ButtonStyle {
    @Environment(\.colorTheme) private var colorTheme: ColorTheme

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? colorTheme.primary: colorTheme.basic)
    }
}

public struct LeftNavButtonStyle: ButtonStyle {
    @Environment(\.colorTheme) private var colorTheme: ColorTheme

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? colorTheme.primary: colorTheme.fontStd)
    }
}
