//
//  Card.swift
//  test0
//
//  Created by Monophotic on 2022/12/26.
//

import Foundation
import SwiftUI

struct cardView : View {
    @GestureState private var isPressed = false
     
        // For drag gesture
        @GestureState private var dragOffset = CGSize.zero
        @State private var position = CGSize.zero
     
        var body: some View {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 100))
                .opacity(isPressed ? 0.5 : 1.0)
                .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
                .animation(.easeInOut, value: isPressed)
                .foregroundColor(.green)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                    .updating($isPressed, body: { (currentState, state, transaction) in
                        state = currentState
                    })
                    .sequenced(before: DragGesture())
                    .updating($dragOffset, body: { (value, state, transaction) in
                        print(value, state, transaction)
                        switch value {
                        case .first(true):
                            print("Tapping")
                        case .second(true, let drag):
                            state = drag?.translation ?? .zero
                        default:
                            break
                        }
                    })
                    .onEnded({ (value) in
                        print(value)
                        guard case .second(true, let drag?) = value else {
                            return
                        }
     
                        self.position.height += drag.translation.height
                        self.position.width += drag.translation.width
                    })
                )
        }
}

struct cardViewPreview : PreviewProvider {
    static var previews: some View {
        cardView()
    }
}
