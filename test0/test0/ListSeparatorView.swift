//
//  ListSeparatorView.swift
//  test0
//
//  Created by Monophotic on 2023/1/8.
//

import Foundation
import SwiftUI

struct ListSeparatorView : View {
    @State private var text = ""
    @State private var updatedAuthors: [Author] = []
    var authors = [Author(name: "Meng To"), Author(name: "Stephanie Diep"), Author(name: "Willie Yam"), Author(name: "Sai Kambampati")]
    var messages = [Message(title: "Hello", content: "Hello my friend, how have you been? I've been wondering if you'd like to meet up sometime."), Message(title: "50% off sales", content: "Last chance to get a hold of last season's collection, now with an additional 50% off."), Message(title: "Required documents", content: "Hi, please find attached the required documents."), Message(title: "You have 8 new followers", content: "Congrats! Since yesterday, 8 new people followed you! Log into the app to see who they are.")]
    
    var body: some View {
        VStack {
            NavigationStack {
                List(text == "" ? authors : updatedAuthors) {
                    Text($0.name)
                        .listRowSeparatorTint(.cyan)
                        .listRowSeparator(.hidden)
                }
            }
            .searchable(text: $text)
            .onChange(of: text, perform: { searchValue in
                updatedAuthors = authors.filter({ $0.name.contains(searchValue)})
            })

            List(messages) {
                MessageView(message: $0)
                    .swipeActions(content: {
                        Button(action: {
                            print("deleted")
                        }, label: {
                            Label("Del", systemImage: "bin")
                        })
                        .tint(.red)
                    })
            }
        }
    }
}

struct Author: Identifiable {
    var id = UUID()
    var name: String
}

struct ListSeparatorViewPreview : PreviewProvider {
    static var previews: some View {
        ListSeparatorView()
    }
}
