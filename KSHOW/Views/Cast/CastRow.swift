//
//  CastRow.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI

struct CastRow: View {
    
    var  casts: [Cast]
    var title: String

    
    var body: some View {
        
            VStack(alignment: .leading) {
                Text("\(title)")
                    .font(.title3)
                    .bold()
                    .padding(.leading, 6)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(casts) { cast in
                           
                            VStack
                            {
                                CastCell(cast: cast)
                                    .frame(width: 100, height: 100)
                                    .padding(.trailing, 8)
                                    .padding(.leading, 6)
                                    .onTapGesture(perform: {
        
                                    })
                                Text(cast.name).bold()
                            }
                            
                        }
                    }
                }
            }
            .frame(height: 185)

        
    }
}

//struct CastRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            MoviePreviewRow(movies: exampleMovies, showPreviewFullscreen: .constant(false), previewStartingIndex: .constant(0))
//
//        }
//    }
//}
