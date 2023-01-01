//
//  ColorView.swift
//  test0
//
//  Created by Monophotic on 2023/1/1.
//

import Foundation
import SwiftUI

struct ColorView : View {
    @State var color = Color.blue
    @State var color2 = Color.purple

    var body: some View {
        VStack {
            ColorPicker("Color 1", selection: $color)
            ColorPicker("Color 2", selection: $color2)
            RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradient(gradient: Gradient(colors: [color, color2]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(maxHeight: 300)
        }
        .padding()
    }
}

struct ColorViewPreview : PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}
