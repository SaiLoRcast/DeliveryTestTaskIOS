//
//  OrdersListViewModel.swift
//  DeliveryTestTask
//
//  Created by Admin on 25.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import Foundation
import RealmSwift

typealias OrderSubmitCompletionClosure = (_ error: String) -> Void

class OrdersListViewModel: ObservableObject {
    
    var realm : Realm!
       
    init() {
        realm = try! Realm()
    }
    
    func submit( _ addressDeliveryFrom: String,
                 _ dateDeliveryFrom: String,
                 _ addressDeliveryTo: String,
                 _ dateDeliveryTo: String,
                 _ cost: Int,
                 completionHandler: @escaping OrderSubmitCompletionClosure) {
        
        let newOrder = create(addressDeliveryFrom: addressDeliveryFrom,
                                  dateDeliveryFrom: dateDeliveryFrom,
                                  addressDeliveryTo: addressDeliveryTo,
                                  dateDeliveryTo: dateDeliveryTo,
                                  cost: cost)
        
        do {
            try realm.write {
                realm.add(newOrder)
                completionHandler("")
                print("saved")
            }
        } catch let error as NSError {
            print("\(error)")
            completionHandler(error.localizedDescription)
        }
    }

    func getOrdersList() -> Results<Order> {
        let ordersList = realm.objects(Order.self)
        return ordersList
    }
 
    func create(addressDeliveryFrom : String,
                dateDeliveryFrom: String,
                addressDeliveryTo: String,
                dateDeliveryTo: String,
                cost: Int) -> Order {

        let lastID = realm.objects(Order.self).map{$0.id}.last ?? 0
        
        let order = Order()
        order.id = lastID + 1
        order.addressDeliveryFrom = addressDeliveryFrom
        order.dateDeliveryFrom = dateDeliveryFrom
        order.addressDeliveryTo = addressDeliveryTo
        order.dateDeliveryTo = dateDeliveryTo
        order.cost = cost
        return order
    }
}
