//
//  SearchView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI



struct SearchView: View {
        
    @EnvironmentObject var modelData: ModelData
    
    @State private var searchText = ""
    @State private var showingActionSheet = false
    @State private var showingSheet = false
    @State private var searchByCast = true
    @State private var searchByShow = true
    @State var isPresentedCast = false
    @State var isPresentedShow = false
    
    var body: some View {
        

            
        
            VStack {
                HStack {
                        
                    Spacer()
                    Text("Filter")
                    Button(action: {
                        // show new task view
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        showingActionSheet = true
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.largeTitle)
                            .foregroundColor(.purple)
                    }.actionSheet(isPresented: $showingActionSheet) {
                        ActionSheet(title: Text("Change Filter"), message: Text("Select search type"), buttons: [
                            .default(Text("Cast Name")) {
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
                            .cancel(){

                                        }
                        ])
                    }
                }
                
                SearchBar(text: $searchText)

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

    }

}

