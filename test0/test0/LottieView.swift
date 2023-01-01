//
//  LottieView.swift
//  test0
//
//  Created by Monophotic on 2022/12/31.
//

import Foundation
import SwiftUI
import Lottie

struct LottieView : UIViewRepresentable {
    
    let name : String
    let loopMode : LottieLoopMode
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView(asset: name)
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
}

struct LottieViewPreview : PreviewProvider {
    static var previews: some View {
        LottieView(name: "Lottie Lego", loopMode: .loop)
    }
}
