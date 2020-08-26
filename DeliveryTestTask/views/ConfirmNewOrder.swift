//
//  ConfirmNewOrder.swift
//  DeliveryTestTask
//
//  Created by Admin on 26.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import Foundation
import SwiftUI

struct ConfirmNewOrder: View {
    
    @ObservedObject var mainViewModel = MainViewModel()
    @ObservedObject var ordersListViewModel = OrdersListViewModel()

    
    let addressDeliveryFrom: String
    let dateDeliveryFrom: String
    let addressDeliveryTo: String
    let dateDeliveryTo: String
    let finalCost: Int
    
    init(addressDeliveryFrom:String, dateDeliveryFrom: String, addressDeliveryTo:String, dateDeliveryTo:String, finalCost: Int) {
        self.addressDeliveryFrom = addressDeliveryFrom
        self.dateDeliveryFrom = dateDeliveryFrom
        self.addressDeliveryTo = addressDeliveryTo
        self.dateDeliveryTo = dateDeliveryTo
        self.finalCost = finalCost
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Spacer()
                .frame(height: 16)
            
            VStack{
                Text(addressDeliveryFrom)
                
                HStack{
                    
                    Image("calendar")
                        .padding(12)
                        .foregroundColor(Color("button"))
                    
                    Text(dateDeliveryFrom)
                        .fontWeight(.regular)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(16)
                
            }
            
            Image("arrow_down")
            
            VStack{
                Text(addressDeliveryTo)
                
                HStack{
                    
                    Image("calendar")
                        .padding(12)
                        .foregroundColor(Color("button"))
                    
                    Text(dateDeliveryTo)
                        .fontWeight(.regular)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(16)
                
            }
            
            HStack(){
                
                Spacer()
                
                Text("\(finalCost) ₽")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.trailing, 16)
                    .foregroundColor(Color("button"))
            }
            .padding(16)
            
            Spacer()
            
            HStack(){
                
                Spacer()
                    .frame(width: 32)
                
                Button(action: {
                    print("")
                }) {
                    NavigationLink(destination: CurrentUserInfo(data: mainViewModel.currentUser, dataDeliveryTo: mainViewModel.deliveryToUserUser, withURL: mainViewModel.currentUser.picture)) {
                        Text("Отмена")
                            .fontWeight(.regular)
                            .font(.system(size: 17))
                            .padding(8)
                            .frame(width: 208,height: 62)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 5)
                            )
                            .foregroundColor(Color.black)
                    }
                }
                
                Spacer()
                    .frame(width: 16)
                
                Button(action: {
                    print("")
                }) {
                    NavigationLink(destination: OrdersList()) {
                        Text("Подтвердить")
                            .fontWeight(.regular)
                            .font(.system(size: 17))
                            .padding(8)
                            .frame(width: 208,height: 62)
                            .background(Color("next_button_color"))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    }
                }
                
                Spacer()
                    .frame(width: 32)
            }
        }
        .navigationBarTitle(Text("Подтверждение заказа"), displayMode: .inline)
        
    }
    
}
