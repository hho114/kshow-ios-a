//
//  HistoryEpisodeRow.swift
//  KSHOW
//
//  Created by Alex Ho on 6/18/21.
//


import SwiftUI

struct HistoryEpisodeRow: View {
    var categoryName: String
    var items: [HistoryEpisode]
    
    var body: some View {
        VStack(alignment: .leading) {

                    Text(categoryName)

                        .font(.headline)
                        .padding(.leading, 15)

                                        .padding(.top, 5)


            ScrollView(.horizontal, showsIndicators: false) {

                HStack(alignment: .top, spacing: 0) {

                    ForEach(items) { ep in

                        HistoryEpisodeItem(historyEpisode: ep)
                        

                    }
                    
                }

            }.frame(height: 185)
        }
        
    }
}

//struct CategoryRow_Previews: PreviewProvider {
//    static var landmarks = ModelData().landmarks
//
//    static var previews: some View {
//        CategoryRow(
//
//                   categoryName: landmarks[0].category.rawValue,
//
//                items: Array(landmarks.prefix(4))
//
//               )
//    }
//}
