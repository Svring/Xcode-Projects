//
//  URLImage.swift
//  test0
//
//  Created by Monophotic on 2023/1/3.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct URLImageView : View {
    @State var url = URL(string: "https://picsum.photos/200/300")!
    
    var body: some View {
        VStack(spacing: 32) {
            WebImage(url: url)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 330, height: 330)
                .clipShape(Circle())
            // Webimage sticks to just one request and its response,
            // whereas Asyncimage will make new request once again
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 330, height: 330)
                    .mask(Circle())
            } placeholder: {
                Circle().stroke()
                    .frame(width: 330)
            }
        }
    }
}

struct URLImageViewPreview : PreviewProvider {
    static var previews: some View {
        URLImageView()
    }
}
