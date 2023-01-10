//
//  StackView.swift
//  test0
//
//  Created by Monophotic on 2023/1/10.
//

import Foundation
import SwiftUI

struct StackView : View {
    var navigationItems = [
        NavigationItem(title: "Compass App", icon: "safari", menu: .compass),
        NavigationItem(title: "3D Card", icon: "lanyardcard", menu: .card),
        NavigationItem(title: "Radial Layout", icon: "clock", menu: .radial),
        NavigationItem(title: "Gooey Action Button", icon: "plus.circle", menu: .actionbutton),
        NavigationItem(title: "Gooey Menu", icon: "drop", menu: .gooey),
        NavigationItem(title: "Charts", icon: "chart.xyaxis.line", menu: .charts),
        NavigationItem(title: "Half Sheet", icon: "rectangle.portrait.bottomhalf.filled", menu: .halfsheet),
    ]

    var body: some View {
        NavigationStack {
            List(navigationItems, rowContent: { item in
                NavigationLink(value: item, label: {
                    Label(item.title, systemImage: item.icon)
                })
            })
            //.listStyle(.plain)
            .navigationTitle("SwiftUI apps")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: NavigationItem.self, destination: {
                switch $0.menu {
                    case .compass:
                        ColorView()
                    case .card:
                        CardView()
                    case .charts:
                        TabTopView()
                    case .radial:
                        PickerView()
                    case .halfsheet:
                        CanvasView()
                    case .gooey:
                        ListSeparatorView()
                    case .actionbutton:
                        RedactView()
                }
            })
        }
    }
}

struct NavigationItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
    var menu: Menu
}

enum Menu: String {
    case compass
    case card
    case charts
    case radial
    case halfsheet
    case gooey
    case actionbutton
}

struct StackViewPreview : PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
