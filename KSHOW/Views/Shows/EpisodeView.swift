//
//  EpisodeView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI

struct EpisodeView: View {
    var episodes: [Episode] = []
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    var show: Show
    
    
    func getEpisodes(forSeason season: String) -> [Episode] {
        episodes.filter({ $0.season == season }).sorted(by: {$0.episodeNumber > $1.episodeNumber})
    }
    
    var body: some View {
        VStack(spacing: 14) {
            // season picker
            HStack {
                Button(action: {
                    showSeasonPicker = true
                }, label: {
                    Group {
                        Text("Season \(selectedSeason)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                })
                
                Spacer()
            }
            
            // episode list
            ForEach(getEpisodes(forSeason: String(selectedSeason))) { episode in
                VStack(alignment: .leading) {
                    HStack {
                        VideoPreviewImage(episode: episode,show: show)
                            .frame(width: 120, height: 70)
                            .clipped()
                        
                        VStack(alignment: .leading) {
                            Text("\(episode.episodeNumber)")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                            
                            Text("\(episode.length)")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()

                    }
                    

                }
                .padding(.bottom, 20)
                
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

//struct EpisodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//            EpisodeView(episodes: [episode1, episode2, episode3], showSeasonPicker: .constant(false), selectedSeason: .constant(1))
//        }
//    }
//}
