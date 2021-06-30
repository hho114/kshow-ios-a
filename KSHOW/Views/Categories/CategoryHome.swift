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
//    @State var openShow = false
//    @State show: Show
    
    var body: some View {
                
               NavigationView {
               
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

//                if (modelData.features.count > 0)
//                {
//                    ScrollView(.vertical, showsIndicators: false, content: {
//                        NavigationLink(
//                            destination:ShowDetailView(show: modelData.features[0])
//                           ){
//
//                                TopShowPreview(show: modelData.features[0])
//            //                                        .frame(width: screen.width)
////                                                    .padding(.top, -110)
////                                                    .zIndex(-1)
//
//                        }
//                    })
                    

//                }
                
                CastRow(casts: modelData.casts, title: "Casts")


               
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in

                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    

                }.listRowInsets(EdgeInsets())

            }.listStyle(InsetListStyle())
//            .navigationTitle("Featured")
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
               }
//               .fullScreenCover(isPresented: $openShow, content: {
//                ShowDetailView(show: <#T##Show#>)
//               })

            

    }

    
}



//struct CategoryHome_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryHome().environmentObject(ModelData())
//    }
//}
