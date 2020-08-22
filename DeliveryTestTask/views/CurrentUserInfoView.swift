//
//  CurrentUserInfoView.swift
//  DeliveryTestTask
//
//  Created by Константин Полыгалов on 21.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import Foundation
import URLImage
import SwiftUI

struct CurrentUserInfo: View {
    
    let data: UserInfo
    
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()

    init(data:UserInfo, withURL url:String) {
        self.data = data
        imageLoader = ImageLoader(urlString:url)
    }
    
    var userName: String {
        return data.firstName
    }
    
    var body: some View {
    
        VStack {
            Image(uiImage: image)
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width:100, height:100)
                           .onReceive(imageLoader.didChange) { data in
                           self.image = UIImage(data: data) ?? UIImage()
                   }
//            Image(data.picture)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200.0,height:200)
//                .clipShape(Circle())
               
            Text(data.firstName + data.lastName)
                .font(.largeTitle)
                .fontWeight(.medium)
            Text(data.firstName + data.lastName)
                .font(.body)
                .fontWeight(.light)
                .padding(.bottom, 4)

        }
        .padding(.vertical, 24)
    }
}
