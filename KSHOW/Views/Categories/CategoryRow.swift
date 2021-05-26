//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Alex Ho on 5/11/21.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Show]
    
    var body: some View {
        VStack(alignment: .leading) {

                    Text(categoryName)

                        .font(.headline)
                        .padding(.leading, 15)

                                        .padding(.top, 5)


            ScrollView(.horizontal, showsIndicators: false) {

                HStack(alignment: .top, spacing: 0) {

                    ForEach(items) { show in

                        NavigationLink(destination: ShowDetailView(show: show)) {

                                                    CategoryItem(show: show)


                                                }
                        

                    }
                    
                }

            }.frame(height: 185)
        }
        
    }
}

//struct CategoryRow_Previews: PreviewProvider {
//    static var landmarks = ModelData().landmarks
//
//    static var previews: some View {
//        CategoryRow(
//
//                   categoryName: landmarks[0].category.rawValue,
//
//                items: Array(landmarks.prefix(4))
//
//               )
//    }
//}
