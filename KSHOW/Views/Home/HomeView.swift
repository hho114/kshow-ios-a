//
//  HomeView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI

struct HomeView: View {
//    let vm = HomeVM()
    let screen = UIScreen.main.bounds
    @EnvironmentObject var modelData: ModelData
    @State private var showDetail: Show? = nil
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    @State private var showTopRowSelection: Bool = false
    @State private var showGenreSelection: Bool = false
    
//    @Binding var showPreviewFullscreen: Bool
//    @Binding var previewStartingIndex: Int
    
    var body: some View {
        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    TopMenuButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showTopRowSelection: $showTopRowSelection, showGenreSelection: $showGenreSelection)
                    
                    TopShowPreview(show: modelData.features[0])
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    
                    CastRow(
                        
//                        showPreviewFullscreen: $showPreviewFullscreen,
//                        previewStartingIndex: $previewStartingIndex
                    )
                    
                    CategoryHome()
//                    HomeStack(vm: vm, topRowSelection: topRowSelection, genre: homeGenre, movieDetailToShow: $movieDetailToShow)
                }
            }
//            if showDetail != nil {
//                ShowDetailView(show: showDetail!)
//                    .animation(.easeIn)
//                    .transition(.opacity)
//            }
            
//            if showTopRowSelection {
//                Group {
//                    Color.black.opacity(0.9)
//
//                    VStack(spacing: 40) {
//                        Spacer()
//                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in
//                            Button(action: {
//                                topRowSelection = topRow
//                                showTopRowSelection = false
//                            }, label: {
//                                if topRow == topRowSelection {
//                                    Text("\(topRow.rawValue)")
//                                        .bold()
//                                } else {
//                                    Text("\(topRow.rawValue)")
//                                        .foregroundColor(.gray)
//                                }
//                            })
//                        }
//
//                        Spacer()
//                        Button(action: {
//                            showTopRowSelection = false
//                        }, label: {
//                            Image(systemName: "xmark.circle.fill")
//                                .font(.system(size: 40))
//                        })
//                        .padding(.bottom, 30)
//                    }
//                }
//                .edgesIgnoringSafeArea(.all)
//                .font(.title2)
//            }
            
//            if showGenreSelection {
//                Group {
//                    Color.black.opacity(0.9)
//
//                    VStack(spacing: 40) {
//
//                        ScrollView {
//                            Spacer()
//                            ForEach(vm.allGenres, id: \.self) { genre in
//                                Button(action: {
//                                    homeGenre = genre
//                                    showGenreSelection = false
//                                }, label: {
//                                    if genre == homeGenre {
//                                        Text("\(genre.rawValue)")
//                                            .bold()
//                                    } else {
//                                        Text("\(genre.rawValue)")
//                                            .foregroundColor(.gray)
//                                    }
//                                })
//                                .padding(.bottom, 40)
//                            }
//                        }
//
//                        Spacer()
//                        Button(action: {
//                            showGenreSelection = false
//                        }, label: {
//                            Image(systemName: "xmark.circle.fill")
//                                .font(.system(size: 40))
//                        })
//                        .padding(.bottom, 30)
//                    }
//
//                }
//                .edgesIgnoringSafeArea(.all)
//                .font(.title2)
//            }
        }
        .foregroundColor(.white)
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(showPreviewFullscreen: .constant(false), previewStartingIndex: .constant(0))
//    }
//}

struct TopMenuButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    @Binding var showTopRowSelection: Bool
    @Binding var showGenreSelection: Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("kshow_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                
                Spacer()
                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                Spacer()
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                Spacer()
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
        default:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("kshow_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                
                HStack(spacing: 20) {
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 6))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    Spacer()
                }
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
        
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Thriller
}

