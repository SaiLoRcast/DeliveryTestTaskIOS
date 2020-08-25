//
//  UserOrder.swift
//  DeliveryTestTask
//
//  Created by Admin on 25.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import Foundation

struct UserOrder: Codable {
    
    let fromLocation: String
    let fromDate: String
    let toLocation: String
    let toDate: String
    let totalCost: String
    
    static func emptyInit() -> UserOrder {
           return UserOrder(
               fromLocation: "",
               fromDate: "",
               toLocation: "",
               toDate: "",
               totalCost: ""

            )
       }
}
