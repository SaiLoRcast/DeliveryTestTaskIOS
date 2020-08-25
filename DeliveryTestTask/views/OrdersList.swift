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

    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        VStack {
            Text("asd")

        }

        .navigationBarTitle(Text("Мои заказы"), displayMode: .inline)

    }
    
}
