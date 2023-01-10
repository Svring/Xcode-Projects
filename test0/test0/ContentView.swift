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
                    let trans = Transaction(animation: .spring())
                    withTransaction(trans) {
                        Label("Card", systemImage: "creditcard")
                    }
                }
                NavigationLink(destination: LottieView(name: "Lottie Lego", loopMode: .loop)) {
                    Label("Lottie", systemImage: "lasso.and.sparkles")
                }
                NavigationLink(destination: GridView()) {
                    Label("Grid", systemImage: "doc")
                }
                NavigationLink(destination: HoverView()) {
                    Label("Hover", systemImage: "cursorarrow.click")
                }
                NavigationLink(destination: FullView()) {
                    Label("Full", systemImage: "filemenu.and.cursorarrow")
                }
                NavigationLink(destination: StatusColorView()) {
                    Label("StatusColor", systemImage: "iphone")
                }
                NavigationLink(destination: BackAnimeView()) {
                    Label("Background Animation", systemImage: "paintpalette")
                }
            }
            .navigationTitle("Today")
            .navigationBarItems(leading: Image(systemName: "person.crop.circle"))

            homeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
