//
//  OrdersList.swift
//  DeliveryTestTask
//
//  Created by Admin on 24.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import Foundation
import SwiftUI

struct OrdersList: View {
    
    @ObservedObject var ordersListViewModel = OrdersListViewModel()

    init() {
        UINavigationBar.setAnimationsEnabled(false)
        print("OrdersList call")
    }

    var body: some View {
        
         List {
            ForEach(ordersListViewModel.getOrdersList()) {
                ResultRow($0)
            }
        }
         .background(Color("background"))
         .navigationBarTitle(Text("Мои заказы"), displayMode: .inline)

    }
    
    struct ResultRow: View {
        
        let data: Order
        
        init(_ data: Order) {
            self.data = data
        }
        
        var body: some View {
            VStack(alignment: HorizontalAlignment.leading){
                
                VStack(alignment: HorizontalAlignment.leading){
                    Text(data.addressDeliveryFrom)
                        .padding(.top ,15)
                        .padding(.leading ,21)
                    
                    HStack{
                        
                        Image("calendar")
                            .padding(.leading ,21)
                            .foregroundColor(Color("button"))
                        
                        Text(data.dateDeliveryFrom)
                            .fontWeight(.regular)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    
                }
                
                Image("arrow_down")
                    .padding(.top, 13)
                    .padding(.leading ,21)
                    .padding(.bottom,10)
                
                VStack{
                    Text(data.addressDeliveryTo)
                        .padding(.leading ,21)

                    HStack{
                        
                        Image("calendar")
                            .padding(.leading, 21)
                            .foregroundColor(Color("button"))
                        
                        Text(data.dateDeliveryTo)
                            .fontWeight(.regular)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    
                }
                
                HStack(){
                    
                    Spacer()
                    
                    Text("\(data.cost) ₽")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.trailing, 16)
                        .foregroundColor(Color("button"))
                }
                
                Spacer()
                    .frame(height: 16)
            }
            .background(Color.white)
        }
    }
}
