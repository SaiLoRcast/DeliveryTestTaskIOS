//
//  ImageLoader.swift
//  DeliveryTestTask
//
//  Created by Admin on 22.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
var didChange = PassthroughSubject<Data, Never>()
var data = Data() {
    didSet {
        didChange.send(data)
    }
}

init(urlString:String) {
    guard let url = URL(string: urlString) else { return }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else { return }
        DispatchQueue.main.async {
            self.data = data
        }
    }
    task.resume()
}
}
