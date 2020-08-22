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
        
//        mainViewModel.currentUser.picture

        NavigationView {
            
            VStack {
                                
//                if mainViewModel.stateView  == .success {
                CurrentUserInfo(data: mainViewModel.currentUser, withURL: mainViewModel.currentUser.picture)
                    Spacer()
//                }
                
//                Image(mainViewModel.currentUser.picture)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200.0,height:200)
//                    .clipShape(Circle())
                
//                mainViewModel.currentUser

            }
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
