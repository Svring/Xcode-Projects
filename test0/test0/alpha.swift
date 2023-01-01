//
//  alpha.swift
//  test0
//
//  Created by Monophotic on 2022/12/29.
//

import Foundation
import SwiftUI

struct alphaView : View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                ScrollView {
                    HStack {
                        VStack {
                            Text("Title").foregroundColor(.white)
                                .matchedGeometryEffect(id: "title", in: namespace)
                        }
                        .frame(width: 100, height: 100)
                        .background(
                            Rectangle().matchedGeometryEffect(id: "shape", in: namespace)
                        )
                        Rectangle()
                            .frame(width: 100, height: 100)
                        Spacer()
                    }
                    .padding(8)
                }
            } else {
                VStack {
                    Text("Title").foregroundColor(.white)
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(
                    Rectangle().matchedGeometryEffect(id: "shape", in: namespace)
                )
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                show.toggle()
            }
        }
    }
}

struct alphaViewPreview : PreviewProvider {
    static var previews: some View {
        alphaView()
    }
}
