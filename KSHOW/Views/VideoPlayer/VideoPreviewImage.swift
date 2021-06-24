//
//  VideoPreviewImage.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI
import Kingfisher

struct VideoPreviewImage: View {
//    var imageURL: String
//    var videoURL: String
    var episode: Episode
    var show: Show
    @EnvironmentObject var modelData: ModelData
    @State private var showingVideoPlayer = false
    
    var body: some View {
        
        ZStack {
            KFImage(URL(string: show.thumbnailImageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Button(action: {
                showingVideoPlayer = true
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                
                if let row = modelData.historyEpisodes.firstIndex(where: {$0.episodeName == show.name && $0.episodeNumber == episode.episodeNumber}) {
                    print("update history")
                        modelData.historyEpisodes[row].timestamp = Date().timeIntervalSince1970
                        modelData.historyEpisodes[row].id = "\(Date().timeIntervalSince1970)"
                    
                }
                else{
                    print("add to history")
                    modelData.historyEpisodes.append(HistoryEpisode(id: "\(Date().timeIntervalSince1970)", episodeName: show.name ,episodeNumber: episode.episodeNumber, imageUrl: show.thumbnailImageUrl, timestamp: Date().timeIntervalSince1970, videoUrl: episode.videoUrl))
                    
                }
                
            }, label: {
                Image(systemName: "play.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
            })
            .sheet(isPresented: $showingVideoPlayer, content: {
//                SwiftUIVideoView(url: videoURL)
//                VideoCard(videoURL: videoURL, showPlayIcon: false, previewLength: 10)
                VideoWebView(url: episode.videoUrl, isPresented: $showingVideoPlayer)
            })
        }
//        .fullScreenCover(isPresented: $showingVideoPlayer, content: {
//            //                SwiftUIVideoView(url: videoURL)
//            //                VideoCard(videoURL: videoURL, showPlayIcon: false, previewLength: 10)
//                            VideoWebView(url: episode.videoUrl, isPresented: $showingVideoPlayer)
//                        })
        
        
    }
}

//struct VideoPreviewImage_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoPreviewImage(imageURL: exampleImageURL, videoURL: exampleVideoURL)
//    }
//}
