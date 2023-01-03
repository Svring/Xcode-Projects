//
//  DateView.swift
//  test0
//
//  Created by Monophotic on 2023/1/2.
//

import Foundation
import SwiftUI

struct HoverView : View {
    @State var isHover = false

    var body: some View {
        VStack {
            SubTextView()
            Button(action: {}) {
                Text("Hover Effect")
            }
            .padding()
            .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .hoverEffect(.highlight)
            Text("Hover Effect")
                .padding()
                .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .scaleEffect(isHover ? 1.2 : 1)
                .animation(.spring(), value: isHover)
                .onHover { hover in
                    isHover = hover
                }
        }
        .padding()
    }
}

struct HoverViewPreview : PreviewProvider {
    static var previews: some View {
        HoverView()
    }
}

struct SubTextView: View {
    var body: some View {
        Text("Hover Effect")
            .padding()
            .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .hoverEffect(.lift)
    }
}
