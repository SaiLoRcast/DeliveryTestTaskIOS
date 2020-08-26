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
    }

    var body: some View {
        
         List {
            ForEach(ordersListViewModel.getOrdersList()) {
                ResultRow($0)
            }
        }
       
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
                    
                    HStack{
                        
                        Image("calendar")
                            .padding(12)
                            .foregroundColor(Color("button"))
                        
                        Text(data.dateDeliveryFrom)
                            .fontWeight(.regular)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    
                }
                
                Image("arrow_down")
                
                VStack{
                    Text(data.addressDeliveryTo)
                    
                    HStack{
                        
                        Image("calendar")
                            .padding(12)
                            .foregroundColor(Color("button"))
                        
                        Text(data.dateDeliveryTo)
                            .fontWeight(.regular)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    .padding(16)
                    
                }
                
                HStack(){
                    
                    Spacer()
                    
                    Text("\(data.cost) ₽")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.trailing, 16)
                        .foregroundColor(Color("button"))
                }
                .padding(16)
            }
        }
    }
}
