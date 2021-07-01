//
//  SearchResultsGrid.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI

struct SearchResultsGrid: View {
    var shows: [Show]
    
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(shows, id: \.id) { show in
                StandardHomeShow(show: show)
                    .frame(height: 160)
                    .onTapGesture(perform: {
                    })
            }
        }
    }
}

//struct SearchResultsGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultsGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
//    }
//}
