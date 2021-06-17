//
//  SearchBar.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//
import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false
        
    var body: some View {
        HStack {
            
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
//import SwiftUI
//
//struct SearchBar: View {
//
//    @Binding var text: String
//
//    @State private var isEditing = true
//
//    @Binding var isLoading: Bool
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//            Color.graySearchBackground
//                .frame(width: 270, height: 36)
//                .cornerRadius(8)
//
//            HStack {
//                Image(systemName: "magnifyingglass")
//                    .foregroundColor(Color.graySearchText)
//                    .padding(.leading, 10)
//
//                TextField("Search", text: $text)
//                    .padding(7)
//                    .padding(.leading, -7)
//                    .padding(.horizontal, 10)
//                    .background(Color.graySearchBackground)
//                    .cornerRadius(8)
//                    .foregroundColor(.white)
//                    .onTapGesture(perform: {
//                        isEditing = true
//                    })
//                    .animation(.default)
//
//                if !text.isEmpty {
//                    if isLoading {
//                        Button(action: {
//                            text = ""
//                        }, label: {
////                            ActivityIndicator(style: .medium, animate: .constant(true))
////                                .configure {
////                                    $0.color = .white
////                                }
//                        })
//                        .padding(.trailing, 32)
//                        .frame(width: 35, height: 35)
//
//                    } else {
//                        Button(action: {
//                            text = ""
//                        }, label: {
//                            Image(systemName: "xmark.circle.fill")
//                                .foregroundColor(.graySearchText)
//                                .frame(width: 35, height: 35)
//                        })
//                        .padding(.trailing, 18)
//                    }
//                }
//
//                if isEditing {
//                    Button(action: {
//                        text = ""
//                        isEditing = false
////                        hideKeyboard()
//                    }, label: {
//                        Text("Cancel")
//                            .foregroundColor(.white)
//                    })
//                    .padding(.trailing, 10)
//                    .transition(.move(edge: .trailing))
//                    .animation(.default)
//                }
//
//
//            }
//        }
//    }
//}
//

