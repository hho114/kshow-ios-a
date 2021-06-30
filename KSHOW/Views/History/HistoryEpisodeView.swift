//
//  HistoryEpisodeView.swift
//  KSHOW
//
//  Created by Alex Ho on 6/18/21.
//

import SwiftUI


struct HistoryEpisodeView: View {
    var historyEpisodes: [HistoryEpisode] = []
   
//    var imageUrl: String = ""
    
    func getEpisodes() -> [HistoryEpisode] {
        historyEpisodes.sorted(by: {$0.timestamp > $1.timestamp})
    }
    var body: some View {
//        NavigationView{
            VStack {
                
                Label("History", systemImage: "clock.fill").padding()
                // episode list
                List{
                    ForEach(getEpisodes()) { episode in
                       
                            HStack {
                                HistoryVideoPreview(historyEpisode: episode)
                                    
                                    .frame(width: 120, height: 70)
                                    .clipped()
                                
                                VStack(alignment: .leading) {
                                    Text("\(episode.episodeName)")
        //                                .font(.system(size: 16))
                                        .foregroundColor(.gray)
                                    
                                    Text("\(episode.episodeNumber)")
        //                                .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
        //                        Image(systemName: "arrow.down.to.line.alt")
        //                            .font(.system(size: 20))
                            }
                            
                        
                        
                    }.listRowInsets(EdgeInsets())
                }
                

            }
//            .navigationTitle("History")
//        }
        

    }
}
