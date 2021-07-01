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
    @State private var showingSheet = false
    @State private var searchByCast = true
    @State private var searchByShow = true
    @State var isPresentedCast = false
    @State var isPresentedShow = false
    
    var body: some View {
        

            
        
            VStack {
                HStack {
//                    Text("Search")
//                        .font(.system(size: 40, weight: .black, design: .rounded))
                        
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
                //                UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                                
                            },
                            .default(Text("Show Name")) {
                                searchByCast = false
                                searchByShow = true
                //                UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                            },
                            .default(Text("Clear Filter")) {
                                searchByCast = true
                                searchByShow = true
                //                UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                            },
                            .cancel(){
                //                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()

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

