//
//  CustomTabSwitcher.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI
import FirebaseDatabase
import CodableFirebase

struct CustomTabSwitcher: View {
    @State private var currentTab: CustomTab = .episodes
    @EnvironmentObject var modelData: ModelData

    var tabs: [CustomTab]
    var show: Show
    @State var load = true
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        return tab.rawValue.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                            
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? .primary : .secondary)
                            })
                            .frame(width: widthForTab(tab), height: 30)
                            .buttonStyle(PlainButtonStyle())
                        }
                        .animation(.easeInOut(duration: 0.3))
                    }
                }
            }
            
            //Selected view
            switch currentTab {
            
            case .episodes:
                
                if !self.load {
                    EpisodeView(episodes: modelData.episodes , showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason, imageUrl: show.thumbnailImageUrl)
                }
                else
                {
                    ProgressView().onAppear{
                        fetchEpisodeList()
                        NotificationCenter.default.addObserver(forName: NSNotification.Name("load"), object: nil, queue: .main) { (_) in
                            
                            self.load = UserDefaults.standard.value(forKey: "load") as? Bool ?? true

                        }
                    }
                    
                }
            case .trailer:
                TrailerListView(showName: show.name, thumbnailImageURL: show.thumbnailImageUrl, videoURL: show.trailerUrl)
//            case .more:
//                MoreLikeThisView(movies: movie.moreLikeThisMovies)
            case .more:
                TrailerListView(showName: show.name, thumbnailImageURL: show.thumbnailImageUrl, videoURL: show.trailerUrl)

            }
        }
//        .foregroundColor(.white)
    }
    
    func fetchEpisodeList(){
           
           Database.database().reference().child("shows").child(show.id).observe(.value) { snapshot in
            
            modelData.episodes = []
               for child in snapshot.children.allObjects as! [DataSnapshot] {
               do {
                   let model = try FirebaseDecoder().decode(Episode.self, from: child.value as Any)
                   print(model)
                modelData.episodes.append(model)
                   UserDefaults.standard.set(false, forKey: "load")
                   NotificationCenter.default.post(name: NSNotification.Name("load"), object: nil)
               } catch let error {
                   print(error)
               }
                   
                   
             }
               
           }
       }
}
enum CustomTab: String {
    case episodes = "EPISODES"
    case trailer = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

//struct CustomTabSwitcher_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//            CustomTabSwitcher(tabs: [.episodes, .trailer, .more], movie: exampleMovie1, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
//        }
//    }
//}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
