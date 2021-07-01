//
//  PopularShowsView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI
import Kingfisher

struct PopularMovieView: View {
    var show: Show
    
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(URL(string:show.thumbnailImageUrl))
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 3)
                
                Text(show.name)
                
                Spacer()
                
                Button(action: {
                    // play movie
                }, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                .padding(.trailing, 20)
            }
//            .foregroundColor(.white)
            .onTapGesture(perform: {
//                self.movieDetailToShow = movie
            })
        }
    }
}

//struct PopularMovieView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//            
//            PopularMovieView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
//                .frame(height: 75)
//        }
//    }
//}
