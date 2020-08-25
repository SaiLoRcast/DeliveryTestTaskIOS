//
//  Weight.swift
//  DeliveryTestTask
//
//  Created by Admin on 25.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import Foundation

struct Weight: Identifiable {
    
    var id = UUID()
    var position: Int
    var baseCost: Int
    var weight: String
    
}
