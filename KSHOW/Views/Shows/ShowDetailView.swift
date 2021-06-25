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
    
    @Binding var isPresented: Bool
    @EnvironmentObject var modelData: ModelData
    @State private var currentCasts: [Cast]=[]
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    @State private var showingVideoPlayer = false
    @State private var loading = false
//    @Binding var showDetailToShow: Show?
    
    func getCasts(){
        loading = true
//        var newListCasts : [Cast] = []
        for cast in modelData.casts {
//            var tempCast = cast
            if show.casts.contains(cast.id) {
                currentCasts.append(cast)
            }
            
        }
            
        loading = false
    }
    
    var body: some View {
        
        LoadingView(isShowing: $loading, content: {
            ZStack {
    //            Color.black
    //                .edgesIgnoringSafeArea(.all)
                
    //            ZStack {
                    VStack {
                        if isPresented {
                            Button(action: {
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                isPresented = false
                            }, label: {
                                HStack{
                                    Image(systemName: "chevron.compact.down").padding(.vertical, 4).frame(maxWidth: .infinity)

                                }
                            })
                            

                            
                        }
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
                                if let text = show.currentEpisode["ep"]  {
                                    Text("Lastest Episode: \(text)")
                                        .bold()
                                        .font(.headline)
                                }
                                
                                PlayButton(text: "Play", imageName: "play.fill") {
                                    print("PlayButton Tapped")
                                    showingVideoPlayer = true
                                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                                   
                                    if let ep = show.currentEpisode["ep"], let url = show.currentEpisode["url"]     {
                                        if let row = modelData.historyEpisodes.firstIndex(where: {$0.episodeName == show.name && $0.episodeNumber == ep}) {
                                            print("update history")
                                                modelData.historyEpisodes[row].timestamp = Date().timeIntervalSince1970
                                                modelData.historyEpisodes[row].id = "\(Date().timeIntervalSince1970)"
                                            
                                        }
                                        else{
                                            print("add to history")
                                            modelData.historyEpisodes.append(HistoryEpisode(id: "\(Date().timeIntervalSince1970)", episodeName: show.name ,episodeNumber:  show.currentEpisode["ep"] ?? "", imageUrl: show.thumbnailImageUrl, timestamp: Date().timeIntervalSince1970, videoUrl: url))
                                            
                                        }
                                    }
                                    
                                    
                                }
                                .frame(width: 120)
                                .sheet(isPresented: $showingVideoPlayer, content: {
                                    if let sUrl = show.currentEpisode["url"]{
                                        OpenWebView(url: sUrl, isPresented: $showingVideoPlayer)
                                    }
                                    
                                })
                                CurrentEpisodeInformationView(show: show)
                                
    //                            CastInfoView(show: show)
    //                            if !getCasts().isEmpty{
                                
                                    CastRow(casts: currentCasts, title: "Casts")

    //                            }
                                
    //                            HStack(spacing: 30) {
    //                                SmallVerticalButton(isOn: true, text: "Follow", imageForSelected: "checkmark", imageForNonSelected: "plus") {
    //                                    //
    //                                }
    //                                SmallVerticalButton(isOn: false, text: "Like", imageForSelected: "hand.thumbsup.fill", imageForNonSelected: "hand.thumbsup") {
    //                                    //
    //                                }
    //                                SmallVerticalButton(isOn: true, text: "Share", imageForSelected: "square.and.arrow.up", imageForNonSelected: "square.and.arrow.up") {
    //                                    //
    //                                }
    //
    //                                Spacer()
    //                            }
    //                            .padding(.leading, 20)
    //                            CustomTabSwitcher(tabs: [.episodes,.more,.trailer], show: show, showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                                CustomTabSwitcher(tabs: [.episodes], show: show, showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason).environmentObject(modelData)
                            }
                            .padding(.horizontal, 10)
                        }
    //                    Spacer()
                    }
    //                .foregroundColor(.white)
    //            }
                if showSeasonPicker {
                    Group {
                        Color.black.opacity(0.90)
                        VStack(spacing: 30) {
                            Spacer()
                            ForEach(0..<(Int(show.numberOfSeasonDisplay) ?? 1 )) { season in
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
            .onAppear(perform: {
    //            if !isPresented
    //            {
    //                modelData.currentSelectedShow = show
    //            }
                getCasts()
               
                
            })
        })
        
       
    }
    
    
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
            Text(show.name).font(.system(size: 18, weight: .black, design: .rounded))
            RatingView(rating: "\(show.rating)")
//            Text("\(show.numberOfSeasonDisplay)")
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
            
            Text("Rating: \(rating)")
//                .foregroundColor(.black)
//                .foregroundColor(Color(UIColor.label))
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
                Text(show.description)
                    .bold()
                Spacer()
            }
            .padding(.vertical, 4)
            
//            HStack {
//                Text(show.currentEpisode)
//                    .font(.subheadline)
//                Spacer()
//            }
        }
    }
}
