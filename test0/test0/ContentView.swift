//
//  ContentView.swift
//  test0
//
//  Created by Monophotic on 2022/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: homeView()) {
                    Label("Home", systemImage: "house")
                }
                NavigationLink(destination: bookView()) {
                    Label("Book", systemImage: "book")
                }
                NavigationLink(destination: chipView()) {
                    Label("Chip", systemImage: "command.circle")
                }
                NavigationLink(destination: cardView()) {
                    Label("Card", systemImage: "creditcard")
                }
            }

            homeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
