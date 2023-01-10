//
//  BlendView.swift
//  test0
//
//  Created by Monophotic on 2023/1/10.
//

import Foundation
import SwiftUI

struct BlendView : View {
    @State var position : CGSize
    
    var body: some View {
        ZStack {
            Image("BookRoom")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .offset(x: position.width, y: position.height)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            position = value.translation
                        })
                        .onEnded({ value in
                            withAnimation {
                                position = .zero
                            }
                        })
                )
            
            ZStack {
                text.foregroundColor(.white)
                    .blendMode(.difference)
                    .overlay(text.blendMode(.hue))
                    .overlay(text.foregroundColor(.white).blendMode(.overlay))
                    .overlay(text.foregroundColor(.black).blendMode(.overlay))
            }
        }
    }
    
    var text: some View {
        Text("One place to stack all your cards")
            .font(.system(size: 48, weight: .heavy, width: .expanded))
            .bold()
            .padding(20)
            .frame(width: 390)
    }
}

struct BlendViewPreview : PreviewProvider {
    static var previews: some View {
        BlendView(position: CGSize())
    }
}

extension Font {
    public static func system(
        size: CGFloat,
        weight: UIFont.Weight,
        width: UIFont.Width) -> Font
    {
        return Font(
            UIFont.systemFont(
                ofSize: size,
                weight: weight,
                width: width)
        )
    }
}
