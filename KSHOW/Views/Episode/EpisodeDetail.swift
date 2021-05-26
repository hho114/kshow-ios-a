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
        
        VideoPlayer(player: AVPlayer(url:  URL(string: episode.videoUrl)!)) {
            VStack {
                Image("kshow_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
         
        
    }
    
}

//struct EpisodeDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeDetail()
//    }
//}
