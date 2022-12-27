//
//  Card.swift
//  test0
//
//  Created by Monophotic on 2022/12/26.
//

import Foundation
import SwiftUI

struct cardView : View {
    @State var tap = false

    var body: some View {
        VStack {
            Text("View more").foregroundColor(.white)
        }
        .frame(width: 200, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30))
        .scaleEffect(tap ? 1.2 : 1)
        .animation(.spring(response: 0.4, dampingFraction: 0.6), value: tap)
        .onTapGesture {
            tap.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                tap.toggle()
            }
        }
    }
}

struct cardViewPreview : PreviewProvider {
    static var previews: some View {
        cardView()
    }
}
