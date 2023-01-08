//
//  AVplayer.swift
//  test0
//
//  Created by Monophotic on 2023/1/4.
//

import Foundation
import AVKit
import SwiftUI

struct AVplayerView : View {
    @State var player = AVPlayer()
    var videoUrl: String = "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4"
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .onAppear {
                    player = AVPlayer(url: URL(string: videoUrl)!)
                    player.play()
                }
        }
    }
}

struct AVplayerViewPreview : PreviewProvider {
    static var previews: some View {
        AVplayerView()
    }
}
