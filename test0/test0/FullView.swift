//
//  FullView.swift
//  test0
//
//  Created by Monophotic on 2023/1/3.
//

import Foundation
import SwiftUI

struct FullView : View {
    @State var showModal = false

    var body: some View {
        Button(action: { showModal = true }) {
            Text("My Button")
        }
        .fullScreenCover(isPresented: $showModal) {
            ModalView()
        }
    }
}

struct ModalView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Text("Close Modal")
            .statusBarHidden(true)
            .onTapGesture {
                dismiss()
            }
    }
}

struct FullViewPreview : PreviewProvider {
    static var previews: some View {
        FullView()
    }
}
