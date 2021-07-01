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
    @State var present: Bool = false
    var body: some View {
        NavigationView{
            VStack {

                Button(action: {
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    isPresented = false
                }, label: {
                    HStack{
                        Image(systemName: "chevron.compact.down").padding(.vertical, 4).frame(maxWidth: .infinity).foregroundColor(Color.white)

                    }
                })
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
                        
                    }
                    Spacer()
                }
                HStack{
                    Label(
                        title: { Text("Show") },
                        icon: { Image(systemName: "play.tv") }).padding(.leading,10)
                    Spacer()
                    
                }
                Divider()
                
                ForEach(modelData.shows.filter({ $0.casts.contains(cast.id) }))
                {item in
                    RowItemShow(show: item)
                }
                Spacer()
            }
            .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
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
