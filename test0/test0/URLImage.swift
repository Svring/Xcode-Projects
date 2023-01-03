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
        ZStack {
            WebImage(url: url)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 330, height: 330)
                .clipShape(Circle())
        }
    }
}

struct URLImageViewPreview : PreviewProvider {
    static var previews: some View {
        URLImageView()
    }
}
