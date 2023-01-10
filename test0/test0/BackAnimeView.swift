//
//  BackAnimeView.swift
//  test0
//
//  Created by Monophotic on 2023/1/8.
//

import Foundation
import SwiftUI

struct BackAnimeView : View {
    @State var start = UnitPoint(x: 0, y: 0)
    @State var end = UnitPoint(x: 1, y: 1)
    
    @State var startAngle = 0
    @State var endAngle = 360
    
    let colors = [Color.purple, Color.pink, Color.cyan, Color.mint]
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    var body: some View {
        VStack {
            linearBackground
                .blur(radius: 10)
                .mask(Circle())
                .frame(width: 200, height: 200, alignment: .center)
            
            angularBackground
                .blur(radius: 1)
                .mask(Rectangle())
                .frame(width: 200, height: 200, alignment: .center)
        }
        .ignoresSafeArea()
    }

    var angularBackground: some View {
        AngularGradient(gradient: Gradient(colors: colors), center: .center, startAngle: .degrees(Double(startAngle)), endAngle: .degrees(Double(endAngle)) )
            .onReceive(timer, perform: { _ in
                self.startAngle += 10
                self.endAngle += 5
            })
            .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: startAngle)
            
    }
    
    var linearBackground: some View {
        LinearGradient(colors: colors, startPoint: start, endPoint: end)
            .onReceive(timer, perform: { _ in
                self.start = UnitPoint(x: 2, y: 0)
                self.end = UnitPoint(x: 0, y: 2)
                self.start = UnitPoint(x: -3, y: 10)
                self.start = UnitPoint(x: 4, y: 0)
            })
            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true).speed(0.5), value: start)
    }
}

struct BackAnimeViewPreview : PreviewProvider {
    static var previews: some View {
        BackAnimeView()
    }
}
