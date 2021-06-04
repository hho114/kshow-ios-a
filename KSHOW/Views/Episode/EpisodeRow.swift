//
//  EpisodeRow.swift
//  KSHOW
//
//  Created by Alex Ho on 5/24/21.
//

import SwiftUI
import Kingfisher

struct EpisodeRow: View {
    var episode: Episode
    var imageUrl: String
    var body: some View {
        HStack {
//            landmark.image.resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            KFImage(URL(string: imageUrl)!).resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(episode.episodeNumber)")
            Spacer()
//            if landmark.isFavorite
//            {
//                Image(systemName: "star.fill").foregroundColor(.yellow)
//            }
        }
    }
}

//struct EpisodeRow_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeRow()
//    }
//}
