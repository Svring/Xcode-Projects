//
//  TabTopView.swift
//  test0
//
//  Created by Monophotic on 2023/1/6.
//

import Foundation
import SwiftUI

struct TabTopView : View {
    @State private var tabSelection = 1
    @State private var tappedTwice: Bool = false

    var body: some View {
        var handler: Binding<Int> { Binding(
            get: { self.tabSelection },
            set: {
                if $0 == self.tabSelection {
                    // Lands here if user tapped more than once
                    tappedTwice = true
                }
                self.tabSelection = $0
            }
        )}

        return ScrollViewReader { proxy in
            TabView(selection: handler) {
                NavigationView {
                    HomeView()
                        .onChange(of: tappedTwice, perform: { tapped in
                            if tapped {
                                withAnimation {
                                    proxy.scrollTo(1)
                                }
                                tappedTwice = false
                            }
                        })
                }
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Learn Now")
                }
                .tag(1)
                NavigationView {
                    CoursesView()
                        .onChange(of: tappedTwice, perform: { tapped in
                            withAnimation {
                                proxy.scrollTo(2)
                            }
                            tappedTwice = false
                        })
                }
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Courses")
                }
                .tag(2)
            }
        }
    }
}

struct HomeView : View {
    var columns = [GridItem(.adaptive(minimum: 159), spacing: 16)]
    
    var body: some View {
        ScrollView {
            Text("Home")
                .font(.largeTitle).bold()
                .padding(.horizontal, 20)
                .padding(.top, 17)
                .id(1)

             LazyVGrid(columns: columns, spacing: 16) {
                 ForEach(0..<10) { number in
                     CourseCard(image: "illustration", title: "SwiftUI for iOS 14", hours: "20 sections - 3 hours", colors: [Color(#colorLiteral(red: 1, green: 0.4509803922, blue: 0.4509803922, alpha: 1)), Color(#colorLiteral(red: 0.2862745098, green: 0.1176470588, blue: 0.7215686275, alpha: 1))], logo: "swift-logo")
                }
             }
             .padding(20)
        }
        .navigationBarHidden(true)
    }
}

struct CoursesView : View {
    var columns = [GridItem(.adaptive(minimum: 159), spacing: 16)]

    var body: some View {
            ScrollView {
                Text("Courses")
                    .font(.largeTitle).bold()
                    .padding(.horizontal, 20)
                    .padding(.top, 17)
                    .id(2)

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<10) { number in
                        CourseCard(image: "illustration2", title: "Flutter for designers", hours: "23 sections - 4 hours", colors: [Color(#colorLiteral(red: 0.2941176471, green: 0.7450980392, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.1294117647, green: 0.4196078431, blue: 0.8549019608, alpha: 1))], logo: "flutter-logo")
                        }
                    }
                    .padding(20)
            }
            .navigationBarHidden(true)
    }
}

struct CourseCard : View {
    var image: String
    var title: String
    var hours: String
    var colors: Array<Color>
    var logo: String

    var body: some View {
        ZStack(alignment: .topTrailing) {
           VStack(spacing: 6) {
              Image(image)
                  .resizable()
                  .frame(width: 128, height: 96, alignment: .center)

               Text(title)
                   .font(.headline)
                   .bold()
                   .multilineTextAlignment(.leading)
                   .foregroundColor(.white)
                   .lineLimit(2)
                   .frame(maxWidth: .infinity, alignment: .leading)

                Text(hours)
                    .font(.footnote)
                    .foregroundColor(Color.white.opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)

            }
            .frame(maxWidth: 200)
            .padding(.horizontal, 16)
            .padding(.bottom, 0)
        }
        .frame(height: 200)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.2)]), startPoint: .center, endPoint: .bottom)
        )
        .background(
            LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
        )
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: colors[0].opacity(0.3), radius: 20, x: 0, y: 10)
        .overlay(
            Image(logo)
            .resizable()
            .frame(maxWidth: 24, maxHeight: 24, alignment: .center)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        )

    }
}

struct TabTopViewPreview : PreviewProvider {
    static var previews: some View {
        TabTopView()
    }
}
