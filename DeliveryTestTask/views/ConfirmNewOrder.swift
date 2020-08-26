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
    
    @State var selection: Int? = nil
    
    var body: some View {
        
        VStack() {
                                        
                VStack(alignment: .leading){
                    
                    Text("\(addressDeliveryFrom)")
                        .font(.none)
                        .fontWeight(.light)
                        .padding(.top ,15)
                        .padding(.leading ,21)
                    
                    HStack{
                        
                        Image("calendar")
                            .padding(.leading ,21)
                            .foregroundColor(Color("button"))
                        
                        Text(dateDeliveryFrom)
                            .font(.none)
                            .fontWeight(.light)
                            .fontWeight(.regular)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                        
                        
                    }
                    
                    Image("arrow_down")
                        .padding(.top, 13)
                        .padding(.leading ,21)
                        .padding(.bottom,10)
                    
                    Text(addressDeliveryTo)
                        .font(.none)
                        .fontWeight(.light)
                        .padding(.leading ,21)
                    
                    HStack{
                        
                        Image("calendar")
                            .padding(.leading, 21)
                            .foregroundColor(Color("button"))
                        
                        Text(dateDeliveryTo)
                            .font(.none)
                            .fontWeight(.light)
                            .fontWeight(.regular)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                        
                    }
                    
                    
                    
                    
                }
            HStack(){
                
                Spacer()
                
                Text("\(finalCost) ₽")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.trailing, 16)
                    .foregroundColor(Color("button"))
            }
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
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .foregroundColor(Color.black)
                    }
                }
                
                Spacer()
                    .frame(width: 16)
                
                NavigationLink(destination: OrdersList(),tag: 1, selection: $selection) {
                    Button(action: {
                        print("Save!")
                        self.selection = 1
                        self.saveDataIntoDatabase()
                    }) {
    //
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
    
    func saveDataIntoDatabase() {
        ordersListViewModel.submit(addressDeliveryFrom, dateDeliveryFrom, addressDeliveryTo, dateDeliveryFrom, finalCost, completionHandler: { (error) in
            print(error)
            
        })
    }
    
}
