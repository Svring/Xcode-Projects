//
//  MEGplayview.swift
//  test0
//
//  Created by Monophotic on 2022/12/29.
//

import Foundation
import SwiftUI

struct MEGplayview : View {
    var namespace : Namespace.ID
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 300)
                .padding()
                .matchedGeometryEffect(id: "shape", in: namespace)
            Text("Fever")
                .matchedGeometryEffect(id: "title", in: namespace)
            HStack {
                Image(systemName: "play.fill")
                    .font(.title)
                    .matchedGeometryEffect(id: "play", in: namespace)
                Image(systemName: "forward.fill")
                    .font(.title)
                    .matchedGeometryEffect(id: "forward", in: namespace)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .matchedGeometryEffect(id: "bg", in: namespace)
        )
        .ignoresSafeArea()
    }
}

struct MEGplaypreview : PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        MEGplayview(namespace: namespace)
    }
}
