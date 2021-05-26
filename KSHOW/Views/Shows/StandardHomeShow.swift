//
//  StandardHomeShow.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI
import Kingfisher

struct StandardHomeShow: View {
    var show: Show
    
    var body: some View {
        GeometryReader { proxy in
            KFImage(URL(string: show.thumbnailImageUrl)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
        }
    }
}

//struct StandardHomeShow_Previews: PreviewProvider {
//    static var previews: some View {
//        StandardHomeShow(movie: exampleMovie1)
//    }
//}
