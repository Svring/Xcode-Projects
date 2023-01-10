//
//  AttributeView.swift
//  test0
//
//  Created by Monophotic on 2023/1/7.
//

import Foundation
import SwiftUI

struct AttrubuteView : View {
    let markdown = "Visit [Design Code](https://designcode.io) to learn how to `code` and *design*."
    
    var myString: AttributedString {
        var name = AttributedString("Stephanie")
        var container = AttributeContainer()
        container.foregroundColor = .blue
        container.underlineStyle = .single
        container.underlineColor = .blue
        name.mergeAttributes(container)
        return "Hello, " + name
    }
    
    var yourString : AttributedString {
        do {
            return try AttributedString(markdown: markdown)
        } catch {
            return "False"
        }
    }
    
    var body: some View {
        return VStack(spacing: 16) {
            Text(myString).bold()
            Text(yourString)
        }
    }
}

struct AttributeViewPreview : PreviewProvider {
    static var previews: some View {
        AttrubuteView()
    }
}
