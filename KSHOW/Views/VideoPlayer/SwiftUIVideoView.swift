//
//  SwiftUIVideoView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI
import AVKit


struct SwiftUIVideoView: View {
    var url: URL
    @State var pause = false
    private var player: AVPlayer {
        return AVPlayer(url: url)
    }
    var body: some View {
        ZStack{
            
            VideoPlayer(player: player).onAppear() {
                // Start the player going, otherwise controls don't appear
                player.play()
                
            }
            .onDisappear() {
                // Stop the player when the view disappears
                player.pause()
            }
        }
        
    }
}

//struct SwiftUIVideoView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIVideoView(url: exampleVideoURL)
//    }
//}
