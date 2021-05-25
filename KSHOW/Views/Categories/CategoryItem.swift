//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Alex Ho on 5/11/21.
//

import SwiftUI
import Kingfisher


struct CategoryItem: View {

//    var landmark: Landmark
    var show: Show

    var body: some View {

        VStack(alignment: .leading) {

//            landmark.image
//                .renderingMode(.original)
//                .resizable()
//
//                .frame(width: 155, height: 155)
//
//                .cornerRadius(5)
            KFImage(URL(string: show.thumbnailImageUrl)!).renderingMode(.original).resizable().frame(width: 155, height: 155).cornerRadius(5)

            Text(show.name)
                .foregroundColor(.primary)
                .font(.caption)
//            ShowList()
            

        }

        .padding(.leading, 15)

    }

}


//struct CategoryItem_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        CategoryItem(landmark: ModelData().landmarks[0])
//
//    }
//
//}
