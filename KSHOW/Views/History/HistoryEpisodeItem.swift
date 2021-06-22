//
//  HistoryEpisodeItem.swift
//  KSHOW
//
//  Created by Alex Ho on 6/18/21.
//

import SwiftUI
import Kingfisher


struct HistoryEpisodeItem: View {

//    var landmark: Landmark
    var historyEpisode: HistoryEpisode

    var body: some View {

        VStack(alignment: .leading) {

//            landmark.image
//                .renderingMode(.original)
//                .resizable()
//
//                .frame(width: 155, height: 155)
//
//                .cornerRadius(5)
            KFImage(URL(string: historyEpisode.imageUrl)!).renderingMode(.original).resizable().frame(width: 155, height: 155).cornerRadius(5)

            HStack{Text(historyEpisode.episodeName)
                .foregroundColor(.primary)
                .font(.caption)
                Text(historyEpisode.episodeNumber)
                    .foregroundColor(.primary)
                    .font(.caption)
            }
//            ShowList()
            

        }

        .padding(.leading, 15)

    }

}
