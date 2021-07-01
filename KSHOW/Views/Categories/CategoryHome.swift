//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Alex Ho on 5/11/21.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    let screen = UIScreen.main.bounds

    
    var body: some View {
                
               
            List {
                HStack{
                    Spacer()
                    Image("kshow_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .cornerRadius(8.0)
                    Spacer()
                }
                if !modelData.features.isEmpty
                {


                        PageView(pages: modelData.features.map {

                            FeatureCard(show: $0)

                        }
                        )
                        .aspectRatio(3 / 2, contentMode: .fit)
                        .listRowInsets(EdgeInsets())
                }


                
                CastRow(casts: modelData.casts, title: "Casts")


               
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in

                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    

                }.listRowInsets(EdgeInsets())

            }.listStyle(InsetListStyle())

            .navigationBarTitle("")
            .navigationBarHidden(true)


            

    }

    
}



//struct CategoryHome_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryHome().environmentObject(ModelData())
//    }
//}
