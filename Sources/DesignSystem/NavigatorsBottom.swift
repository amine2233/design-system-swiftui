//
//  NavigatorsBottom.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct DesignSystemNavigatorBottom : View {
    
    @State var index : Int
    var icons: [String]
    //var text : [String]? = [""]
    
    public init(index : Int, icons: [String]) {
        self.index = index
        self.icons = icons
    }
    
    public var body : some View {
        GeometryReader { g in
            HStack(spacing: 0) {
                return self.makeTabs(totalWidth: g.size.width)
            }
        }.frame(height: 56)
    }
    
    func makeTabs(totalWidth: CGFloat) -> some View {
        HStack(spacing: 0) {
            ForEach(0..<icons.count) { i in
                
                Button(action: {self.index = i}, label: {
                    VStack {
                        Rectangle().frame(height: 4).foregroundColor(self.index == i ? Color.designSystemPrimary : Color.clear)
                        Image(systemName: self.icons[i])
                            .designSystemSquare(width: self.index == i ? 24 : 21)
                            .foregroundColor(self.index == i ? Color.designSystemPrimary : Color.designSystemFontDisabled)
                            .padding(.bottom, 24)
                            .padding(.top, 10)
                    }
                    .background(Color.designSystemBackground)
                    .frame(width: totalWidth / CGFloat(self.icons.count))
                    .animation(.easeOut(duration: 0.35))
                })
            }
        }
    }
}


struct DesignSystemNavigatorBottom_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ZStack {Color.designSystemPrimary.opacity(0.4)}
            
            DesignSystemNavigatorBottom(index: 0, icons: ["house.fill", "magnifyingglass", "heart.fill", "person.fill"])
        }
        .edgesIgnoringSafeArea(.all)
    }
}
