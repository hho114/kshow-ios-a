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
    
    var body: some View {
                
               NavigationView {
               
            List {
//                HStack{
//                    Image("kshow_logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50)
//                }

//                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
//
//                                    .aspectRatio(3 / 2, contentMode: .fit)
//
//                                    .listRowInsets(EdgeInsets())

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in

                    CategoryRow(categoryName: key, items: modelData.categories[key]!)

                }.listRowInsets(EdgeInsets())

            }
            .listStyle(InsetListStyle())
            .navigationTitle("KSHOW")
//            .navigationTitle(modelData.user.username)
//            .toolbar {
//
//                Button(action: { self.showingProfile.toggle() }) {
//
//                                Image(systemName: "person.crop.circle")
//
//                                    .accessibilityLabel("User Profile")
//
//                            }
//
//                        }
//
//                        .sheet(isPresented: $showingProfile) {
//
//                            ProfileHost()
//
//                                .environmentObject(modelData)
//
//                        }
        }

            

    }

    
}





struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
