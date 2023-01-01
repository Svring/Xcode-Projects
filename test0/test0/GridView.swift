//
//  GridView.swift
//  test0
//
//  Created by Monophotic on 2022/12/31.
//

import Foundation
import SwiftUI

struct GridView : View {
    var body: some View {
        VStack {
            LazyVGrid(
                columns: [
                    GridItem(.fixed(100), spacing: 8),
                    GridItem(.fixed(160), spacing: 8),
                    GridItem(.fixed(80), spacing: 8)
                ], spacing: 12) {

                ForEach(0 ..< 20) { item in
                    Rectangle()
                        .frame(height: 80)
                }
            }
            Link("Design + Code", destination: URL(string: "https://designcode.io")!)
        }
    }
}

struct GridViewPreview : PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
