//
//  TabShiftView.swift
//  test0
//
//  Created by Monophotic on 2023/1/3.
//

import Foundation
import SwiftUI

struct TabSwiftView : View {
    @State var tabSelection : Int = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            FirstTab(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "keyboard")
                }
                .tag(1)
            SecondTab(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "keyboard.fill")
                }
                .tag(2)
        }
    }
}

struct FirstTab : View {
    @Binding var tabSelection : Int
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: { tabSelection = 2 } ) {
                Label("Shift", systemImage: "keyboard.fill")
            }
            GeometryReader { geometry in
                VStack {
                    Text("\(geometry.safeAreaInsets.top)")
                        .padding()
                    Text("\(geometry.safeAreaInsets.bottom)")
                        .padding()
                }
            }
        }
        .padding()
    }
}

struct SecondTab : View {
    @Binding var tabSelection : Int
    @State var showModal = false
    
    var body: some View {
        VStack(spacing: 16) {
            Button(action: { tabSelection = 1 } ) {
                Label("Shift", systemImage: "keyboard")
            }
            Button(action: {
                showModal = true
            }) {
                Text("Sign in")
            }
            .sheet(isPresented: $showModal, content: {
                GridView()
            })
        }
    }
}

struct TabShiftViewPreview : PreviewProvider {
    static var previews: some View {
        TabSwiftView()
    }
}
