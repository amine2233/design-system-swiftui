//
//  Cards.swift
//  DesignSystem
//
//  Created by Samuel Kebis on 11/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI

public struct DesignSystemCard: View {
    public init(image: Image? = nil, title: String, subtitle: String = "", text: String, caption: String = "") {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.caption = caption
    }
    
    var image: Image? = nil
    var title: String
    var subtitle: String = ""
    var text: String
    var caption: String = ""
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            image?
                .resizable()
                .frame(height: 144.0, alignment: .center)
            Text(title)
                .designSystemTypography(.h6)
                .padding(.horizontal)
                .padding(.top, 14)
                .padding(.bottom, 6)
            if !subtitle.isEmpty {
                Text(subtitle)
                    .designSystemTypography(.s2)
                    .padding(.horizontal)
            }
            Divider()
                .padding(.vertical, 16)
            Text(text)
                .designSystemTypography(.p1)
                .opacity(0.8)
                .padding(.horizontal)
                .padding(.bottom, 8)
            if !caption.isEmpty {
                Divider()
                Text(caption)
                    .designSystemTypography(.c2)
                    .padding()
            }
        }
    }
}

struct DesignSystemCards_Previews: PreviewProvider {
    static let img = Image("bricks_banner", bundle: .module)
    static let text = "A nebula is an interstellar cloud of dust, hydrogen, helium and other ionized gases. Originally, nebula was a name for any diffuse astronomical object, including galaxies beyond the Milky Way."
    
    static var previews: some View {
        Group {
            DesignSystemCard(
                image: img,
                title: "Title",
                subtitle: "Subtitle",
                text: text,
                caption: "Caption"
            )
            DesignSystemCard(
                image: img,
                title: "Title",
                subtitle: "Subtitle",
                text: text
            )
            DesignSystemCard(
                title: "Title",
                subtitle: "Subtitle",
                text: text
            )
            DesignSystemCard(
                title: "Title",
                text: text
            )
        }
        .frame(width: 300.0)
        .previewLayout(.sizeThatFits)
    }
}
