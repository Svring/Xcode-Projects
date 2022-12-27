//
//  Container.swift
//  test0
//
//  Created by Monophotic on 2022/12/26.
//

import Foundation
import SwiftUI

struct chipView : View {
    var body: some View {
        VStack {
            Text("M800")
                .font(.largeTitle).bold()
                .frame(width: 300, height: 300)
        }
        .padding()
        .background(
            LinearGradient(colors: [Color.pink, Color.blue, Color.purple], startPoint: .top, endPoint: .bottom)
        )
        .mask (
            LinearGradient(colors: [Color.black, Color.black.opacity(0)], startPoint: .leading, endPoint: .trailing)
        )
    }
}

struct chipViewPreview : PreviewProvider {
    static var previews: some View {
        chipView()
    }
}
