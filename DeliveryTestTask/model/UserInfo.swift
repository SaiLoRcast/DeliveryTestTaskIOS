//
//  UserInfo.swift
//  DeliveryTestTask
//
//  Created by Константин Полыгалов on 21.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import Foundation

struct UserInfo: Codable {
    
    let id: String
    let title: String
    let firstName: String
    let lastName: String
    let gender: String
    let email: String
    let dateOfBirth: String
    let registerDate: String
    let phone: String
    let picture: String
    let location: Location
    
    static func emptyInit() -> UserInfo {
           return UserInfo(
               id: "",
               title: "",
               firstName: "",
               lastName: "",
               gender: "",
               email: "",
               dateOfBirth: "",
               registerDate: "",
               phone: "",
               picture: "",
               location: Location.emptyInit()
            )
       }
}
