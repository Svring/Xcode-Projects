//
//  TrackScrollView.swift
//  test0
//
//  Created by Monophotic on 2023/1/4.
//

import Foundation
import SwiftUI
import SwiftUITrackableScrollView

struct TrackScrollView : View {
    @State private var scrollViewContentOffset = CGFloat(0)
    
    var body: some View {
        TrackableScrollView(.vertical, contentOffset: $scrollViewContentOffset) {
            Text("\(scrollViewContentOffset)")
                .onChange(of: scrollViewContentOffset, perform: { value in
                    print(value)
                })
        }
    }
}

struct TrackScrollViewPreview : PreviewProvider {
    static var previews: some View {
        TrackScrollView()
    }
}
