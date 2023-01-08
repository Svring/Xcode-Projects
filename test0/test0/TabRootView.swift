//
//  TabRootView.swift
//  test0
//
//  Created by Monophotic on 2023/1/6.
//

import Foundation
import SwiftUI

struct TabRootView : View {
    @State private var home = UUID()
    @State private var courses = UUID()
    @State private var tabSelection = 0
    @State private var tappedTwice = false
    
    var body: some View {
        var handler : Binding<Int> { Binding(
            get: { self.tabSelection },
            set: {
                if $0 == self.tabSelection {
                    tappedTwice.toggle()
                }
                self.tabSelection = $0
            }
        )}
        
        return TabView(selection: handler) {
            NavigationView {
                HomeView()
                    .id(home)
                    .onChange(of: tappedTwice, perform: { tappedTwice in
                        guard tappedTwice else {return}
                        home = UUID()
                        self.tappedTwice = false
                    })
            }
            .tabItem {
                Image(systemName: "square.grid.2x2.fill")
                Text("Learn Now")
            }
            .tag(1)

            NavigationView {
                CoursesView()
                    .id(courses)
                    .onChange(of: tappedTwice, perform: {
                        if $0 {
                            courses = UUID()
                            tappedTwice.toggle()
                        }
                    })
            }
            .tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Courses")
            }
            .tag(2)
        }
    }
    
    struct HomeView: View {
        var columns = [GridItem(.adaptive(minimum: 159), spacing: 16)]

        var body: some View {
            ScrollView {
                NavigationLink(destination: HoverView()) {
                    CourseCard(image: "illustration", title: "SwiftUI for iOS 14", hours: "20 sections - 3 hours", colors: [Color(#colorLiteral(red: 1, green: 0.4509803922, blue: 0.4509803922, alpha: 1)), Color(#colorLiteral(red: 0.2862745098, green: 0.1176470588, blue: 0.7215686275, alpha: 1))], logo: "swift-logo")
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct TabRootViewPreview : PreviewProvider {
    static var previews: some View {
        TabRootView()
    }
}
