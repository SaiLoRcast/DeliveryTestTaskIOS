//
//  ContentView.swift
//  DeliveryTestTask
//
//  Created by Константин Полыгалов on 20.08.2020.
//  Copyright © 2020 Константин Полыгалов. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var mainViewModel = MainViewModel()

    var body: some View {
        NavigationView {
            
            VStack {

//                if mainViewModel.stateView  == .success {
                CurrentUserInfo(data: mainViewModel.currentUser, dataDeliveryTo: mainViewModel.deliveryToUserUser, withURL: mainViewModel.currentUser.picture)
                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text(""))
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
