//
//  CastProfile.swift
//  KSHOW
//
//  Created by Alex Ho on 6/22/21.
//

import SwiftUI
import Kingfisher
struct CastProfile: View {
    var cast: Cast
    @EnvironmentObject var modelData: ModelData
    let gradient = Gradient(colors: [.blue, .purple])
    @Binding var isPresented: Bool
    var body: some View {
//        NavigationView{
            VStack {
                HStack{
                    Image(systemName: "chevron.compact.down").padding(.vertical, 6).frame(maxWidth: .infinity)

                }
                .background(Color.black.opacity(0.5))
                .onTapGesture {
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    isPresented = false
                    print("tap close modal")
                }
//                Spacer()
                HStack {
                    Spacer()
                    
                    VStack {
                        KFImage(URL(string:cast.imageUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .clipped()
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .padding(.top, 40)
                        
                        Text(cast.name).font(.system(size: 20)).bold().foregroundColor(.white)
                            .padding(.top, 12)
                        
                        Text("@venom").font(.system(size: 18)).foregroundColor(.white)
                        .padding(.top, 4)
                    }
                    Spacer()
                }

                ForEach(modelData.shows.filter({ $0.casts.contains(cast.id) }))
                {item in
                NavigationLink(destination: ShowDetailView(show: item, isPresented: $isPresented)){
                    
                        RowItem(imageUrl: item.thumbnailImageUrl, name: item.name)
                    }
                }
                Spacer()
            }
            .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
//        }
    }
}

//struct ProfileHeader: View {
//
//    let gradient = Gradient(colors: [.blue, .purple])
//
//    var body: some View {
//        VStack {
//            HStack {
//                Spacer()
//
//                VStack {
//                    Image(systemName: "flame")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 200, height: 200)
//                        .clipShape(Circle())
//                        .clipped()
//                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                        .padding(.top, 44)
//
//                    Text("Eddie Brock").font(.system(size: 20)).bold().foregroundColor(.white)
//                        .padding(.top, 12)
//
//                    Text("@venom").font(.system(size: 18)).foregroundColor(.white)
//                    .padding(.top, 4)
//                }
//                Spacer()
//            }
//            Spacer()
//        }
//        .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
//        .edgesIgnoringSafeArea(.all)
//    }
//}
