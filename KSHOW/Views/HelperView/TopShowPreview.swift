//
//  TopShowPreview.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI
import Kingfisher

struct TopShowPreview: View {
    let show: Show
    @State private var showingVideoPlayer = false
    func shouldShowCircleAfterCategory(_ cat: String) -> Bool {
        guard let index = show.category.firstIndex(of: cat) else {
            return false
        }
        return index + 1 != show.category.count
    }
    var body: some View {
        ZStack {
            KFImage(URL(string:show.thumbnailImageUrl))
                .resizable()
                .scaledToFit()
            
            VStack {
                Spacer()
                HStack {
                    ForEach(show.category, id: \.self) { category in
                        Text(category)
                            .font(.footnote)
                        if shouldShowCircleAfterCategory(category) {
                            Image(systemName: "circle.fill")
//                                .foregroundColor(.blue)
                                .font(.system(size: 4))
                        }
                    }
                }
                HStack {
                    Spacer()
                    SmallVerticalButton(isOn: true, text: "My List", imageForSelected: "checkmark", imageForNonSelected: "plus") {
                        //
                    }
                    Spacer()
//                    PlayButton(text: "Play", imageName: "play.fill") {
//                        //
//                        showingVideoPlayer = true
//                    }
//                    .frame(width: 120)
//                    .sheet(isPresented: $showingVideoPlayer, content: {
//                        VideoWebView(url: show.trailerUrl)
//                    })
                    
                    Spacer()
                    SmallVerticalButton(isOn: true, text: "Info", imageForSelected: "info.circle", imageForNonSelected: "info.circle") {
                        //
                    }
                    Spacer()
                }
                .padding(.vertical, 14)
            }
//            .background(LinearGradient.blackTopToBottom)
            .padding(.top, 300)
        }
//        .foregroundColor(.white)
    }
}

//struct TopMoviePreview_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoviePreview(movie: exampleMovie1)
//    }
//}
