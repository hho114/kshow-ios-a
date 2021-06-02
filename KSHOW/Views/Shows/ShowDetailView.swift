//
//  ShowDetailView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI
import Kingfisher
import FirebaseDatabase
import CodableFirebase

struct ShowDetailView: View {
//    var movie: Movie
    var show: Show
    let screen = UIScreen.main.bounds
    @EnvironmentObject var modelData: ModelData

    
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    @State private var showingVideoPlayer = false
//    @Binding var showDetailToShow: Show?
    
    var body: some View {
        
       
        
        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack {
//                    HStack {
//                        Spacer()
//                        Button(action: {
////                            self.movieDetailToShow = nil
//                        }, label: {
//                            Image(systemName: "xmark.circle")
//                                .font(.system(size: 28))
//                        })
//                    }
//                    .padding(.trailing, 22)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
//                            StandardHomeShow(show: show)
//                                .frame(width: screen.width / 2.5)
                            KFImage(URL(string: show.thumbnailImageUrl)!).resizable()
                                .aspectRatio(contentMode: .fit)
                            MovieSubHeadingInfoView(show: show)
                            if let text = show.description  {
                                Text(text)
                                    .bold()
                                    .font(.headline)
                            }
                            
                            PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                                print("PlayButton Tapped")
                                showingVideoPlayer = true
                            }
                            .frame(width: 120)
                            .sheet(isPresented: $showingVideoPlayer, content: {
                                VideoWebView(url: show.trailerUrl)
                            })
                            CurrentEpisodeInformationView(show: show)
                            
//                            CastInfoView(show: show)
                          
                            CastRow(casts: modelData.casts, title: "Casts")
                            
                            HStack(spacing: 30) {
                                SmallVerticalButton(isOn: true, text: "Follow", imageForSelected: "checkmark", imageForNonSelected: "plus") {
                                    //
                                }
                                SmallVerticalButton(isOn: false, text: "Rate", imageForSelected: "hand.thumbsup.fill", imageForNonSelected: "hand.thumbsup") {
                                    //
                                }
                                SmallVerticalButton(isOn: true, text: "Share", imageForSelected: "square.and.arrow.up", imageForNonSelected: "square.and.arrow.up") {
                                    //
                                }
                                
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                            CustomTabSwitcher(tabs: [.episodes, .trailer], show: show, showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                        }
                        .padding(.horizontal, 10)
                    }
//                    Spacer()
                }
//                .foregroundColor(.white)
            }
            if showSeasonPicker {
                Group {
                    Color.black.opacity(0.90)
                    VStack(spacing: 30) {
                        Spacer()
                        ForEach(0..<(show.numberOfSeasonDisplay )) { season in
                            Button(action: {
                                self.selectedSeason = season + 1
                                self.showSeasonPicker = false
                            }, label: {
                                Text("Season \(season + 1)")
                                    .font(selectedSeason == season + 1 ? .title : .title2)
                                    .bold()
//                                    .foregroundColor(selectedSeason == season + 1 ? .white : .secondary)
                                
                            })
                            
                        }
                        Spacer()
                        
                        Button(action: {
                            self.showSeasonPicker = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 40))
                                .scaleEffect(x: 1.1)
//                                .foregroundColor(.white)
                        })
                        .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
    
//    func fetchEpisodeList(){
//           
//           Database.database().reference().child("shows").child(show.id).observe(.value) { snapshot in
//            
//            modelData.episodes = []
//               for child in snapshot.children.allObjects as! [DataSnapshot] {
//               do {
//                   let model = try FirebaseDecoder().decode(Episode.self, from: child.value as Any)
//                   print(model)
//                    modelData.episodes.append(model)
//                   UserDefaults.standard.set(false, forKey: "load")
//                   NotificationCenter.default.post(name: NSNotification.Name("load"), object: nil)
//               } catch let error {
//                   print(error)
//               }
//                   
//                   
//             }
//               
//           }
//       }
    
}

//struct ShowDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailsView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
//    }
//}

struct MovieSubHeadingInfoView: View {
    var show: Show
    var body: some View {
        HStack(spacing: 20) {
//            Image(systemName: "hand.thumbsup.fill")
//                .foregroundColor(.white)
            Text(show.name)
            RatingView(rating: "\(show.rating)")
            Text("\(show.numberOfSeasonDisplay)")
            HDView()
        }
//        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    var body: some View {
        ZStack {
//            Rectangle()
////                .background(Color.gray)
//                .frame(width: 55, height: 20)
            
            Text(rating)
//                .foregroundColor(.black)
                .font(.system(size: 14))
                .bold()
        }
    }
}

struct HDView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 40, height: 20)
            
            Text("HD")
//                .foregroundColor(.white)
                .font(.system(size: 14))
                .bold()
        }
    }
}

//struct CastInfoView: View {
////    var movie: Movie
//    var show: Show
//    var body: some View {
////        VStack(spacing: 3) {
////            HStack {
////                Text("Cast:  ")
////
////            }
//////            HStack {
//////                Text("Creators: \(show.creators)")
//////                Spacer()
//////            }
//////            CastRow()
////        }
////        .font(.callout)
////        .foregroundColor(.gray)
////        .padding(.vertical, 10)
//       
//    }
//}

struct CurrentEpisodeInformationView: View {
//    var movie: Movie
    var show: Show
    var body: some View {
        Group {
            HStack {
                Text(show.currentEpisode)
                    .bold()
                Spacer()
            }
            .padding(.vertical, 4)
            
            HStack {
                Text(show.currentEpisode)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}
