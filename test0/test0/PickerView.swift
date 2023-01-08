//
//  PickerView.swift
//  test0
//
//  Created by Monophotic on 2023/1/7.
//

import Foundation
import SwiftUI

struct PickerView : View {
    @State private var number : Int = 0
    @State private var language : Languages = Languages.swift
    @State private var safari = false

    var body: some View {
        VStack(spacing: 32) {
            Picker("Your Age", selection: $number) {
                ForEach(0...3, id: \.self) {
                    Text("\($0)")
                }
            }
            .background(Color.cyan)

            Picker("Best language", selection: $language) {
                ForEach(Languages.allCases) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }
            .pickerStyle(.segmented)
            
            Button(action: { safari.toggle() }, label: Label("Show Safari", systemImage: "safari"))
                .fullScreenCover(isPresented: $safari) {
                    SFSafariViewWrapper(url: URL(string: "https://www.designcode.io")!)
                }
        }
    }
}

enum Languages : String, CaseIterable, Identifiable {
    case python, javascript, swift
    
    var id: String {
        self.rawValue
    }
}

struct PickerViewPreview : PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
