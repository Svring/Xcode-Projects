//
//  HScrollView.swift
//  test0
//
//  Created by Monophotic on 2023/1/3.
//

import Foundation
import SwiftUI

struct HScrollView : View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0 ..< 5) { item in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 30)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .rotation3DEffect(
                                Angle(
                                    degrees: Double((geometry.frame(in: .global).minX - 20) / -20)
                                ),
                                axis: (x: 0, y: 1, z: 0),
                                anchor: .center,
                                anchorZ: 0.0,
                                perspective: 1.0
                            )
                    }
                    .frame(width: 300, height: 300)
                }
            }
            .padding()
        }
    }
}

struct annulusView : View {
    @State var appear = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.2, to: 1)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(width: 44, height: 44)
                .rotationEffect(Angle(degrees: appear ? 360 : 0))
                .animation(
                    Animation.linear(duration: 2).repeatForever(autoreverses: false),
                    value: appear
                )
                .onAppear {
                    appear = true
                }
        }
    }
}

struct HScrollViewPreview : PreviewProvider {
    static var previews: some View {
        annulusView()
    }
}
