//
//  Location.swift
//  DeliveryTestTask
//
//  Created by Константин Полыгалов on 21.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import Foundation

struct Location: Codable {

    let street: String
    let city: String
    let state: String
    let country: String
    let timezone: String

    static func emptyInit() -> Location {
        return Location(
            street: "",
            city: "",
            state: "",
            country: "",
            timezone: ""
        )
    }
}
