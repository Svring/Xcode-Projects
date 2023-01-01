//
//  MEGmainview.swift
//  test0
//
//  Created by Monophotic on 2022/12/29.
//

import Foundation
import SwiftUI

struct MEGmainview : View {
    @State var show = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            if !show {
                VStack {
                    HStack(spacing: 16) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 44)
                            .matchedGeometryEffect(id: "shape", in: namespace)
                        Text("Fever")
                            .matchedGeometryEffect(id: "title", in: namespace)
                        Spacer()
                        Image(systemName: "play.fill")
                            .font(.title)
                            .matchedGeometryEffect(id: "play", in: namespace)
                        Image(systemName: "forward.fill")
                            .font(.title)
                            .matchedGeometryEffect(id: "forward", in: namespace)
                            
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 44)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                        .matchedGeometryEffect(id: "bg", in: namespace)
                )
            } else {
                MEGplayview(namespace: namespace)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

struct MEGmainpreview : PreviewProvider {
    static var previews: some View {
        MEGmainview()
    }
}
