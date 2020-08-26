//
//  Order.swift
//  DeliveryTestTask
//
//  Created by Admin on 26.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import RealmSwift
import Foundation

class Order: Object, Identifiable {
    
    @objc dynamic var id : Int = 0
    
    @objc dynamic var addressDeliveryFrom: String = ""
    @objc dynamic var dateDeliveryFrom: String = ""
    @objc dynamic var addressDeliveryTo: String = ""
    @objc dynamic var dateDeliveryTo: String = ""
    @objc dynamic var cost: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
