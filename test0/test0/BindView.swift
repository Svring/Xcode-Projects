//
//  BindView.swift
//  test0
//
//  Created by Monophotic on 2023/1/3.
//

import Foundation
import SwiftUI

struct sourceView : View {
    @State var source = false
    
    var body: some View {
        ZStack {
            BindView(source: $source)
        }
    }
}

struct BindView : View {
    @Binding var source : Bool
    
    var body: some View {
        VStack {
            
        }
    }
}

struct BindViewPreview : PreviewProvider {
    static var previews: some View {
        BindView(source: .constant(true))
    }
}
