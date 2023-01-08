//
//  StatusColorView.swift
//  test0
//
//  Created by Monophotic on 2023/1/7.
//

import Foundation
import SwiftUI
import SwiftUITrackableScrollView

struct StatusColorView : View {
    @State private var scrollViewContentOffset : CGFloat = .zero
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            TrackableScrollView(.vertical, contentOffset: $scrollViewContentOffset) {
                Text("Hello world! \(scrollViewContentOffset)")
                    .padding()
            }
            
            Rectangle()
                .foregroundColor(.white)
                .opacity(scrollViewContentOffset > 16 ? 0 : 1)
                .animation(.spring(), value: scrollViewContentOffset)
                .ignoresSafeArea()
                .frame(height: 0)
        }
        
        .statusBarHidden(scrollViewContentOffset > 16 ? true : false)
    }
}

struct StatusColorViewPreview : PreviewProvider {
    static var previews: some View {
        StatusColorView()
    }
}
