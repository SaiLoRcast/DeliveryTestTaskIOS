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
        
        VStack() {
            
            HStack{
                
                Spacer ()
                
                NavigationLink(destination: OrdersList()) {
                    Image("box")
                        .foregroundColor(Color("button"))
                        .aspectRatio(contentMode: .fit)
                        .padding(8)
                    //                    .alignmentGuide(HorizontalAlignment.trailing, computeValue: {d in -100})
                    //                    .frame(width: 28,height: 28,alignment: .trailing)
                    
                }
                
            }
            
            Spacer()
                 .frame(height: 21)
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:120, height:120)
                .clipShape(Circle())
                .onReceive(imageLoader.didChange) { data in
                    self.image = UIImage(data: data) ?? UIImage()
            }
            
            Spacer()
                .frame(height: 26)
            
            Text("\(data.firstName) \(data.lastName)")
                .font(.largeTitle)
                .fontWeight(.medium)
            
            Text("+\(data.phone)")
                .font(.none)
                .fontWeight(.light)
            
            //            Spacer()
            //                   .frame(height: 200)
            
            VStack{
                
                Spacer().frame(height: 33)
                
                HStack{
                    
                    Image("box_1")
                    .aspectRatio(contentMode: .fit)
                    .padding(8)
                    
                    Text("Последний адрес достваки")
                        .font(.none)
                        .fontWeight(.light)
                }
                
                Text("\(data.location.country), \(data.location.state), \(data.location.city), \(data.location.street)")
                    .font(.none)
                    .fontWeight(.light)
            
            }
            .background(Color("last_delivery_background"))
            .cornerRadius(30)
            .frame(maxWidth: .infinity)
            
                Button(action: {
                    print("!")
                    
                }) {
                    NavigationLink(destination: OrdersList()) {

                    Text("Создать заказ")
                        .fontWeight(.medium)
                        .font(.none)
                        .frame(maxWidth: .infinity)
                        .padding()
                        
                        .foregroundColor(.white)
                        .background(Color("button"))
                        .cornerRadius(20)
                }
            
            }
        }
        //        .padding(.vertical, 24)
    }
}
