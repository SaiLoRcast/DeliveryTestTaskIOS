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
    let dataDeliveryTo: UserInfo

    
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    
    init(data:UserInfo, dataDeliveryTo: UserInfo, withURL url:String) {
        self.data = data
        self.dataDeliveryTo = dataDeliveryTo
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
            
            Text("\(data.title). \(data.firstName) \(data.lastName)")
                .font(.title)
                .fontWeight(.medium)
            
            Text("+\(data.phone)")
                .font(.none)
                .fontWeight(.light)
            
            Spacer()
                .frame(height: 37)
            
            VStack(alignment: .leading){
                                
                HStack(alignment: .center){
                    
                    Image("box_1")
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 20)
                    .padding(.top, 32)
                
                    Text("Последний адрес достваки")
                        .font(.none)
                        .fontWeight(.regular)
                        .padding(.top, 32)
                    
                    Spacer()

                }
                .frame(maxWidth: .infinity)

                Text("\(data.location.country), \(data.location.state), \(data.location.city), \(data.location.street)")
                    .font(.none)
                    .fontWeight(.light)
                    .padding(.leading, 52)
                    .padding(.trailing, 48)
                    .padding(.bottom, 32)
            
            }
            .background(Color("last_delivery_background"))
            .cornerRadius(30)
            
            Spacer()
            
            HStack{
                
                Spacer()
                    .frame(width: 16)

                Button(action: {
                    print("!")
                }) {
                    NavigationLink(destination: NewOrder(data:data, dataDeliveryTo:dataDeliveryTo)) {
                        Text("Создать заказ")
                            .fontWeight(.medium)
                            .font(.none)
                            .frame(maxWidth: .infinity)
                            .padding(21)
                            .foregroundColor(.white)
                            .background(Color("button"))
                            .cornerRadius(20)
                    }
                    
                Spacer()
                    .frame(width: 16)
                }
            }            
        }
    }
}
