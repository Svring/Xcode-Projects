//
//  RedactView.swift
//  test0
//
//  Created by Monophotic on 2023/1/3.
//

import Foundation
import SwiftUI

struct RedactView : View {
    @State var isLoading = true
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.purple, Color.pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            CardView()
                .redacted(reason: isLoading ? .placeholder : .init())
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        isLoading = false
                    }
                }
        }
    }
}

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(systemName: "dot.circle.and.cursorarrow")
                .resizable().aspectRatio(contentMode: .fit)
                .mask(Circle())
                .frame(width: 44, height: 44)
            Text("Designing fluid interfaces")
                .font(.title2).bold()
            Text("By Chan Karunamuni".uppercased())
                .font(.footnote).bold()
                .foregroundColor(.secondary)
            Text("Discover the techniques used to create the fluid gestural interface of iPhone X. Learn how to design with gestures and motion that feel intuitive and natural, making your app a delight to use.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 300)
        .background(Color.white)
        //.clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 40)
        .padding()
    }
}

struct RedactViewPrevew : PreviewProvider {
    static var previews: some View {
        RedactView()
    }
}
