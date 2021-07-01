//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Alex Ho on 5/11/21.
//

import SwiftUI
import Kingfisher


struct CategoryItem: View {

    @EnvironmentObject var modelData: ModelData
    var show: Show
    @State var isPresented = false
    var body: some View {

        VStack() {

            Button(action: {
                isPresented = true
                UIImpactFeedbackGenerator(style: .soft).impactOccurred()

            }, label: {
                VStack(alignment: .leading){
                    KFImage(URL(string: show.thumbnailImageUrl)!).renderingMode(.original).resizable().frame(width: 155, height: 155).cornerRadius(5)

                    Text(show.name)
                        .foregroundColor(.primary)
                        .font(.caption)
                }
                
            }).sheet(isPresented: $isPresented, content: {
                ShowDetailView(show: show, isPresented: $isPresented).environmentObject(modelData)
            })
            

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
