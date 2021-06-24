//
//  SearchView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI
//import Foundation
//import CoreData

//enum Priority: Int {
//    case low = 0
//    case normal = 1
//    case high = 2
//}

//struct ToDoItem: Identifiable {
//    var id = UUID()
//    var name: String = ""
//    var priorityNum: Priority = .normal
//    var isComplete: Bool = false
//}


struct SearchView: View {
        
//    private var todoItems = [ ToDoItem(name: "Meet Eddie for lunch"),
//                              ToDoItem(name: "Buy toilet paper"),
//                              ToDoItem(name: "Write a new tutorial"),
//                              ToDoItem(name: "Buy two bottles of wine"),
//                              ToDoItem(name: "Prepare the presentation deck")
//                                ]
    @EnvironmentObject var modelData: ModelData
    
    @State private var searchText = ""
    @State private var showingActionSheet = false
    @State private var searchByCast = true
    @State private var searchByShow = true
    @State var isPresentedCast = false
    @State var isPresentedShow = false
    
    var body: some View {
        
//        ZStack {
        NavigationView{
            
        
            VStack {
                HStack {
//                    Text("Search")
//                        .font(.system(size: 40, weight: .black, design: .rounded))
                        
                    Spacer()
                    Text("Filter")
                    Button(action: {
                        // show new task view
                        showingActionSheet = true
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.largeTitle)
                            .foregroundColor(.purple)
                    }
                }
                
                SearchBar(text: $searchText)
//                List(modelData.shows.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { item in
////                    Text(item.name)
//                        NavigationLink(destination: ShowDetailView(show: item)){
////                            ShowRow(show: item)
//                            RowItem(imageUrl: item.thumbnailImageUrl, name: item.name)
//
//                        }
//                }
                List{
                    if searchByShow {
                        ForEach(modelData.shows.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }))
                        {item in
                            RowItemShow(show: item)

                        }
                    }
                    if searchByCast {
                        ForEach(modelData.casts.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }))
                        {item in
                            RowItemCast(cast: item)

                        }
                    }
                    
                }
                
               
                
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            
    }.actionSheet(isPresented: $showingActionSheet) {
        ActionSheet(title: Text("Change Filter"), message: Text("Select search type"), buttons: [
            .default(Text("Star Name")) {
                searchByShow = false
                searchByCast = true
                
            },
            .default(Text("Show Name")) {
                searchByCast = false
                searchByShow = true
            },
            .default(Text("Clear Filter")) {
                searchByCast = true
                searchByShow = true
            },
            .cancel()
        ])
    }
//        }
    }

}
//struct SearchView: View {
////    @ObservedObject var vm = SearchVM()
//
//    @State private var searchText = ""
//
////    @State private var movieDetailToShow: Movie? = nil
//
//    var body: some View {
//
//        let searchTextBinding = Binding {
//            return searchText
//        } set: {
//            searchText = $0
////            vm.updateSearchText(with: $0)c
//        }
//
//        return ZStack {
//
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//
//            VStack {
//                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
//                    .padding()
//
//                ScrollView {
//                    if vm.isShowingPopularMovies {
//                        PopularList(movies: vm.popularMovies, movieDetailToShow: $movieDetailToShow)
//                    }
//
//                    if vm.viewState == .empty {
//                        Text("Your search did not have any results.")
//                            .bold()
//                            .padding(.top, 150)
//                    } else if vm.viewState == .ready && !vm.isShowingPopularMovies {
//
//                        VStack {
//                            HStack {
//                                Text("Movies & TV")
//                                    .bold()
//                                    .font(.title3)
//                                    .padding(.leading, 12)
//                                Spacer()
//                            }
//
//                            SearchResultsGrid(movies: vm.searchResults, movieDetailToShow: $movieDetailToShow)
//                        }
//
//                    }
//
//                }
//
//                Spacer()
//            }
//
////            if movieDetailToShow != nil {
////                MovieDetailsView(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
////            }
//        }
//        .foregroundColor(.white)
//    }
////     Text("Hello")
//}
//
////struct SearchView_Previews: PreviewProvider {
////    static var previews: some View {
////        SearchView()
////    }
////}
//
//struct PopularList: View {
//    var shows: [Show]
//
////    @Binding var movieDetailToShow: Movie?
//
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Popular Searches")
//                    .bold()
//                    .font(.title3)
//                    .padding(.leading, 12)
//                Spacer()
//            }
            
//            LazyVStack {
//                ForEach(movies, id: \.id) { movie in
//                    PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
//                        .frame(height: 75)
//                }
//            }
//        }
//    }
//}
//}
