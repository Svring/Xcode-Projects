//
//  MessageView.swift
//  test0
//
//  Created by Monophotic on 2023/1/8.
//

import Foundation
import SwiftUI

struct MessageView : View {
    var message : Message
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(message.title)
                .font(.headline)
                .bold()

            Text(message.content)
                .foregroundColor(.gray)
                .lineLimit(2)
        }
    }
}

struct Message: Identifiable {
    var id = UUID()
    var title: String
    var content: String
}

struct MessageViewPreview : PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(title: "Hello", content: "Hello my friend, how have you been? I've been wondering if you'd like to meet up sometime."))
    }
}
