//
//  HistoryVideoPreview.swift
//  KSHOW
//
//  Created by Alex Ho on 6/18/21.
//

import SwiftUI
import Kingfisher

struct HistoryVideoPreview: View {
//    var imageURL: String
//    var videoURL: String
    var historyEpisode: HistoryEpisode
    @EnvironmentObject var modelData: ModelData
    @State private var showingVideoPlayer = false
    
    var body: some View {
        
        ZStack {
            KFImage(URL(string: historyEpisode.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button(action: {
                showingVideoPlayer = true
                print("update history")
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                if let row = modelData.historyEpisodes.firstIndex(where: {$0.id == historyEpisode.id}) {
                    
                    modelData.historyEpisodes[row].timestamp = Date().timeIntervalSince1970
                    modelData.historyEpisodes[row].id = "\(Date().timeIntervalSince1970)"
                    print("update \( modelData.historyEpisodes[row].timestamp) \( modelData.historyEpisodes[row].episodeName) \( modelData.historyEpisodes[row].episodeNumber)")
                }
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            })
            .sheet(isPresented: $showingVideoPlayer, content: {
//                SwiftUIVideoView(url: videoURL)
//                VideoCard(videoURL: videoURL, showPlayIcon: false, previewLength: 10)
                OpenWebView(url: historyEpisode.videoUrl, isPresented: $showingVideoPlayer)
            })
        }
        
        
    }
}
