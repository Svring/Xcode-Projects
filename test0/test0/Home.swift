//
//  Home.swift
//  test0
//
//  Created by Monophotic on 2022/12/24.
//

import Foundation
import SwiftUI
import SwiftUIX

struct homeView : View {
    var body: some View {
        ZStack {
            VisualEffectBlurView(blurStyle: .systemUltraThinMaterial)
                .ignoresSafeArea()
            Text("Welcome home, would you like to fly with me?")
                .font(.system(size: 27, weight: .light, design: .serif))
                .italic()
                .foregroundColor(.secondary)
                .frame(width: 200)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
        }
        .navigationTitle("Home")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "person.crop.circle")
                }
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Image(systemName: "person")
                Spacer()
                HStack {
                    Image(systemName: "ellipsis")
                    Divider()
                    Image(systemName: "trash")
                        .frame(width: 34, height: 34)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .mask(Circle())
                }
            }
        }
    }
}

struct homeViewPreviewer : PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
