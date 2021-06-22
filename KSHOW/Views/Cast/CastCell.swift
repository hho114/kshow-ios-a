//
//  CastCell.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI
import Kingfisher

struct CastCell: View {
    
    var cast : Cast
    let colors: [Color] = [.yellow, .red, .gray, .green, .pink, .blue, .orange]
    @State var isPresented: Bool = false
    var body: some View {
//        ZStack(alignment: .bottom) {
        
        Button(action: {
            isPresented = true
        }, label: {
            KFImage(URL(string:cast.imageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(colors.randomElement())
            )
        }).sheet(isPresented: $isPresented, content: {
            CastProfile(cast: cast, isPresented: $isPresented)
        })
            
            
//            Image(movie.previewImageName)
//                .resizable()
//                .scaledToFit()
//                .offset(y: -20)
//                .frame(height: 65)
//            Text(cast.name).bold()
//        }
        
    }
}

//struct MoviePreviewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//            MoviePreviewCell(movie: exampleMovie1)
//                .frame(width: 200, height: 50)
//        }
//    }
//}
