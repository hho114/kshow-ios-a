//
//  EpisodeDetail.swift
//  KSHOW
//
//  Created by Alex Ho on 5/24/21.
//

import SwiftUI
import AVKit

struct EpisodeDetail: View {
    var episode: Episode
    var body: some View {
        
//        Text("Episode url: \(episode.videoUrl)")
        VideoPlayer(player: AVPlayer(url:  URL(string: episode.videoUrl)!)) {
//            VStack {
//                Text("KSHOW")
//                    .foregroundColor(.black)
//                    .background(Color.white.opacity(0.7))
//                Spacer()
//            }
//            .frame(width: 400, height: 300)
        }
        
    }
    
}

//struct EpisodeDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeDetail()
//    }
//}
