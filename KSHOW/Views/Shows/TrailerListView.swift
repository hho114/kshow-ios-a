//
//  TrailerListView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI

struct TrailerListView: View {
//    var trailers: [Trailer]
    var showName: String
    var thumbnailImageURL: String
    var videoURL: String
    let screen = UIScreen.main.bounds
    var body: some View {
        VStack {
//            ForEach(trailers) { trailer in
                VStack(alignment: .leading) {
                    VideoPreviewImage(imageURL: URL(string: thumbnailImageURL)!, videoURL: videoURL)
                        .frame(maxWidth: screen.width)
                    Text(showName)
                        .font(.headline)
                }
                .foregroundColor(.white)
                .padding(.bottom, 10)
//            }
        }
    }
}

//struct TrailerListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//            TrailerListView(trailers: exampleTrailers)
//        }
//    }
//}

