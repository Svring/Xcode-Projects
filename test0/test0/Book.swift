//
//  book.swift
//  test0
//
//  Created by Monophotic on 2022/12/24.
//

import Foundation
import SwiftUI

struct bookView : View {
    var body: some View {
        ZStack {
            Image("BookRoom")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Text("Which book you'd want to read?")
                .font(.system(size: 27, weight: .light, design: .serif))
                .italic()
                .foregroundColor(.secondary)
        }
        .navigationTitle("Book")
    }
}

struct bookViewProvider : PreviewProvider {
    static var previews: some View {
        bookView()
    }
}
