//
//  VideoCard.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI

struct VideoCard: View {
    
    var videoURL:URL
    @State var showPlayIcon:Bool
    var previewLength:Double
    
    var body: some View {
        ZStack {
            VideoView(videoURL: videoURL, previewLength: previewLength)
            if showPlayIcon {
                Image(systemName: "play.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 20, idealWidth: 40, maxWidth: 40, minHeight: 20, idealHeight: 40, maxHeight: 40, alignment: .center)
                .foregroundColor(Color.white)
            }
            
        }.onTapGesture {
            // You Tapped the Video Card!
            showPlayIcon = !showPlayIcon
        }

    }
}

